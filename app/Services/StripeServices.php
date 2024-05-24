<?php

namespace App\Services;

use App\Plans;
use Illuminate\Database\Eloquent\Model;
use Laravel\Cashier\Cashier;


class StripeServices
{
    public function  createOrUpdateCoupon(Model $coupon){
        $coupon  = $coupon->toArray();

        $couponDuration = $coupon['coupon_duration'] == 0 ? "forever" : "once";

        $coupons_stripe = Cashier::stripe()->coupons->all();
        $coupon_stripe = false;
        foreach ($coupons_stripe as $scoupon) {
            $a = $scoupon->metadata["coupon_id"];
            $b = $scoupon->id;
            if (isset($scoupon->metadata["coupon_id"]) && $scoupon->metadata["coupon_id"] == $coupon['id']){
                $coupon_stripe = $scoupon->id;
            }
        }
        if ($coupon['type'] == 1){
            $percent = $coupon['price'];
            $amount  = null;
        }elseif($coupon['type'] == 0){
            $percent = null;
            $amount  = $coupon['price'];
        }
        if ($coupon_stripe){
            Cashier::stripe()->coupons->delete($coupon_stripe, []);
        }

        if ($percent){
            return Cashier::stripe()->coupons->create(
                ['metadata' => ['coupon_id' => $coupon['id']],
                    'duration'    => $couponDuration,
                    'percent_off' => $percent
                ]
            );
        }

        if ($amount){
            return Cashier::stripe()->coupons->create(
                ['metadata' => ['coupon_id' => $coupon['id']],
                    'duration'    => $couponDuration,
                    'amount_off'  => $amount*100,
                    'currency'    => config('settings.cashier_currency')
                ]
            );
        }
        return false;
    }

    /**Finds a Stripe representation of a price, bundled with this id
     * @param Plans $plan
     * @return void
     */
    public function findStripePrice(Plans $plan){

    }
}
