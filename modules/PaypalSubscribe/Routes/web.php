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
    'namespace' => 'Modules\PaypalSubscribe\Http\Controllers'
], function () {
    Route::prefix('paypalsubscribe')->group(function() {
        Route::group([
            'middleware' => 'web',
        ], function () {
            Route::post('/actions', 'Main@updateCancelSubscription')->name('paypal.subscription.actions');
            Route::post('/subscribe', 'Main@subscribe')->name('subscribe-paypal');
        });
        
    });
});