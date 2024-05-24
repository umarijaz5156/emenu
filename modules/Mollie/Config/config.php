<?php

return [
    'name' => 'Mollie',
    'enabled'=>env('ENABLE_MOLLIE',false),
    'useVendor'=>env('VENDORS_OR_ADMIN_MOLLIE','admin')=="vendor",
    'useAdmin'=>env('VENDORS_OR_ADMIN_MOLLIE','admin')=="admin",
    'mollie_payment_key'=>env('MOLLIE_PAYMENT_KEY','')
];
