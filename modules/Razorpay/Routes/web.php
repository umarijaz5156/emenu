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
    'namespace' => 'Modules\Razorpay\Http\Controllers'
], function () {
    Route::prefix('razorpay')->group(function() {
        Route::post('/execute', 'Main@executePayment')->name('razorpay.execute');
        Route::get('/pay/{order}', 'Main@pay')->name('razorpay.pay');
    });
});
