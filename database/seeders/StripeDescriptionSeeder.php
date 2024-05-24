<?php

namespace Database\Seeders;

use App\Plans;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;
use Laravel\Cashier\Cashier;
use Modules\Stripelinks\Http\Service\StripeService;

class StripeDescriptionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $periods = [1=>'month', 2=>'year'];

        $prices = Cashier::stripe()->prices->all();

        $prcs = Cashier::stripe()->prices->all();

        $plans = Plans::all();

        $stripeWorker = new StripeService();

        foreach ($plans as $plan){

            $stripe_price        = Cashier::stripe()->prices->search(['query' => "metadata['plan_id']:'{$plan->id}'"]);
            if (!$stripe_price->isEmpty()){
                Cashier::stripe()->prices->update(
                    $stripe_price->first()->id,
                    ['metadata' => ['plan_id' => '0'],
                        'unit_amount' => (int)$plan->price*100]
                );
            }


            if ($stripe_price->isEmpty()){
                $a = Cashier::stripe()->prices->create([
                    'unit_amount'   => (int)$plan->price*100,
                    'currency'      => strtolower(env("CASHIER_CURRENCY",'usd')),
                    'recurring'     => ['interval' => 'month'],
                    'product_data'  => [
                        'name'      => 'number one'
                    ],
                    'metadata'      => ['plan_id'=>$plan->id]
                ]);
            }
        }


    }
}
