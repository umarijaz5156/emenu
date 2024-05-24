<?php

return [
    'name' => 'Razorpay',
    'enabled'=>env('ENABLE_RAZORPAY',false),
    'useVendor'=>env('VENDORS_OR_ADMIN_RAZORPAY','admin')=="vendor",
    'useAdmin'=>env('VENDORS_OR_ADMIN_RAZORPAY','admin')=="admin",
    'key'=>env('RAZORPAY_KEY',''),
    'secret'=>env('RAZORPAY_SECRET',""),
    'mode'=>env('RAZORPAY_MODE','sandbox')
];
