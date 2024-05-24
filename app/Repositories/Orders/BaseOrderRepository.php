<?php

namespace App\Repositories\Orders;

use App\Coupons;
use App\Http\Controllers\Items\OptionsController;
use App\Order;
use App\Restorant as Vendor;
use App\Items;
use App\Models\Variants;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Notifications\OrderNotification;
use App\Events\NewOrder as PusherNewOrder;
use App\Events\OrderAcceptedByAdmin;
use Cart;
use App\TempOrder;

class BaseOrderRepository extends Controller
{

    /**
     * @var Request request - The request made
     */
    public $request;

    /**
     * @var Vendor vendor - The vendor
     */
    public $vendor;

    /**
     * @var Order order - The order
     */
    public $order;

    /**
     * @var string expedition - Deliver - 1, PickUp -2, Dine in -3
     */
    public $expedition;

    /**
     * @var bool hasPayment
     */
    public $hasPayment;

    /**
     * @var bool isStripe
     */
    public $isStripe;

    /**
     * @var bool status
     */
    public $status = true;

    /**
     * @var bool isNewOrder
     */
    public $isNewOrder = true;

    /**
     * @var string errorMessage - Deliver, DineIn, PickUp
     */
    public $errorMessage = "";

    /**
     * @var Redirect paymentRedirect
     */
    public $paymentRedirect = null;

    /**
     * @var bool isMobileOrder
     */
    public $isMobileOrder = false;


    /**
     * @var string redirectLink
     */
    public $redirectLink;

    public function __construct($vendor_id, $request, $expedition, $hasPayment, $isStripe)
    {
        $this->request = $request;
        $this->expedition = $expedition;
        $this->hasPayment = $hasPayment;
        $this->isStripe = $isStripe;

        //Set the Vendor
        if ($vendor_id) {
            $this->vendor = Vendor::findOrFail($vendor_id);
        } else {
            $this->vendor = null;
        }

    }



    public function constructOrder($overridePrice = false)
    {
        //Create the order
        $this->createOrder();

        //Set Items
        $this->setItems($overridePrice);

        //Set Comment
        $this->setComment();

        //Calculate fees
        $this->calculateFees();

    }

    public function constructOrderTemp($overridePrice = false)
    {
        //Create the order
        $this->createOrder();

        //Set Items
        $this->setItems($overridePrice);

        //Set Comment
        $this->setComment();

        //Calculate fees
        $this->calculateFees();

        $this->order->payment_status = 'paid';
        $this->order->save();

        return $this->order;
    }

    public function constructOrderPre($overridePrice = false)
    {
        $preOrder = [];

        //Set Items
        $preOrder = $this->setItemsPre($overridePrice, $preOrder);

        if ($this->vendor) {
            $preOrder['static_fee'] = $this->vendor->static_fee;
            $preOrder['fee'] = $this->vendor->fee;
            $preOrder['order_price_with_discount'] = $preOrder['order_price'] - ($preOrder['discount'] ?? 0) + ($preOrder['tip'] ?? 0);
            $preOrder['fee_value'] = ($this->vendor->fee / 100) * ($preOrder['order_price_with_discount'] - $this->vendor->static_fee);
        }

        $restorant_id = $this->vendor ? $this->vendor->id : null;

        $preOrder = TempOrder::create(['body' => $preOrder, 'restorant_id' => $restorant_id]);

        return $preOrder;
    }

    public function validateOrder()
    {
        $validator = Validator::make(['order_price' => $this->order->order_price], [
            'order_price' => ['numeric', 'min:' . $this->vendor->minimum]
        ]);
        if ($validator->fails()) {
            $this->invalidateOrder();
        }
        return $validator;
    }

    public function invalidateOrder()
    {
        $this->status = false;
        $this->order->delete();
    }

    public function updateOrder()
    {
        //Store it if not stored yet, otherwise update it
        $this->order->update();
    }

    public function finalizeOrder()
    {
    }

