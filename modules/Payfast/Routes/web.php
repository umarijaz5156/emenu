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
    'namespace' => 'Modules\Payfast\Http\Controllers'
], function () {
    Route::prefix('payfast')->group(function() {
        Route::get('/notify', 'Main@notify')->name('payfast.notify');
        Route::get('/pay/{order}', 'Main@pay')->name('payfast.pay');
    });
});
