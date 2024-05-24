<?php

namespace App\Services;

use App\Items;
use App\Models\HappyHours;
use App\Models\DynamicPrice;
use App\Models\HappyHoursForRestourant;
use App\Restorant;
use Illuminate\Support\Facades\Route;
use Mockery\Exception;


class PriceCalculationService
{
    /**
     * Calculates regular price for an item
     * involving Happy Hours Feature.
     * Warning: Discount Price have much higher priority
     * TODO: idk if we can add this as a Model property accessor, cuz it invokes too frequently, need to check performance
     * and slow ttfb
     * @param $initial_price
     * @param Items $item
     * @return mixed
     */
    public function calculateRegularPrice($initial_price, Items $item){

        $item = Items::find($item->id);
        //Happy hours Price calculation logic
        $route = Route::current()->getName();

        //exclude some cases here


        if ($route == 'items.edit'){
            //returns if we are on menu admin page
            return $initial_price;
        }
        //Logic ---

        //check if item has HappyHours Values and  now time is beetween start and end time
        $day = strtolower(date('l'));
        $time = date('H:i');

        $restoraunt = $item->category->restorant;
        try{
            $itemHappyHourss        = HappyHours::where('item_id',$item->id)->where('day',$day)->whereTime('start','<=',$time)->whereTime('end','>=',$time)->get();
            $dynamicPrice        = DynamicPrice::where('item_id',$item->id)->where('day',$day)->whereTime('start','<=',$time)->whereTime('end','>=',$time)->get();
            $restorauntHappyHourss  = HappyHoursForRestourant::where('restourant_id',$restoraunt->id)->where('day',$day)->whereTime('start','<=',$time)->whereTime('end','>=',$time)->get();;



            // price Logic order
            // 3 - Single happyhours
            
            if($itemHappyHourss->count()){
                $initial_price = $itemHappyHourss->first()->amount;
                return $initial_price;
            }

            if($dynamicPrice->count()){
                $newPrice = ($initial_price * $dynamicPrice->first()->percentage) / 100;
                if ($dynamicPrice->first()->percentage_type == '-') {
                    $newPrice = ($initial_price - $newPrice);
                }else{
                    $newPrice = ($initial_price + $newPrice);
                }
                return $newPrice;
            }
            //2 - product discount
            if ($item->getRawOriginal('discounted_price') > 0){
                return $item->getRawOriginal('discounted_price');
            }

            // 1 Mass Happyy hours
            if($restorauntHappyHourss->count()){
                $val = $restorauntHappyHourss->first()->amount;
                $initial_price = (100-$val)/100*$initial_price;
                return $initial_price;
            }
            //! Happy hours Price calculation logic
            return $initial_price;
        }catch (Exception $e){
            return $initial_price;
        }


    }

    public function calculateDiscountPrice($initial_price_discount, Items $item){
        $item = Items::find($item->id);
        $route = Route::current()->getName();
        $hh_service = new HappyHoursService();

        //Happy hours Price calculation logic

        //Exclusions

        if ($route == 'items.edit'){
            //returns if we are on menu admin page
            return $initial_price_discount;
        }

        //according to an order

        // 3 - Single happyhours
        $hh_item_discount = $item->happyHoursNow();
        if($hh_item_discount->count()){
            return $item->getRawOriginal('price');
        }

        $dynamicPrice = $item->dynamicPriceNow();
        if($dynamicPrice->count()){
            return $item->getRawOriginal('price');
        }
        
        //2 - product discount
        if ($route == 'vendor' &&  isset($initial_price_discount) && $initial_price_discount > 0){
            return $item->getRawOriginal('price');
        }
        //Mass Happyy hours
        $hh_item_discount = $item->category->restorant->getCurrentHappyHoursPercent();
        if($hh_item_discount){
            return $item->getRawOriginal('price');
        }






        return  $initial_price_discount;


    }
}
