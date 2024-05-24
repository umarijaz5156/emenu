<?php

namespace App\Http\Controllers;

use App\Categories;
use App\Extras;
use App\Imports\ItemsImport;
use App\Items;
use App\Plans;
use App\Restorant;
use Illuminate\Http\Request;
use Image;
use Maatwebsite\Excel\Facades\Excel;
use App\Services\ConfChanger;
use Akaunting\Module\Facade as Module;
use App\Models\DynamicPrice;

class DynamicPriceController extends Controller
{
    public function index()
    {
        if (auth()->user()->hasRole('owner')) {

            //Since 2.1.7 - there is sorting.
            $categories=auth()->user()->restorant->categories;

            //If first item order starts with 0
            if($categories->first()&&$categories->first()->order_index==0){
                Categories::setNewOrder($categories->pluck('id')->toArray());

                //Re-get categories
                $categories=auth()->user()->restorant->categories;
            }

            return view('dynamicPrice.index', [
                'categories' => $categories,
                'restorant_id' => auth()->user()->restorant->id,

                ]);
        } else {
            return redirect()->route('orders.index')->withStatus(__('No Access'));
        }
    }

    public function store(Request $request)
    {
        $input = [];
        $input = $request->all();
        
        unset($input['_token']);

        DynamicPrice::create($input);

        return redirect()->back()->withStatus(__('price created successfully.'));
    }

    public function getPrice(Request $request)
    {
        $itemID = $request->itemID;
        $view = view('dynamicPrice.inc.list',compact('itemID'))->render();
        return response()->json(['html'=>$view]);
    }

    public function getForm(Request $request)
    {
        $dynamicPrice = DynamicPrice::find($request->priceID);
        $itemID = $request->itemID;
        $day = $request->day;
        $view = view('dynamicPrice.inc.modelForm',compact('dynamicPrice', 'itemID', 'day'))->render();
        return response()->json(['html'=>$view]);
    }

    public function update(Request $request, $id)
    {
        $input = [];
        $input = $request->all();
        
        unset($input['_token']);

        $dynamicPrice = DynamicPrice::find($id);
        $dynamicPrice->update($input);

        return redirect()->back()->withStatus(__('price successfully updated.'));
    }
}
