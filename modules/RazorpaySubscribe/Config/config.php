<?php

return [
    'name' => 'RazorpaySubscribe',
    'key'=>env('RAZORPAY_SUBSCRIBE_KEY',''),
    'secret'=>env('RAZORPAY_SUBSCRIBE_SECRET',""),
    'webhook_secret'=>env('RAZORPAY_SUBSCRIBE_WEBHOOK_SECRET',"")
];
