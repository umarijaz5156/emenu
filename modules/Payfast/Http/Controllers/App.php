<?php

namespace Modules\Payfast\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Unicodeveloper\Payfast\Payfast;

class App
{
    private $order;
    private $vendor;

    public function __construct($order, $vendor) {
        
        $this->order=$order;
        $this->vendor=$vendor;
    }

    public function execute(){
        //Set payment link in order
        $this->order->payment_link=route('payfast.pay',['order'=>$this->order->id]);
        $this->order->update();

        //All ok
        return Validator::make([], []);
    }
}