<?php

return [
    'name' => 'PaypalSubscribe',
    'client_id'=>env('PAYPAL_SUBSCRIBE_CLIENT_ID',''),
    'secret'=>env('PAYPAL_SUBSCRIBE_SECRET',""),
    'mode'=>env('PAYPAL_SUBSCRIBE_MODE','sandbox')
];
