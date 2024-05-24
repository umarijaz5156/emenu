<?php

namespace Modules\PaddleSubscribe\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use App\Plans;
use App\User;

class Main extends Controller
{
    public function webhook(Request $request)
    {

         //Email - find the user
         $email = $request->email;
         $user = User::where('email', $email)->firstOrFail();
 
         //subscription_id -- Find the plan
         $subscription_plan_id = $request->subscription_plan_id;
         $plan = Plans::where('paddle_id', $subscription_plan_id)->firstOrFail();

         
        //subscription_id -- Find the plan
        $subscription_plan_id = $request->subscription_plan_id;
        $plan = Plans::where('paddle_id', $subscription_plan_id)->firstOrFail();

        //Status is to decide what to do
        $status = $request->status;

        if ($status == 'active' || $status == 'trialing') {
            //Assign the user this plan
            $user->plan_id = $plan->id;
            $user->plan_status = $status;
            if($request->cancel_url&&strlen($request->cancel_url)){
                $user->cancel_url = $request->cancel_url;
                $user->update_url = $request->update_url;
            }
            $user->subscription_plan_id = $request->subscription_plan_id;
            $user->update();
            return response()->json([
                'status' => true,
                'msg' => 'Plan activated',
            ]);
        }

        if ($status == 'deleted') {
            //Remove assigned plan to user
            $user->plan_id = null;
            $user->plan_status = '';
            $user->cancel_url = '';
            $user->update_url = '';
            $user->subscription_plan_id = null;
            $user->update();
            return response()->json([
                'status' => true,
                'msg' => 'Plan removed',
            ]);
        }


    }
}
