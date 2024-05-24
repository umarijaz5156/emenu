<?php

namespace Modules\PaypalSubscribe\Http\Controllers;
use PayPal\Api\Agreement;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Rest\ApiContext;

class App
{

    public function validate($user)
    {
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
        $token = $apiContext->getCredential()->getAccessToken(array());

        //Agreement
        $createdAgreement = $user->paypal_subscribtion_id;
       

        if ($createdAgreement != null) {
            
            //Crete the endpoint
            $endpoint="https://api.".(config('paypal-subscribe.mode')=="sandbox"?"sandbox.":"")."paypal.com/v1/billing/subscriptions/".$createdAgreement;

            $client = new \GuzzleHttp\Client();

            $payload = [
                'query' => [
                    'key' => config('settings.google_maps_api_key')
                    //'input' => $term,
                ],
            ];

            $options = [
                'http_errors' => true,
                'force_ip_resolve' => 'v4',
                'connect_timeout' => 20,
                'read_timeout' => 20,
                'timeout' => 20,
                'headers' => [
                    'Authorization' => 'Bearer '.$token,
                    'Accept'     => 'application/json',
                ]
            ];
            
            
            //dd('hsssssre');
            $response = $client->request('GET', $endpoint,$options);

            if ($response->getStatusCode() !== 200) {
                return response()->json(['results'=>[]]);
            }
            $responseDecoded = json_decode($response->getBody(),true);
            
            $status=$responseDecoded['status'];
            $links=$responseDecoded['links'];
            
            
            if($status == 'CANCELLED'){
            
                $user->update_url = "";
                $user->cancel_url = "";
                $user->plan_id = null;
                $user->paypal_subscribtion_id = "";
                $user->update();
            }elseif ($status != 'INACTIVE') {
                    //$data['intent'] = $createdAgreement;
                    $user->update_url = $links[1]['href'];
                    $user->cancel_url = $links[0]['href'];
                    $user->update();
                
            }
        } else {
            $user->plan_id = null;
            $user->cancel_url = null;
            $user->update_url = null;
            $user->update();
        }
    }
}
