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
    'middleware' =>[ 'web','impersonate'],
    'namespace' => 'Modules\RazorpaySubscribe\Http\Controllers'
], function () {
    Route::post('/razorpaysubscribe/webhook', 'Main@handleWebhook')->name('razorpaysubscribe.webhook');
    Route::post('/razorpaysubscribe/getsubscribelink', 'Main@getSubscribeLink')->name('razorpaysubscribe.getlink');

    //Create cancel url
    Route::get('/razorpaysubscribe/cancel/{sub_id}', 'Main@cancel')->name('razorpaysubscribe.cancel');
});
