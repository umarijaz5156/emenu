<?php

namespace App\Repositories\Subscriptions;

use App\Order;
use App\Plans;
use App\Restorant;
use ConvertApi\Error\Api;
use Exception;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use PayPal\Api\Agreement;
use PayPal\Api\Amount;
use PayPal\Api\ChargeModel;
use PayPal\Api\Currency;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\MerchantPreferences;
use PayPal\Api\Patch;
use PayPal\Api\PatchRequest;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\PaymentDefinition;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Plan;
use PayPal\Api\PlanList;
use PayPal\Api\RedirectUrls;
use PayPal\Api\ShippingAddress;
use PayPal\Api\Transaction;
use PayPal\Auth\OAuthTokenCredential;
use PayPal\Common\PayPalModel;
use PayPal\Rest\ApiContext;
//https://phppot.com/php/how-to-manage-recurring-payments-using-paypal-subscriptions-in-php/
class PaypalSubscription implements SubscriptionInterface
{
    function getCheckoutLink(Restorant $restourant, Plans $plan, $config=[]){

        $coupon = (isset($config['coupon']))?$config['coupon']:false;

        $apiContext = $this->createApiContext($config, $restourant);

        $agreement = $this->createAgreement($plan);

        $pplan = $this->createPlan($plan, $restourant);

        $payer = $this->createPayer();

        $agreement->setPayer($payer);

        $paymentDefinition = $this->createPaymentDefinition($plan,$coupon);

        $merchantPreferences = $this->createMerchantPreferences($restourant, $plan,$coupon);

        //$chargeModel = $this->createChargeModel();

        $paymentDefinition->setChargeModels(array(
            //$chargeModel
        ));

        $pplan->setPaymentDefinitions([$paymentDefinition]);

        $pplan->setMerchantPreferences($merchantPreferences);

        try {
            $createdPlan = $pplan->create($apiContext);
        }catch (\PayPal\Exception\PayPalConnectionException $ex) {
            echo $ex->getCode();
            echo $ex->getData();
            die($ex);
        } catch (Exception $ex) {
            die($ex);
        }

        $patch = $this->createPatch();

        $patchRequest = new PatchRequest();

        $patchRequest->addPatch($patch);
        $createdPlan->update($patchRequest, $apiContext);

        $patchedPlan = Plan::get($createdPlan->getId(), $apiContext);

        // Set plan id
        // Plan needs to be created on server
        $pplan = new Plan();
        $pplan->setId($patchedPlan->getId());

        $agreement->setPlan($pplan);

        try {

            $agreement->create($apiContext);

            //Set payment link in order
            $payment_link=$agreement->getApprovalLink();

            if($coupon){
                $coupon->used_count++;
                $coupon->save();
            }

            //All ok
            return $payment_link;

        } catch (\PayPal\Exception\PayPalConnectionException $ex) {
            echo $ex->getCode();
            echo $ex->getData();
            die($ex);
            dd($ex);
            return 'error';
        }
    }

    function confirm(Request $request): bool
    {
        $vendor = Restorant::find($_GET['vendor_id']);
        if ($vendor == null){
            return false;
        }
        $vendor->user->stripe_id = $request->get('ba_token');

        $vendor->user->update();
        //System setup
        $client_id  = config('paypal.client_id');
        $secret     = config('paypal.secret');
        $mode       = config('paypal.mode');

        //Setup based on vendor
        if(config('paypal.useVendor')){
            $client_id=$vendor->getConfig('paypal_client_id','');
            $secret=$vendor->getConfig('paypal_secret','');
            $mode=$vendor->getConfig('paypal_mode','sandbox');
        }


        $apiContext = new \PayPal\Rest\ApiContext(
            new \PayPal\Auth\OAuthTokenCredential(
                $client_id,     // ClientID
                $secret     // ClientID
            )
        );
        $apiContext->setConfig(array('mode' => $mode));

        try {
            $dataArray = $request->all();

            /* If the request success is true process with payment execution*/
            if (isset($_GET['success']) && $dataArray['success']) {


                $token = $_GET['token'];
                $agreement = new \PayPal\Api\Agreement();

                try {
                    // Execute agreement
                    $result = $agreement->execute($token, $apiContext);
                    //return  true;
                } catch (\PayPal\Exception\PayPalConnectionException $ex) {
                     echo $ex->getCode();
                     echo $ex->getData();
                     die($ex);
                     return  false;
                } catch (Exception $ex) {
                     return false;
                }

                if ($result->getState() == 'Active') {
                    return true;
                }
            }
        } catch (Exception $ex) {
            return redirect()->route('cart.checkout')->withMesswithErrorage('The payment attempt failed because additional action is required before it can be completed.')->withInput();
        }
        return false;
    }

