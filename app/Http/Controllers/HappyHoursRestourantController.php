<?php

namespace App\Http\Controllers;

use Akaunting\Module\Facade as Module;
use App\Models\HappyHoursForRestourant;
use App\Restorant;
use Illuminate\Http\Request;

class HappyHoursRestourantController extends Controller
{

    /**
     * Creates restourant HappyHours discount.
     * @param Restorant $restorant
     * @param Request $request
     * @return void
     */
    public function create(Restorant $restourant, Request $request)
    {

        $input = $request->all();

        if ($restourant && isset($input['period']['new'])) {
            //Update from form
            if (isset($input["period"]["new"]["id"]) && $input["period"]["new"]["id"] != 'new') {
                return $this->update($restourant, $request);
            }
            //Create if new
            $happyHours = HappyHoursForRestourant::create(
                   ['restourant_id' => $restourant->id,
                    'start'         => date('H:i:s', strtotime($input["period"]["new"]["start"])),
                    'end'           => date('H:i:s', strtotime($input["period"]["new"]["end"])),
                    'day'           => $input["period"]["new"]["day"],
                    'discount_type' => 'percent',
                    'amount'        => $input["period"]["new"]["amount"]]
            );
            $happyHours->save();
            return redirect()->route('admin.restaurant.happyHours.show', $restourant)->withStatus(__('Period discount time added succesfully.'));
        }
        return redirect()->route('admin.restaurant.happyHours.show', $restourant);

    }


    /**
     * Update restourant HappyHours Value
     * @param Restorant $restourant
     * @param Request $request
     * @return mixed
     */
    public function update(Restorant $restourant, Request $request)
    {
        //$item->HappyHourss()->delete();
        foreach ($request->input('period') as $v) {
            $happyHours = null;
            if ($v['id']) {
                $happyHours = HappyHoursForRestourant::where('id', $v['id'])->first();

                $happyHours->fill([
                    'restourant_id' => $v['restorant_id'],
                    'start'         => date('H:i:s', strtotime($v['start'])),
                    'end'           => date('H:i:s', strtotime($v['end'])),
                    'day'           => $v["day"],
                    'discount_type' => 'percent',
                    'amount'        => $v['amount']
                ]);
            } else {
                $happyHours = HappyHoursForRestourant::create(
                    ['restourant_id'    => $restourant->id,
                        'start'         => date('H:i:s', strtotime($v['start'])),
                        'end'           => date('H:i:s', strtotime($v['end'])),
                        'discount_type' => 'percent',
                        'day'           => $v["day"],
                        'amount'        => $v['amount']
                    ]);

            }
            $happyHours->save();
        }
        return redirect()->route('admin.restaurant.happyHours.show', $restourant)->withStatus(__('Period discount time changed succesfully.'));

    }

    /**
     * Delete restourant HappyHours Value
     * @param HappyHoursForRestourant $happyHours
     * @return mixed
     */
    public function delete(HappyHoursForRestourant $happyHours){
        if ($happyHours) {
            $restourant = $happyHours->restourant;
            $happyHours->delete();

            if ($restourant){
                return redirect()->route('admin.restaurant.happyHours.show', $restourant)->withStatus(__('Period discount time removed succesfully.'));
            }
        }
        return redirect()->route('admin.restaurant.happyHours.show', $happyHours->restourant)->withStatus(__('Period discount time changed succesfully.'));
    }

    public function show(){
        $restaurant = auth()->user()->restorant;

        $doWeHaveOrderAfterHours = Module::has('orderdatetime') && $restaurant->getConfig('order_date_time_enable', false);
        $businessHours=$restaurant->getBusinessHours();
        $canDoOrdering = $restaurant->getPlanAttribute()['canMakeNewOrder'];
        $canDoOrdering = $canDoOrdering && ($businessHours->isOpen() || $doWeHaveOrderAfterHours);
        if ($restaurant->getConfig('disable_ordering', false)) {
            $canDoOrdering = false;
        }

        return view('restorants.happy_hours',['restorant' => $restaurant,'canDoOrdering' => $canDoOrdering]);
    }

}
