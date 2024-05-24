<?php

namespace Modules\Paystack\Http\Controllers;
use Illuminate\Routing\Controller;
use App\Order;
use App\Restorant;
use Unicodeveloper\Paystack\Paystack;

class Main extends Controller
{
    //Paystack callback after payment
    public function handleGatewayCallback($vendor)
    {

        if(config('paystack.useVendor')){
            config(['paystack.secretKey' => Restorant::findOrFail($vendor)->getConfig('paystack_secretKey','')]);
        }

        $paymentDetails = (new Paystack())->getPaymentData();
        

        //regular payment
        if ($paymentDetails['status'] && !$paymentDetails['data']['plan_object']) {
            $order = Order::findOrFail($paymentDetails['data']['metadata']['order_id']);
            $order->payment_status = 'paid';

            $order->update();

            return redirect()->route('order.success', ['order' => $order]);
        }
        //subscribtion
        elseif ($paymentDetails['status'] && $paymentDetails['data']['plan_object']) {
            $plan_id = $paymentDetails['data']['metadata']['plan_id'];
            $transaction_id = $paymentDetails['data']['id'];

            //Assign user to plan
            auth()->user()->plan_id = $plan_id;
            auth()->user()->paystack_trans_id = $transaction_id;
            auth()->user()->update();

            return redirect()->route('plans.current')->withStatus(__('Plan update!'));
        } else {
            return redirect()->route('cart.checkout')->withError('The payment attempt failed.')->withInput();
        }
    }
}
