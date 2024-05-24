<?php

namespace Database\Seeders;

use App\Models\PlanCoupons;
use App\Services\StripeServices;
use Illuminate\Database\Seeder;
use Laravel\Cashier\Cashier;

class StripePromocodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $coupons = PlanCoupons::all();

        $stripeService      = new StripeServices();

        foreach ($coupons as $coupon){
            $obj = $stripeService->createOrUpdateCoupon($coupon);
            $coupon->stripe_id = $obj->id;
            $coupon->update();
        }
    }
}