    function generatePayload(Request $request, $config = [])
    {
        $payload = [];
        $payload['request'] = $request->all();
        $vendor = Restorant::findOrFail($_GET['vendor_id']);
        $payload['type'] = 'invoice.payment_succeeded';
        $payload['data']['object']['customer'] = $_GET["ba_token"];
        $payload['id']   = $request->get('ba_token');
        return $payload;
    }

    /**
     * @param mixed $config
     * @param Restorant $restourant
     * @return ApiContext
     */
    public function createApiContext(mixed $config, Restorant $restourant): ApiContext
    {
        if (isset($config) && isset($config['client_id']) && isset($config['secret']) && isset($config['mode'])) {
            $client_id = $config['client_id'];
            $secret = $config['secret'];
            $mode = $config['mode'];
        } else {
            $client_id = config('paypal.client_id');
            $secret = config('paypal.secret');
            $mode = config('paypal.mode');
        }

        \App\Services\ConfChanger::switchCurrency($restourant);

        $apiContext = new ApiContext(
            new OAuthTokenCredential(
                $client_id,
                $secret
            )
        );
        $apiContext->setConfig(array('mode' => $mode));
        return $apiContext;
    }

    /**
     * @param Plans $plan
     * @return Agreement
     */
    public function createAgreement(Plans $plan): Agreement
    {
        $delay = ($plan->period == 1)?'month':"year";
        $startDate = date('c', strtotime('+1 '.$delay));
        $agreement = new Agreement();
        $agreement->setName($plan->name . ' Agreement')
            ->setDescription($plan->name . ' Billing Agreement')
            ->setStartDate($startDate);
        return $agreement;
    }

    /**
     * @param Plans $plan
     * @return Plan
     */
    public function createPlan(Plans $plan): Plan
    {
// Set plan id
        $pplan = new Plan();
        $pplan->setId($plan->id)
            ->setName($plan->name)
            ->setDescription($plan->name)
            ->setType('INFINITE');
        return $pplan;
    }

    /**
     * @return Payer
     */
    public function createPayer(): Payer
    {
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');
        return $payer;
    }

    /**
     * @param Plans $plan
     * @return PaymentDefinition
     */
    public function createPaymentDefinition(Plans $plan, $coupon = false): PaymentDefinition
    {
// Set billing plan definitions
        $discount_amount = $this->getDiscount($coupon, $plan);
        $paymentDefinition = new PaymentDefinition();
        $paymentDefinition->setName('Regular Payments for'.$plan->name)
            ->setType('REGULAR')
            ->setFrequency(($plan->period == 1)?'MONTH':'YEAR')
            ->setFrequencyInterval('1')
            ->setAmount(new Currency(array(
                'value' => $plan->price,
                'currency' => strtoupper(config('settings.cashier_currency'))
            )));
        return $paymentDefinition;
    }

    /**
     * @param Restorant $restourant
     * @param Plans $plan
     * @return MerchantPreferences
     */
    public function createMerchantPreferences(Restorant $restourant, Plans $plan, $coupon = false): MerchantPreferences
    {
// Set merchant preferences
        $discount_amount = $this->getDiscount($coupon, $plan);
        $merchantPreferences = new MerchantPreferences();
        $merchantPreferences->setReturnUrl(route('verification.notice', ['p_type'=>'paypal','success'=>true,'vendor_id'=>$restourant->id]))
            ->setCancelUrl(route('plans.cancel', ['p_type'=>'paypal','success'=>true,'vendor_id'=>$restourant->id]))
            ->setAutoBillAmount('yes')
            ->setInitialFailAmountAction('CONTINUE')
            ->setMaxFailAttempts('0')
            ->setSetupFee(new Currency(array(
                'value' => $plan->price - $discount_amount,
                'currency' => strtoupper(config('settings.cashier_currency'))
            )));
        return $merchantPreferences;
    }

    /**
     * @return ChargeModel
     */
    public function createChargeModel(): ChargeModel
    {
// Set charge models
        $chargeModel = new ChargeModel();
        $chargeModel->setType('SHIPPING')->setAmount(new Currency(array(
            'value' => 1,
            'currency' => strtoupper(config('settings.cashier_currency'))
        )));
        return $chargeModel;
    }

    /**
     * @return Patch
     */
    public function createPatch(): Patch
    {
        $patch = new Patch();
        $value = new PayPalModel('{"state":"ACTIVE"}');
        $patch->setOp('replace')
            ->setPath('/')
            ->setValue($value);
        return $patch;
    }

    /**
     * @param mixed $coupon
     * @param Plans $plan
     * @return int|mixed
     */
    public function getDiscount(mixed $coupon, Plans $plan): mixed
    {
        $discount_amount = 0;
        if ($coupon) {
            $discount_amount = $coupon->calculateDeduct($plan->price);
        }
        return $discount_amount;
    }


}