    private function createOrder($overridePrice = false)
    {
        if ($this->order == null) {
            $this->order = new Order;
            $this->order->restorant_id = $this->vendor ? $this->vendor->id : null;

            //Set config based on restaurant
            if ($this->vendor) {
                config(['app.timezone' => $this->vendor->getConfig('time_zone', config('app.timezone'))]);
            }


            $this->order->comment = "";
            $this->order->payment_method = $this->request->payment_method;
            $this->order->payment_status = "unpaid";

            $expeditionsTypes = ['delivery' => 1, 'pickup' => 2, 'dinein' => 3]; //1- delivery 2 - pickup 3-dinein
            $this->order->delivery_method = $expeditionsTypes[$this->expedition];

            //Client
            if (auth()->user()) {
                $this->order->client_id = auth()->user()->id;
            }

            $this->order->order_price = 0;
            $this->order->vatvalue = 0;

            //Save order
            $this->order->save();

            $this->order->md = md5($this->order->id);
            $this->order->update();

            //Save order custom fields
            $this->order->setMultipleConfig($this->request->customFields);

        } else {
            //Order is already initialized - in case of continues ordering
            $this->isNewOrder = false;
        }
    }

    private function setItems($overridePrice = false)
    {
        $cartData = Cart::getContent()->toArray();
        // dd($cartData);
        foreach ($this->request->items as $key => $item) {


            //Obtain the item
            $theItem = Items::findOrFail($item['id']);

            if ($this->vendor) {
                \App\Services\ConfChanger::switchCurrency($this->vendor);
            }

            //List of extras
            $extras = [];

            //The price of the item or variant
            $itemSelectedPrice = $theItem->price;

            //Find the variant
            $variantName = '';
            if ($item['variant']) {
                //Find the variant
                $variant = Variants::findOrFail($item['variant']);
                $itemSelectedPrice = $variant->price;
                $variantName = $variant->optionsList;

                //Check if qty is available
                $variant->decrement('qty', $item['qty']);
                $theItem->calculateQTYBasedOnVariants();


            } else {
                //Decrement from item
                $theItem->decrement('qty', $item['qty']);
            }

            //Find the extras
            foreach ($item['extrasSelected'] as $key => $extra) {
                $theExtra = $theItem->extras()->findOrFail($extra['id']);
                $itemSelectedPrice += $theExtra->price;
                array_push($extras, $theExtra->name . ' + ' . money($theExtra->price, config('settings.cashier_currency'), config('settings.do_convertion')));
            }

            //Total vat on this item
            $totalCalculatedVAT = $item['qty'] * ($theItem->vat > 0 ? $theItem->vat / 100 * $itemSelectedPrice : 0);


            $variantName = "";
            foreach ($cartData as $k => $v) {
                if ($v['attributes']['id'] == $item['id']) {
                    $variantName = $cartData[$k]['attributes']['variantName'];
                    break;
                }
            }

            //recalculate options summ
            $opts = OptionsController::unpack($variantName);
            $opts_summ = array_sum(array_column($opts, 'price'));
            $itemSelectedPrice += $opts_summ;

            //Total vat on this item
            $totalCalculatedVAT = $item['qty'] * ($theItem->vat > 0 ? $theItem->vat / 100 * $itemSelectedPrice : 0);

            //recalculate vat

            $this->order->items()->attach($item['id'], [
                'qty' => $item['qty'],
                'extras' => json_encode($extras),
                'vat' => $theItem->vat,
                'vatvalue' => $totalCalculatedVAT,
                'variant_name' => $variantName,
                'variant_price' => $itemSelectedPrice
            ]);
        }


        //After we have updated the list of items, we need to update the order price
        $order_price = 0;
        $total_order_vat = 0;
        foreach ($this->order->items()->get() as $key => $item) {
            $order_price += $item->pivot->qty * $item->pivot->variant_price;

            $total_order_vat += ($item->pivot->vat / 100) * $item->pivot->qty * $item->pivot->variant_price;
        }
        // if ($overridePrice){
        //     $order_price = $overridePrice;
        // }
        $this->order->order_price = $order_price;
        $this->order->vatvalue = $total_order_vat;

        //Set tip
        if ($this->request->has('tip')) {
            $this->order->tip = $this->request->tip;
            // $this->order->order_price-=$this->request->tip;
        }

        //Set coupons
        if ($this->request->has('coupon_code') && strlen($this->request->coupon_code) > 0) {
            $coupon = Coupons::where(['code' => $this->request->coupon_code])->where('restaurant_id', $this->vendor->id)->get()->first();
            if ($coupon) {
                $deduct = $coupon->calculateDeduct($this->order->order_price);
                // dd($deduct);
                if ($deduct) {
                    $coupon->decrement('limit_to_num_uses');
                    $coupon->increment('used_count');
                    $this->order->coupon = $this->request->coupon_code;

                    if ($deduct > $this->order->order_price) {
                        $this->order->discount = $order_price;
                    } else {
                        $this->order->discount = $deduct;
                    }

                }
            }
            $this->order->order_price = $this->order->order_price - $this->order->discount;

            if ($coupon->type == 1) {
                $this->order->vatvalue = $total_order_vat / $order_price * $this->order->order_price;
            } else {
                $this->order->vatvalue -= $deduct / $order_price * $this->order->vatvalue;
            }

        }


        // get delivery area tax
        $this->order->vatvalue += $this->vendor->delivery_area_tax / 100 * $this->request->delivery_area_cost;

        // dd($this->vendor->delivery_area_tax / 100 * $this->request->delivery_area_cost);




        // Check for minimum order price
        // if ($this->order->order_price < intval($this->vendor->minimum)) {
        //     return redirect('cart.checkout')->withErrors(__('Minimum order price is :price', ['price' => money($this->vendor->minimum, config('settings.cashier_currency'), config('settings.do_convertion'))]));
        // }




        // dd($this->order->order_price, intval($this->order->restorant->minimum), 'ss');


        //Update the order with the item
        $this->order->update();
    }

