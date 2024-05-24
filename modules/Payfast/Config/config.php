<?php

return [
    'name' => 'Payfast',
    'enabled'=>env('ENABLE_PAYFAST',false),
    'useVendor'=>env('VENDORS_OR_ADMIN_PAYFAST','admin')=="vendor",
    'useAdmin'=>env('VENDORS_OR_ADMIN_PAYFAST','admin')=="admin",
    'merchantId' => env('PAYFAST_MERCHANT_ID',''),
    'merchantKey' => env('PAYFAST_MERCHANT_KEY',''),
    'mode'=>env('PAYFAST_MODE','sandbox')
];
