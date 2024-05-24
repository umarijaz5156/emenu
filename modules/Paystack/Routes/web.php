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
    'namespace' => 'Modules\Paystack\Http\Controllers'
], function () {
    Route::prefix('paystack')->group(function() {
        Route::get('/payment/callback/{vendor}', 'Main@handleGatewayCallback')->name('webhook.paystack');
        Route::post('/geturl',  'Main@getAuthorizationUrl')->name('paystack.geturl');
        Route::get('/test', 'Main@executionTest');
    });
});
