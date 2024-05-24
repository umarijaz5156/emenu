<?php

namespace Modules\Stripelinks\Http\Controllers;

use App\Order;
use App\TempOrder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Laravel\Cashier\Cashier;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Stripe\StripeClient;
use Stripe\Charge;
use App\Services\ConfChanger;
use Stripe\Customer;
use Exception;
use App\Repositories\Orders\OrderRepoGenerator;

class Main extends Controller
{
    /**
     * @var Order order - The order
     */
    public $order;

    public function onSiteStripeCheckout($orderid)
    {
        $order = Order::withoutGlobalScope('paid')->findOrFail($orderid);
        $this->order = $order;

        $total_price = (int) (($order->order_price_with_discount + $order->delivery_price) * 100);
        $chargeOptions = [];
        //dd("sadfsadfasd");
        // if (config('settings.stripe_useVendor')) {
        //     config(['settings.stripe_secret' => $this->order->restorant->getConfig('stripe_secret', '')]);
        //     config(['settings.stripe_key' => $this->order->restorant->getConfig('stripe_key', '')]);
        // } else if (config('settings.enable_stripe_connect') && $this->order->restorant->user->stripe_account) {
        //     $chargeOptions = $this->stripeConnect();
        // }
        \App\Services\ConfChanger::switchCurrency($this->order->restorant);


        /*
         *$chargeOptions
         * array:2 [▼
          "application_fee_amount" => 112
          "transfer_data" => array:1 [▼
            "destination" => "acct_1OdvMOIyTDzeh0Ri"
          ]
        ]
         *
         * */

        Stripe::setApiKey(config('settings.stripe_secret'));

        $successURL = route('stripelinks.success', ['ordermd' => md5($order->id)]);
        $successURL = $successURL.'?session_id={CHECKOUT_SESSION_ID}';

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => config('settings.cashier_currency'),
                        'product_data' => [
                            'name' => __('Order') . " #" . $order->id_formated,
                        ],
                        'unit_amount' => $total_price,
                    ],
                    'quantity' => 1,
                ]
            ],
            'payment_intent_data' => $chargeOptions,
            'mode' => 'payment',
            'success_url' => $successURL,
            'cancel_url' => route('stripelinks.cancel', ['ordermd' => md5($order->id)]),
        ]/*,['stripe_account' => 'acct_1OdvMOIyTDzeh0Ri']*/);

        return redirect($session->url);
    }

    public function stripeConnect($preOrder)
    {

        $data = $preOrder->body;
        $application_fee_amount = 0;

        //Delivery fee
        $application_fee_amount += (int) ((($data['delivery_price'] ?? 0)));

        //Static fee
        $application_fee_amount += (float) $data['static_fee'];

        //Percentage fee
        $application_fee_amount += (float) $data['fee_value'];

        $chargeOptions = [];
        if (!empty($application_fee_amount)) {
            
            //Make it for stripe
            $application_fee_amount = (int) (float) ($application_fee_amount * 100);

            //Create the charge object
            $chargeOptions = [
                'application_fee_amount' => $application_fee_amount,
                'transfer_data' => [
                    'destination' => $preOrder->restorant->user->stripe_account . '',
                ],
            ];
        }

        return $chargeOptions;
    }

    public function onSiteStripeCheckoutPre($orderid)
    {
        $preOrder = TempOrder::find($orderid);
        $total_price = $preOrder->body['order_price'];
        $total_price = (int) ($total_price * 100);

        $chargeOptions = [];
        
        // \App\Services\ConfChanger::switchCurrency($orderRepo);
        // if (config('settings.stripe_useVendor')) {
        //     config(['settings.stripe_secret' => $this->order->restorant->getConfig('stripe_secret', '')]);
        //     config(['settings.stripe_key' => $this->order->restorant->getConfig('stripe_key', '')]);
        // } else if (config('settings.enable_stripe_connect') && $this->order->restorant->user->stripe_account) {
        //     $chargeOptions = $this->stripeConnect($preOrder);
        // }

        ConfChanger::switchCurrency($preOrder->restorant);

        Stripe::setApiKey(config('settings.stripe_secret'));

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [
                [
                    'price_data' => [
                        'currency' => config('settings.cashier_currency'),
                        'product_data' => [
                            'name' => __('Order') . " #" . $preOrder->id,
                        ],
                        'unit_amount' => $total_price,
                    ],
                    'quantity' => 1,
                ]
            ],
            'payment_intent_data' => $chargeOptions,
            'mode' => 'payment',
            'success_url' => route('stripelinks.success', ['ordermd' => $preOrder->ordermd]). '?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('stripelinks.cancel', ['ordermd' => $preOrder->ordermd]),
        ]);

        return redirect($session->url);
    }

    public function success(Request $request, $ordermd)
    {
        $preOrder = TempOrder::where('ordermd', $ordermd)->first();

        try {
            
            $stripe = new StripeClient(config('settings.stripe_secret'));
            $session = $stripe->checkout->sessions->retrieve($request->session_id);

            if (!is_null($preOrder) && $session->payment_status == 'paid') {
                $body = $preOrder->body;
         
                $body['mobileLikeRequest'] = $body['mobileLikeRequest'];
                $body['mobileLikeRequest']['user_id'] = $body['user_id'];
               
                $mobileLikeRequest = $this->createRequest($body['mobileLikeRequest']);
                $orderRepo = OrderRepoGenerator::makeOrderRepo($body['vendor_id'], $mobileLikeRequest, $body['expedition'], $body['hasPayment'], $body['isStripe'], false, $body['vendorHasOwnPayment']);

                $order = $orderRepo->makeOrderTemp($body['order_price']);
                
                return redirect()->route('order.success', ['order' => $order]);
            } else {
                abort(404);
            }
        } catch (Exception $e) {
            abort(404);
        }
    }

    public function cancel(Request $request, $ordermd)
    {
        //Find the order
        $order = Order::where('ordermd', $ordermd)->first();
        if ($order) {
            return redirect()->route('order.cancel', ['order' => $order]);
        } else {
            abort(404);
        }

    }

    public function createRequest($array)
    {
        return new Request($array);
    }
}