    private function setItemsPre($overridePrice = false, $preOrder)
    {
        $cartData = Cart::getContent()->toArray();
        // dd($cartData);
        foreach ($this->request->items as $key => $item) {


            //Obtain the item
            $theItem = Items::findOrFail($item['id']);

            if ($this->vendor) {
                \App\Services\ConfChanger::switchCurrency($this->vendor);
            }

            //List of extras
            $extras = [];

            //The price of the item or variant
            $itemSelectedPrice = $theItem->price;

            //Find the variant
            $variantName = '';
            if ($item['variant']) {
                //Find the variant
                $variant = Variants::findOrFail($item['variant']);
                $itemSelectedPrice = $variant->price;
                $variantName = $variant->optionsList;

                //Check if qty is available
                $variant->decrement('qty', $item['qty']);
                $theItem->calculateQTYBasedOnVariants();


            } else {
                //Decrement from item
                $theItem->decrement('qty', $item['qty']);
            }

            //Find the extras
            foreach ($item['extrasSelected'] as $key => $extra) {
                $theExtra = $theItem->extras()->findOrFail($extra['id']);
                $itemSelectedPrice += $theExtra->price;
                array_push($extras, $theExtra->name . ' + ' . money($theExtra->price, config('settings.cashier_currency'), config('settings.do_convertion')));
            }

            //Total vat on this item
            $totalCalculatedVAT = $item['qty'] * ($theItem->vat > 0 ? $theItem->vat / 100 * $itemSelectedPrice : 0);


            $variantName = "";
            foreach ($cartData as $k => $v) {
                if ($v['attributes']['id'] == $item['id']) {
                    $variantName = $cartData[$k]['attributes']['variantName'];
                    break;
                }
            }

            //recalculate options summ
            $opts = OptionsController::unpack($variantName);
            $opts_summ = array_sum(array_column($opts, 'price'));
            $itemSelectedPrice += $opts_summ;

            //Total vat on this item
            $totalCalculatedVAT = $item['qty'] * ($theItem->vat > 0 ? $theItem->vat / 100 * $itemSelectedPrice : 0);

            //recalculate vat

            // $this->order->items()->attach($item['id'], [
            //     'qty' => $item['qty'],
            //     'extras' => json_encode($extras),
            //     'vat' => $theItem->vat,
            //     'vatvalue' => $totalCalculatedVAT,
            //     'variant_name' => $variantName,
            //     'variant_price' => $itemSelectedPrice
            // ]);

            $preOrder['data'][$item['id']] = [
                'qty' => $item['qty'],
                'extras' => json_encode($extras),
                'vat' => $theItem->vat,
                'vatvalue' => $totalCalculatedVAT,
                'variant_name' => $variantName,
                'variant_price' => $itemSelectedPrice
            ];
        }


        //After we have updated the list of items, we need to update the order price
        $order_price = 0;
        $total_order_vat = 0;
        foreach ($preOrder['data'] as $key => $item) {
            $order_price += $item['qty'] * $item['variant_price'];

            $total_order_vat += ($item['vat'] / 100) * $item['qty'] * $item['variant_price'];
        }
        // if ($overridePrice){
        //     $order_price = $overridePrice;
        // }
        $preOrder['order_price'] = $order_price;
        $preOrder['vatvalue'] = $total_order_vat;

        //Set tip
        if ($this->request->has('tip')) {
            $preOrder['tip'] = $this->request->tip;
            // $this->order->order_price-=$this->request->tip;
        }

        //Set coupons
        if ($this->request->has('coupon_code') && strlen($this->request->coupon_code) > 0) {
            $coupon = Coupons::where(['code' => $this->request->coupon_code])->where('restaurant_id', $this->vendor->id)->get()->first();
            if ($coupon) {
                $deduct = $coupon->calculateDeduct($preOrder['order_price']);
                // dd($deduct);
                if ($deduct) {
                    $coupon->decrement('limit_to_num_uses');
                    $coupon->increment('used_count');
                    $preOrder['coupon'] = $this->request->coupon_code;

                    if ($deduct > $preOrder['order_price']) {
                        $preOrder['discount'] = $order_price;
                    } else {
                        $preOrder['discount'] = $deduct;
                    }

                }
            }
            $preOrder['order_price'] = $preOrder['order_price'] - $preOrder['discount'];

            if ($coupon->type == 1) {
                $preOrder['vatvalue'] = $total_order_vat / $order_price * $preOrder['order_price'];
            } else {
                $preOrder['vatvalue'] -= $deduct / $order_price * $preOrder['vatvalue'];
            }

        }


        // get delivery area tax
        $preOrder['vatvalue'] += $this->vendor->delivery_area_tax / 100 * $this->request->delivery_area_cost;

        // dd($this->vendor->delivery_area_tax / 100 * $this->request->delivery_area_cost);

        // Check for minimum order price
        if ($preOrder['order_price'] < intval($this->vendor->minimum)) {
            return redirect('cart.checkout')->withErrors(__('Minimum order price is :price', ['price' => money($this->vendor->minimum, config('settings.cashier_currency'), config('settings.do_convertion'))]));
        }


        // dd($this->order->order_price, intval($this->order->restorant->minimum), 'ss');


        //Update the order with the item
        // $this->order->update();
        return $preOrder;
    }

    private function setComment()
    {

        $comment = $this->request->comment ? strip_tags($this->request->comment . '') : '';
        $this->order->comment = $this->order->comment . ' ' . $comment;
        $this->order->update();
    }

    private function calculateFees()
    {
        if ($this->vendor) {
            $this->order->static_fee = $this->vendor->static_fee;
            $this->order->fee = $this->vendor->fee;
            $this->order->fee_value = ($this->vendor->fee / 100) * ($this->order->order_price_with_discount - $this->vendor->static_fee);
            $this->order->update();
        }

    }

    public function notifyAdmin()
    {
        //Does nothing
    }

    public function notifyOwner()
    {
        //Inform owner - via email, sms or db
        $this->vendor->user->notify((new OrderNotification($this->order, 1, $this->vendor->user))->locale(strtolower(config('settings.app_locale'))));

        //Notify owner with pusher
        if (strlen(config('broadcasting.connections.pusher.secret')) > 4) {
            event(new PusherNewOrder($this->order, __('notifications_notification_neworder')));
        }

        //Dispatch Approved by admin event
        OrderAcceptedByAdmin::dispatch($this->order);
    }
}
