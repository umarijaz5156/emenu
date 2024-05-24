<?php

namespace App\Services;

use App\Items;
use App\Order;
use App\Plans;
use App\Restorant;
use App\User;

class LimitCheckerService
{
//all limits that will be handled
        private $limits = [
                "limit_items",
                "limit_orders",
                "limit_views",
                "limit_staff",
                "limit_qrcode",
                "limit_tables",
                "monthly_price",
                "limit_lang",
                ];

        /*
         @param $threshold - percent value, the percent before limit
         */
        function __construct($threshold = 10)
        {
            $this->threshold = $threshold;
        }

    /** gets an array with all limitations
     * @param Restorant $restorant
     * @param $threshold - percent value, the percent before limit
     * @return void
     */
    public  function checkAllLimits(Restorant $restorant){
        $plan = $restorant->rawplan;

        $out = [];
        foreach ($this->limits as $limit_name){
            //iterate over all limits and run appropriate handler for each
            $ret = $this->handleLimit($limit_name, $restorant);
            if (count($ret)){
                $out = array_merge($ret,$out);
            }
        }

        return $out;
    }

    /**
     * @param string $limit_name
     * @param Restorant $restorant
     * @return void
     */
    public function handleLimit(string $limit_name, Restorant $restorant): array
    {
        $plan = $restorant->rawplan;
        if ($plan == null){
            return [];
        }
        $planLimit = $plan->{$limit_name};
        if ($planLimit == 0){
            return [];
        }

        $funcName = preg_replace_callback('/(_)(\w)/m', function ($matches) {
            return strtoupper($matches[2]);
        }, $limit_name);

        if (method_exists($this, $funcName)) {
            $itemsCount = $this->{$funcName}($restorant,$plan);
        }else{
            return [];
        }
        $limit = round((int)$planLimit*$this->threshold/100);
        $limitReached = $planLimit - $itemsCount <= $limit;
        if ($limitReached){
            return [$limit_name=>[
                'plan_limit'   => $planLimit,
                'limit'        => $limit,
                'count'        => $itemsCount,
                'msg'          => sprintf(trans('limits.'.$limit_name),$planLimit,$itemsCount),
            ]


            ];
        }

        return [];
    }


    /* Handlers - func($restoran,$plan)*/

    private function limitItems(Restorant $restorant, Plans $plan):mixed
    {
        return Items::whereIn('category_id', $restorant->categories->pluck('id')->toArray())->whereNull('deleted_at')->count();
    }


    private function limitOrders(Restorant $restorant, Plans $plan):mixed
    {
        return Order::where('restorant_id', $restorant->id)->where('payment_status','!=','paid')->count();
    }


    private function limitStaff(Restorant $restorant, Plans $plan):mixed
    {
        return User::where('restaurant_id', $restorant->id)->whereNull('deleted_at')->count();
    }

    private function limitQrcode(Restorant $restorant, Plans $plan):mixed
    {
        return $restorant->qr_count;
    }
    private function limitTables(Restorant $restorant, Plans $plan):mixed
    {
        $ffs =  $restorant->tables->count();
        return $ffs;
    }


}
