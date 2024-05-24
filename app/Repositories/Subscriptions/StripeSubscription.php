<?php

namespace App\Repositories\Subscriptions;

use App\Plans;
use App\Restorant;
use App\User;
use Illuminate\Http\Request;
use Laravel\Cashier\Cashier;

class StripeSubscription implements SubscriptionInterface
{
    private $periods = [1 => 'month', 2 => 'year'];

    function getCheckoutLink(Restorant $restourant, Plans $plan, $config = [])
    {
        /** @var $owner User */
        $owner = (isset($config['owner']))?$config['owner']:false;
        if ($owner === false){
            return false;
        }
        $coupon = (isset($config['coupon']))?$config['coupon']:false;

        $checkout = false;

        $owner->createAsStripeCustomer();
        //prepare be4 checkout

        $price = $this->getStripePrice($plan);

        if ($coupon && $coupon->used_count < $coupon->limit_to_num_uses) {
            $coupon->used_count++;
            $coupon->save();
            $checkout =  $owner->newSubscription('default', $price->id)
                ->withCoupon($coupon->stripe_id)
                ->checkout([
                    'payment_method_types' => ["card", "paypal"],
                    'success_url' => route('verification.notice', ['p_type'=>'stripe','success'=>true,'vendor_id'=>$restourant->id]),
                    'cancel_url'  => route('plans.cancel'),
                ]);
        } else {
            $checkout = $owner->newSubscription('default', $price->id)->checkout([
                'payment_method_types' => ["card", "paypal"],
                'success_url' => route('verification.notice', ['p_type'=>'stripe','success'=>true,'vendor_id'=>$restourant->id]),
                'cancel_url'  => route('plans.cancel', ['p_type'=>'stripe','success'=>true,'vendor_id'=>$restourant->id]),
            ]);
        }
        return ($checkout)?$checkout->url:false;
    }

    function confirm(Request $request): bool
    {
        return false;
    }

    /**
     * @param Plans $plan
     * @return \Stripe\Price|\Stripe\StripeObject|null
     * @throws \Stripe\Exception\ApiErrorException
     */
    public function getStripePrice(Plans $plan): \Stripe\Price|null|\Stripe\StripeObject
    {
        if ($plan) {
            //payment logic
            $periods = $this->periods;
            $price = Cashier::stripe()->prices->search(['query' => 'metadata[\'plan_id\']:\'' . $plan->id . '\'']);
            if ($price->isEmpty()) {
                //create new price
                $price = Cashier::stripe()->prices->create([
                    'unit_amount' => (int)$plan->price * 100,
                    'currency' => strtolower(env("CASHIER_CURRENCY", 'usd')),
                    'recurring' => ['interval' => $periods[$plan->period]],
                    'product_data' => [
                        'name' => $plan->name
                    ],
                    'metadata' => [
                        'plan_id' => $plan->id
                    ]
                ]);
            } elseif ((int)$price->first()->unit_amount != (int)$plan->price * 100) {
                Cashier::stripe()->prices->update(
                    $price->first()->id,
                    ['metadata' => ['plan_id' => '0']]
                );
                $price = Cashier::stripe()->prices->create([
                    'unit_amount' => (int)$plan->price * 100,
                    'currency' => strtolower(env("CASHIER_CURRENCY", 'usd')),
                    'recurring' => ['interval' => $periods[$plan->period]],
                    'product_data' => [
                        'name' => $plan->name
                    ],
                    'metadata' => [
                        'plan_id' => $plan->id
                    ]
                ]);
            } else {
                $price = $price->first();
            }
        }
        return $price;
    }

    function generatePayload(Request $request, $config = [])
    {
        return [];
    }
}
