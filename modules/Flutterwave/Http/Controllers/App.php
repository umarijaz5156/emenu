<?php

namespace Modules\Flutterwave\Http\Controllers;


use Illuminate\Support\Facades\Validator;

class App 
{
    private $order;
    private $vendor;

    public function __construct($order, $vendor) {
        
        $this->order=$order;
        $this->vendor=$vendor;

    }

    public function execute(){
        $this->order->payment_link=route('flutterwave.payscreen',['orderid'=>$this->order->id]);
        $this->order->update();

        //All ok
        return Validator::make([], []);
    }

}