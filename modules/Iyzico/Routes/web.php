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
    'namespace' => 'Modules\Iyzico\Http\Controllers'
], function () {
    Route::prefix('iyzico')->group(function() {
        Route::get('/execute/{order}', 'Main@executePayment')->name('iyzico.execute');
        Route::post('/pay/{order}', 'Main@pay')->name('iyzico.pay');
        Route::get('/userform/{order}', 'Main@showUserForm')->name('iyzico.userform');
    });
});
