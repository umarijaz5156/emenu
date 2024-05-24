<?php

namespace Modules\PaypalSubscribe\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;

class Main extends Controller
{

    //Subscribe
    public function subscribe(Request $request)
    {
        //Assign user to plan
        auth()->user()->plan_id = $request->planID;
        auth()->user()->paypal_subscribtion_id = $request->subscriptionID;
        auth()->user()->update();

        return response()->json(
            [
                'status' => true,
                'success_url' => redirect()->intended('/plan')->getTargetUrl(),
            ]
        );
    }
    

    public function updateCancelSubscription(Request $request)
    {

        //Get token
        $apiContext = new ApiContext(
            new OAuthTokenCredential(
                config('paypal-subscribe.client_id'),     // ClientID
                config('paypal-subscribe.secret')    // ClientID
            )
        );

        $apiContext->setConfig(
            array(
                'mode' => config('paypal-subscribe.mode'),
            )
        );
        $access_token = $apiContext->getCredential()->getAccessToken(array());
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, auth()->user()->cancel_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, "{\n  \"reason\": \"Not satisfied with the service\"\n}");
        curl_setopt($ch, CURLOPT_POSTFIELDS, "{\n}");
        curl_setopt($ch, CURLOPT_POST, 1);

        $headers = array();
        $headers[] = 'Content-Type: application/json';
        
        $headers[] = 'Authorization: Bearer '.$access_token.'';
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSLVERSION , 6); //NEW ADDITION

        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Error:' . curl_error($ch);
        }
        curl_close ($ch);

       return redirect('/plan');
    }
}
