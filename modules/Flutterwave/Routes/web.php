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
    'namespace' => 'Modules\Flutterwave\Http\Controllers'
], function () {
    Route::prefix('flutterwave')->group(function() {
        Route::get('/execute', 'Main@executePayment')->name('flutterwave.execute');
        Route::get('/pay/{orderid}', 'Main@payscreen')->name('flutterwave.payscreen');
    });
});


