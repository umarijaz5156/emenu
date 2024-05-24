<?php

namespace Modules\Razorpay\Http\Controllers;

require __DIR__.'/../../vendor/autoload.php';

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use App\Order;

use Razorpay\Api\Api;
use Session;
use Redirect;
use App\Restorant;

class Main extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function pay( $order)
    {
        $order=Order::findOrFail($order);
        $totalValue=$order->order_price_with_discount+$order->delivery_price;
        $data=[
            'order'=>$order,
            'amount'=>intval(($totalValue)*100),
            'button'=>"Pay ".$totalValue." INR",
            'name'=>$order->restorant->name
        ];


        //GET THE KEY
        //System setup 
        $key=config('razorpay.key');

        //Setup based on vendor
        if(config('razorpay.useVendor')){
            $key=$order->restorant->getConfig('razorpay_key','');
        }
        $data['key']=$key;

        return view('razorpay::pay',$data);
    }

    public function executePayment(Request $request){
        $input = $request->all();   
    
        //GET THE KEY
        //System setup 
        $key=config('razorpay.key');
        $secret=config('razorpay.secret');

       

        //Setup based on vendor
        if(config('razorpay.useVendor')){
            $vendor = Restorant::findOrFail($_GET['vendor_id']);
            $key=$vendor->getConfig('razorpay_key','');
            $secret=$vendor->getConfig('razorpay_secret','');
        }


        $api = new Api($key, $secret);
        $payment = $api->payment->fetch($input['razorpay_payment_id']);

        if(count($input)  && !empty($input['razorpay_payment_id'])) 
        {
            try 
            {
                $api->payment->fetch($input['razorpay_payment_id'])->capture(array('amount'=>$payment['amount'])); 

            } 
            catch (\Exception $e) 
            {
                return  $e->getMessage();
                \Session::put('error',$e->getMessage());
                return redirect()->back();
            }            
        }
        $order=Order::findOrFail($request->order_id);
        $order->payment_status = 'paid';

        $order->update();
        return redirect()->route('order.success', ['order' => $order]);
    }

    
}
