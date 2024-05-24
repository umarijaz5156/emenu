<?php

namespace Modules\PaystackSubscribe\Http\Controllers;

use App\Plans;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;

class Main extends Controller
{

    //Manage
    public function updateCancelSubscription(){
        $client = new \GuzzleHttp\Client();

        $payload = [
            'headers' => [
                'Authorization' => 'Bearer '.config('paystack-subscribe.secret'),
                'Accept'     => 'application/json'
            ],
        ];
        $response = $client->request('GET', "https://api.paystack.co/subscription/". Auth::user()->paystack_subscribtion_id."/manage/link", $payload);
        $responseDecoded = json_decode($response->getBody());
        return redirect($responseDecoded->data->link);
    }

     //Subscribe
     public function subscribe(Request $request)
     {
         //Assign user to plan
         //auth()->user()->plan_id = $request->planID;
        // auth()->user()->paystack_subscribtion_id = $request->subscriptionID;
         //auth()->user()->update();
 
         return response()->json(
             [
                 'status' => true,
                 'success_url' => redirect()->intended('/plan')->getTargetUrl(),
             ]
         );
     }

     //Webhook called when there is an event
     public function webhook(Request $request)
     {
       //Email - find the user
       $event = $request->event;
       $user = User::where('email', $request->data['customer']['email'])->first();
      
       if($user){
            if($event=="subscription.create"){
                    $subscription_plan_id = $request->data['plan']['plan_code'];
                    $plan = Plans::where('paystack_id', $subscription_plan_id)->firstOrFail();
                    $user->plan_id = $plan->id;
                    $user->paystack_subscribtion_id = $request->data['subscription_code'];
                    $user->update();
            }
            if($event=="subscription.disable"||$event=="subscription.not_renew"){
                $user->plan_id = null;
                $user->paystack_subscribtion_id = null;
                $user->update();
        }
       }
       dd('done');
       
     } 

    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        return view('paystack-subscribe::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('paystack-subscribe::create');
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
        return view('paystack-subscribe::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return view('paystack-subscribe::edit');
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
