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
    'namespace' => 'Modules\Mollie\Http\Controllers'
], function () {
    Route::post('webhooks/mollie', 'Main@handleWebhookNotification')->name('webhooks.mollie');
});
