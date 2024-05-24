<?php

namespace App\Http\Controllers;

use App\Items;
use App\Models\HappyHours;
use App\Models\HappyHoursForRestourant;
use App\Restorant;
use Illuminate\Http\Request;

class HappyHoursController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Items $item, Request $request)
    {
        $input = $request->all();

        if ($item && isset($input['period']['new'])) {
            //Update from form
            if (isset($input["period"]["new"]["id"]) && $input["period"]["new"]["id"] != 'new') {
                return $this->update($item, $request);
            }

            $happyHours = HappyHours::create(
                   ['item_id' => $item->id,
                    'start' => date('H:i:s', strtotime($input["period"]["new"]["start"])),
                    'end' => date('H:i:s', strtotime($input["period"]["new"]["end"])),
                    'day' => $input["period"]["new"]["day"],
                    'discount_type' => 'value',
                    'amount' => $input["period"]["new"]["amount"]]
            );
            $happyHours->save();
            return redirect()->route('items.edit', $item)->withStatus(__('Happy Hours created succesfully'));
        } else {
            return redirect()->route('items.edit', $item)->withErrors(__('Happy Hors wasnt updated correctly'));
        }
        return redirect()->route('items.edit', $item)->withErrors(['HappyHours' => __('Happy Hors wasnt updated correctly')]);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\HappyHours $HappyHours
     * @return \Illuminate\Http\Response
     */
    public function get(Items $item)
    {
        if ($item->HappyHourss()->count()) {
            $id = $item->HappyHourss()->first();
            $exists = true;
        } else {
            $id = 0;
            $exists = false;
        }

        return response()->json([
            'item' => $id,
            'exists' => $exists
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\HappyHours $HappyHours
     * @return \Illuminate\Http\Response
     */
    public function update(Items $item, Request $request)
    {
        //$item->HappyHourss()->delete();
        foreach ($request->input('period') as $v) {
            $HappyHours = null;
            if ($v['id']) {
                $HappyHours = HappyHours::where('id', $v['id'])->first();
                $HappyHours->fill($v);
            } else {
                $HappyHours = HappyHours::create(
                    ['item_id' => $item->id,
                        'start' => date('H:i:s', strtotime($v['start'])),
                        'end' => date('H:i:s', strtotime($v['end'])),
                        'discount_type' => 'value',
                        'amount' => $v['amount']]
                );

            }

            $HappyHours->save();
            return redirect()->route('items.edit', $item)->withStatus(__('Item successfully updated.'));

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\HappyHours $HappyHours
     * @return \Illuminate\Http\Response
     */
    public function destroy(HappyHours $HappyHours)
    {
        if ($HappyHours) {
            $HappyHours->delete();
            return redirect()->route('items.edit', ['item' => $HappyHours->item])->withStatus(__('Happy hours has been removed'));
        }
        return redirect()->route('items.edit', ['item' => $HappyHours->item])->withErrors(__('Happy hours has been removed'));
    }

    public function show(){
        return 'dsd';
    }

}
