<?php
//https://excalidraw.com/#json=nS7jW19Yrymv-jtabRFnR,UbK28xD4qXpusx_9Z6kbiw

namespace App\Services;
/**
 * All logic that overrides standart payment flow will be overwritten with this service
 * This service was created to change current payment flow we need to create
 * an order only after user pays the bill
 *
 */
class StripeNotontificationService
{


    /** replacing an order with tempOrder if needed
     * @param \App\Order $order
     * @return void
     */
    public function patchOrderOnInit(\App\Order $order){

    }
    /** Patches the order on updates, redirecting the order to tempOrderDatabase if needed.
     * @param \App\Order $order
     * @return void
     */
    public function patchTheOrderOnUpdate(\App\Order $order){

    }

    /** checks if we need to send a beep notification
     * for a restourant owner
     * @param \App\Order $order
     * @return void
     */
    public function chekIfBeepNeeded(\App\Order $order){

    }

    /**
     * process data recieved from webhook
     * @param $events
     * @return void
     */
    public function recieveDataFromWebhook($events){

    }

    /** deletes temp order
     * @param \App\Order $tempOrder
     * @return void
     */
    public function deleteTempOrder(\App\Order $tempOrder){

    }

    /**
     * @param \App\Order $tempOrder
     * @return void
     */
    public function moveToOrders(\App\Order $tempOrder){

    }
}
