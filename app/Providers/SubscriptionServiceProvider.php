<?php

namespace App\Providers;

use App\Repositories\Subscriptions\PaypalSubscription;
use App\Repositories\Subscriptions\StripeSubscription;
use App\Repositories\Subscriptions\SubscriptionInterface;
use Illuminate\Support\ServiceProvider;

class SubscriptionServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(SubscriptionInterface::class,function ($app){
            $res = $app->request->p_type;
            if (isset($app->request->p_type)){
                switch ($res){
                    case 'paypal':
                        return $app->make(PaypalSubscription::class);
                        break;
                    case 'stripe':
                        return $app->make(StripeSubscription::class);
                        break;
                }
            }else{
                return $app->make(StripeSubscription::class);
            }

            return $app->make(StripeSubscription::class);
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
