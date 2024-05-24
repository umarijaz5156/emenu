<?php

return [
    'name' => 'FlutterWave',
    'enabled'=>env('ENABLE_FLUTTERWAVE',false),
    'useVendor'=>env('VENDORS_OR_ADMIN_FLUTTERWAVE','admin')=="vendor",
    'useAdmin'=>env('VENDORS_OR_ADMIN_FLUTTERWAVE','admin')=="admin",
    'public_key'=>env('FLUTTERWAVE_PUBLIC_KEY',"")
];
