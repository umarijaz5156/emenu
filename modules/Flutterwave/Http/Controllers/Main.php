<?php

namespace Modules\Flutterwave\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;


use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use App\Order;
use App\Restorant;

class Main extends Controller
{

     /**
     * @var Order order - The order
     */
    public $order;

    public function payscreen($orderid){
        $order=Order::findOrFail($orderid);
        $this->order=$order;

         //System setup 
         $public_key=config('flutterwave.public_key');
 
         //Setup based on vendor
         if(config('flutterwave.useVendor')){
             $public_key=$this->order->restorant->getConfig('flutterwave_public_key','');
         }

        
        \App\Services\ConfChanger::switchCurrency($this->order->restorant);

        return view('flutterwave::payscreen',[
            'order'=>$order,
            'public_key'=>$public_key,
            'amount'=>$this->order->order_price_with_discount+$this->order->delivery_price,
            'currency'=>config('settings.cashier_currency')
        ]);

    }

    //callback after payment
    public function executePayment(Request $request)
    {
        
        $order= Order::findOrFail($_GET['tx_ref']);

        if($request->has('status')&&$request->status!="success"){
            return redirect()->route('order.cancel', ['order' => $order]);
        }


        $order->payment_status = 'paid';

        $order->update();

        return redirect()->route('order.success', ['order' => $order]);

    }

   
}
