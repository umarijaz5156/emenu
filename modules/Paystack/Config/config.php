<?php

return [
    'name' => 'Paystack',
    'enabled'=>env('ENABLE_PAYSTACK',false),
    'useVendor'=>env('VENDORS_OR_ADMIN_PAYSTACK','admin')=="vendor",
    'useAdmin'=>env('VENDORS_OR_ADMIN_PAYSTACK','admin')=="admin",
    'publicKey' => env('PAYSTACK_PUBLIC_KEY',''),
    'secretKey' => env('PAYSTACK_SECRET_KEY'),
    'paymentUrl' => env('PAYSTACK_PAYMENT_URL','https://api.paystack.co'),
    'merchantEmail' => env('MERCHANT_EMAIL','')
];
