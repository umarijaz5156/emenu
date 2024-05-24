<?php

namespace Modules\Iyzico\Http\Controllers;

require __DIR__.'/../../vendor/autoload.php';

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;


use Iyzipay\Options;
use Iyzipay\Request\CreatePayWithIyzicoInitializeRequest;
use Iyzipay\Model\PayWithIyzicoInitialize;

use App\Order;
use App\Restorant;

class Main extends Controller
{

    public function showUserForm($order)
    {
        return view('iyzico::userform',['order'=>$order,'user'=>auth()->user()]);
    }



    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function pay($order)
    {
        $order=Order::findOrFail($order);
        $totalValue=$order->order_price_with_discount+$order->delivery_price;

        $options = new Options();

        

        if(config('iyzico.useVendor')){
            //Vendor setup
            $options->setApiKey($order->restorant->getConfig('iyzico_api_key',''));
            $options->setSecretKey($order->restorant->getConfig('iyzico_api_secret',''));
            //Set mode
            if($order->restorant->getConfig('iyzico_mode','sandbox')=="sandbox"){
                $options->setBaseUrl("https://sandbox-api.iyzipay.com");
            }else{
                $options->setBaseUrl("https://api.iyzipay.com");
            }
        }else{
            //System setup
            $options->setApiKey(config('iyzico.api_key',''));
            $options->setSecretKey(config('iyzico.api_secret',''));
            //Set mode
            if(config('iyzico.mode')=="sandbox"){
                $options->setBaseUrl("https://sandbox-api.iyzipay.com");
            }else{
                $options->setBaseUrl("https://api.iyzipay.com");
            }

        }

        $request = new CreatePayWithIyzicoInitializeRequest();
        $request->setLocale(\Iyzipay\Model\Locale::TR);
        $request->setConversationId($order->id);
        $request->setPrice($totalValue);
        $request->setPaidPrice($totalValue);
        $request->setCurrency(\Iyzipay\Model\Currency::TL);
        $request->setPaymentGroup(\Iyzipay\Model\PaymentGroup::PRODUCT);
        $request->setCallbackUrl(route('iyzico.execute',['order'=>$order->id]));

        $buyer = new \Iyzipay\Model\Buyer();
        $buyer->setId($_POST['idnumber']);
        $buyer->setName($_POST['name']);
        $buyer->setSurname($_POST['surname']);
        $buyer->setRegistrationAddress($_POST['address']);
        $buyer->setZipCode($_POST['zipcode']);
        $buyer->setCity($_POST['city']);
        $buyer->setCountry($_POST['country']);
        $buyer->setEmail($_POST['email']);
        $buyer->setIdentityNumber($_POST['idnumber']);
        $request->setBuyer($buyer);

        $billingAddress = new \Iyzipay\Model\Address();
        $billingAddress->setContactName($_POST['name']);
        $billingAddress->setCity($_POST['city']);
        $billingAddress->setCountry($_POST['country']);
        $billingAddress->setAddress($_POST['address']);
        $billingAddress->setZipCode($_POST['zipcode']);
        $request->setBillingAddress($billingAddress);
        $request->setShippingAddress($billingAddress);

        

        $basketItems = array();
        $firstBasketItem = new \Iyzipay\Model\BasketItem();
        $firstBasketItem->setId($order->id);
        $firstBasketItem->setName("Order #".$order->id);
        $firstBasketItem->setPrice($totalValue);
        $firstBasketItem->setItemType(\Iyzipay\Model\BasketItemType::PHYSICAL);
        $firstBasketItem->setCategory1("Food");
        $basketItems[0] = $firstBasketItem;
        $request->setBasketItems($basketItems);
        

        $payment = PayWithIyzicoInitialize::create($request, $options);
        if($payment->getStatus()!="success"){
            \Session::put('error',$payment->getErrorMessage()."-----");
            return redirect()->route('iyzico.userform', ['order' => $order->id])->withInput()->withError("ERRROR");
        }
        return redirect($payment->getPayWithIyzicoPageUrl());
    }

    public function executePayment($order){
        
        $order=Order::findOrFail($order);
        //dd($order);

        $order->payment_status = 'paid';
        $order->update();
        return redirect()->route('order.success', ['order' => $order->id]);
        
    }
    
}
