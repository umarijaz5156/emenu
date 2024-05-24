<?php

namespace Modules\RazorpaySubscribe\Http\Controllers;

use App\Plans;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
require __DIR__.'/../../../Razorpay/vendor/autoload.php';

use Razorpay\Api\Api;


class Main extends Controller
{

    //Create a canel route for razorpay subscription
    public function cancel($sub_id){

        //GET THE KEY
        //System setup 
        $key=config('razorpay-subscribe.key');
        $secret=config('razorpay-subscribe.secret');

        $api = new Api($key, $secret);

        $api->subscription->fetch($sub_id)->cancel();

        return redirect()->back()->with('success',__('Subscription cancelled'));
    }
    
    //Webshook that handles the subscriptions response from Rqzorpay
    public function handleWebhook(Request $request){

        //GET THE KEY
        //System setup 
        $key=config('razorpay-subscribe.key');
        $secret=config('razorpay-subscribe.secret');

        $api = new Api($key, $secret);

        $webhook = $api->utility->verifyWebhookSignature($request->getContent(), $request->header('X-Razorpay-Signature'), config('razorpay-subscribe.webhook_secret'));

        if($webhook===true){

            $subscription=$api->subscription->fetch($request->payload['subscription']['entity']['id']);

            //Get the plan
            $plan=Plans::where('razorpay_id',$subscription->plan_id )->first();

            //Get the user
            $user=\App\User::where('id',$subscription->notes->user_id)->first();

            //Update the user
            $user->plan_id=$plan->id;
            $user->plan_status=$subscription->status;  
            $user->save();

            //Status is to decide what to do
            $status = $$subscription->status;

            if ($status == 'active') {
                //Assign the user this plan
                $user->plan_id = $plan->id;
                $user->plan_status = $status;
                
                $user->subscription_plan_id = $subscription->id;

                $user->cancel_url = route('razorpaysubscribe.cancel',[$subscription->id]);

                $user->update();
                return response()->json([
                    'status' => true,
                    'msg' => 'Plan activated',
                ]);
            } else  {
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


            return response()->json(
                [
                    'status' => true,
                    'message' => 'Subscription activated',
                ]
            );
        }else{
            return response()->json(
                [
                    'status' => false,
                    'message' => 'Invalid webhook',
                ]
            );
        }
    }

    public function getSubscribeLink(Request $request){

         //GET THE KEY
        //System setup 
        $key=config('razorpay-subscribe.key');
        $secret=config('razorpay-subscribe.secret');

        $api = new Api($key, $secret);

        $plan=Plans::findOrFail($request->planID);

        $notifyInfo=array(
            'notify_email'=> auth()->user()->email
        );

        //Add phone if available, that is larger than few chars
        if(strlen(auth()->user()->phone)>4){
            $notifyInfo['notify_phone']=auth()->user()->phone;
        }

        $subscribeLink=$api->subscription->create(
            array(          
                'plan_id' => $request->razopayPlanID,
                'total_count' => 1,                 
                'customer_notify' => 1, 
                'notes'=>array('plan'=>$plan->name,'user_id'=>auth()->user()->id),
                'notify_info'=>$notifyInfo
            )
        );

        return response()->json(
            [
                'status' => true,
                'success_url' => $subscribeLink->short_url,
            ]
        );
    }

    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        return view('razorpay-subscribe::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('razorpay-subscribe::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        return view('razorpay-subscribe::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return view('razorpay-subscribe::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
