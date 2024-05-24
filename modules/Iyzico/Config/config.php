<?php

return [
    'name' => 'Iyzico',
    'enabled'=>env('ENABLE_IYZICO',false),
    'useVendor'=>env('VENDORS_OR_ADMIN_IYZICO','admin')=="vendor",
    'useAdmin'=>env('VENDORS_OR_ADMIN_IYZICO','admin')=="admin",
    'api_key'=>env('IYZICO_API_KEY',''),
    'api_secret'=>env('IYZICO_SECRET',''),
    'mode'=>env('IYZICO_MODE','sandbox'),
];
