<?php

namespace Modules\Mollie\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Mollie\Laravel\Facades\Mollie;
use App\Order;

class Main extends Controller
{
    //Mollie webhook after payment
    public function handleWebhookNotification(Request $request)
    {
        if (! $request->has('id')) {
            return;
        }

        $paymentId = $request->input('id');
        $payment = Mollie::api()->payments->get($paymentId);

        if ($payment->isPaid()) {
            $order = Order::findOrFail($payment->metadata->order_id);
            $order->payment_status = 'paid';

            $order->update();
        }
    }
}
