<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::group([
    'namespace' => 'Modules\PaystackSubscribe\Http\Controllers'
], function () {
    Route::prefix('paystacksubscribe')->group(function() {
        Route::group([
            'middleware' =>[ 'web','impersonate'],
        ], function () {
            Route::get('/actions', 'Main@updateCancelSubscription')->name('paystack.subscription.actions');
            Route::post('/subscribe', 'Main@subscribe')->name('subscribe-paystack');
        });
        Route::post('/webhook', 'Main@webhook')->name('paystackwebhook');
        
    });
});
