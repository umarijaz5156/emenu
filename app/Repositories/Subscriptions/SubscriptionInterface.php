<?php

namespace App\Repositories\Subscriptions;

use App\Plans;
use App\Restorant;
use Illuminate\Http\Request;

interface SubscriptionInterface
{
    /** provide link to a checkout process or whenever you want
     * @param Restorant $restourant
     * @param Plans $plan
     * @param $config - additional params
     * @return mixed checkout links
     */
    function getCheckoutLink(Restorant $restourant, Plans $plan, $config = []);

    /** make confirmation routines
     * @param Request $request
     * @return bool if confirmation being processed return true
     */
    function confirm(Request $request):bool;

    /** generates a payload
     * @param Restorant $restourant
     * @param Plans $plan
     * @param $config - additional params
     * @return mixed checkout links
     */
    function generatePayload(Request $request, $config = []);
}
