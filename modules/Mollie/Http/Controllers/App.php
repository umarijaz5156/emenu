<?php

namespace Modules\Mollie\Http\Controllers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Validator;
use Mollie\Api\Exceptions\ApiException;
use Mollie\Laravel\Facades\Mollie;

class App 
{
    private $order;
    private $vendor;

    public function __construct($order, $vendor) {
        
        $this->order=$order;
        $this->vendor=$vendor;

    }

    public function execute(){
         //System setup 
         $mollie_payment_key=config('mollie.mollie_payment_key');
 
         //Setup based on vendor
         if(config('mollie.useVendor')){
             $mollie_payment_key=$this->vendor->getConfig('mollie_payment_key','');
         }

         Mollie::api()->setApiKey($mollie_payment_key);

         try {
            $paymentLink=Mollie::api()->payments->create([
                'amount' => [
                    'currency' => strtoupper(config('settings.cashier_currency')),
                    'value' => number_format((float) $this->order->order_price_with_discount+$this->order->delivery_price, 2, '.', ''),
                ],
                'description' => 'Order #'.$this->order->id,
                'redirectUrl' => auth()->user()?route('orders.index'):$this->vendor->getLinkAttribute(),
                'webhookUrl' => route('webhooks.mollie'),
                'metadata' => ['order_id' => $this->order->id],
            ])->getCheckoutUrl();

            //Set payment link in order
            $this->order->payment_link=$paymentLink;
            $this->order->update();
            
        } catch (ApiException $e) {
            if(config('app.debug') == true){
                dd($e);
            }
            return Validator::make(['mollie_error_action'=>null], ['mollie_error_action'=>'required']);
        }
            

        //All ok
        return Validator::make([], []);
 
       
    }

}