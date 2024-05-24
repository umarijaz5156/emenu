<?php

namespace Modules\Paystack\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Unicodeveloper\Paystack\Paystack;

class App
{
    private $order;
    private $vendor;

    public function __construct($order, $vendor) {
        
        $this->order=$order;
        $this->vendor=$vendor;
    }

    public function execute(){

        //Setup based on vendor
        if(config('paystack.useVendor')){
            \App\Services\ConfChanger::switchCurrency($this->vendor);
            config(['paystack.secretKey' => $this->vendor->getConfig('paystack_secretKey','')]);
        }

        try {
            $paystack = new Paystack();

            $data = array_filter([
                "amount" => intval(($this->order->order_price_with_discount+$this->order->delivery_price)*100),
                //"reference" => $paystack->genTranxRef(),
                "email" => $this->vendor->user->email,
                "callback_url" => route('webhook.paystack',['vendor'=>$this->vendor->id]),
                "currency" => (strtoupper(config('settings.cashier_currency'))),
                'metadata' => json_encode( [
                    'order_id' => $this->order->id,
                    'restorant_id' => $this->vendor->id,
                ])
            ]);

            

            //Set payment link in order
            $paystack->getAuthorizationResponse($data);
            $this->order->payment_link = $paystack->getAuthorizationResponse($data)['data']['authorization_url'];
            $this->order->update();

            //All ok
            return Validator::make([], []);


        } catch (\Exception $e) {
            if(config('app.debug') == true){
                dd($e);
            }
            return Validator::make(['paystack_error_action'=>null], ['paystack_error_action'=>'required']);
        }
    }
}