<?php

namespace App\Http\Controllers;

use App\Models\SimpleDelivery;
use Illuminate\Http\Request;
use App\Restorant;

class SimpleDeliveryController extends Controller
{
    /**
     * Provide class.
     */
    private $provider = SimpleDelivery::class;

    /**
     * Web RoutePath for the name of the routes.
     */
    private $webroute_path = 'admin.restaurant.simpledelivery.';

    /**
     * View path.
     */
    private $view_path = 'delivery.';

    /**
     * Parameter name.
     */
    private $parameter_name = 'delivery';

    /**
     * Title of this crud.
     */
    private $title = 'Delivery area';

    /**
     * Title of this crud in plural.
     */
    private $titlePlural = 'Delivery areas';

    /**
     * Auth checker functin for the crud.
     */
    private function authChecker()
    {
        $this->ownerOnly();
    }

    private function getFields()
    {
        return [
            ['class'=>'col-md-4', 'ftype'=>'input', 'name'=>'Name', 'id'=>'name', 'placeholder'=>__('Enter delivery area name'), 'required'=>true],
            ['class'=>'col-md-4', 'ftype'=>'input', 'type'=>'number', 'name'=>__('Delivery cost'), 'id'=>'cost', 'placeholder'=>__('Enter delovery cost'), 'required'=>true],
            ['class'=>'col-md-4', 'ftype'=>'input', 'name'=>'Phone', 'id'=>'phone', 'placeholder'=>__('Enter phone'),'required'=>false]
        ];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authChecker();

        $restaurant = $this->getRestaurant();
        $delivery_area_tax = $restaurant->delivery_area_tax;
        // $delivery_area_tax_form_route = route($this->webroute_path.'/updateDeliveryAreaTax');
        // dd($restaurant->delivery_area_tax);

        // dd($this->webroute_path.'index');
        // dd($restaurant->id);

        return view($this->view_path.'index', ['setup' => [
            'title'=>__('crud.item_managment', ['item'=>__($this->titlePlural)]),
            'action_link'=>route($this->webroute_path.'create'),
            'action_name'=>__('crud.add_new_item', ['item'=>__($this->title)]),
            'items'=>$this->getRestaurant()->deliveryareas()->paginate(config('settings.paginate')),
            'item_names'=>$this->titlePlural,
            'webroute_path'=>$this->webroute_path,
            'fields'=>$this->getFields(),
            'parameter_name'=>$this->parameter_name,
            'delivery_area_tax'=>$delivery_area_tax,
            'restaurant_id'=> $restaurant->id
        ]]);
    }



    public function updateDeliveryAreaTax(Request $request) {
        // dd($request->all(), $request->delivery_area_tax);
        // $this->authChecker();
        // $restaurant = $this->getRestaurant();
        // dd($request->all());
        $restaurant_model = Restorant::find($request->restuarent_id);
        $restaurant_model->delivery_area_tax = $request->delivery_area_tax;
        $restaurant_model->save();

        // return a json message
        // return response()->json([
        //     'status' => true,
        //     'message' => __('crud.delivery_area_tax_has_been_updated')
        // ]);

        return redirect()->route($this->webroute_path.'index')->withStatus(__('crud.item_has_been_updated', ['item'=>__($this->title)]));
        }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authChecker();

        // dd(route($this->webroute_path.'index'));

        return view('general.form', ['setup' => [
            'inrow'=>true,
            'title'=>__('crud.new_item', ['item'=>__($this->title)]),
            'action_link'=>route($this->webroute_path.'index'),
            'action_name'=>__('crud.back'),
            'iscontent'=>true,
            'action'=>route($this->webroute_path.'store'),
        ],
        'fields'=>$this->getFields(), ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->authChecker();
        $item = $this->provider::create([
            'name'=>$request->name,
            'cost'=>$request->cost,
            'phone'=>$request->phone?$request->phone:"",
            'restaurant_id'=>$this->getRestaurant()->id,
        ]);
        $item->save();

        return redirect()->route($this->webroute_path.'index')->withStatus(__('crud.item_has_been_added', ['item'=>__($this->title)]));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Tables  $tables
     * @return \Illuminate\Http\Response
     */
    public function show(Tables $tables)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Tables  $tables
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $this->authChecker();
        $item = $this->provider::findOrFail($id);
        if($item->restaurant_id!=$this->getRestaurant()->id){
            return abort(404);
        }
        $fields = $this->getFields();
        $fields[0]['value'] = $item->name;
        $fields[1]['value'] = $item->cost;
        $fields[2]['value'] = $item->phone;


        $parameter = [];
        $parameter[$this->parameter_name] = $id;

        return view('general.form', ['setup' => [
            'inrow'=>true,
            'title'=>__('crud.edit_item_name', ['item'=>__($this->title), 'name'=>$item->name]),
            'action_link'=>route($this->webroute_path.'index'),
            'action_name'=>__('crud.back'),
            'iscontent'=>true,
            'isupdate'=>true,
            'action'=>route($this->webroute_path.'update', $parameter),
        ],
        'fields'=>$fields, ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Tables  $tables
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->authChecker();
        $item = $this->provider::findOrFail($id);
        $item->name = $request->name;
        $item->cost = $request->cost;
        $item->phone = $request->phone;
        $item->update();

        return redirect()->route($this->webroute_path.'index')->withStatus(__('crud.item_has_been_updated', ['item'=>__($this->title)]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Tables  $tables
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authChecker();
        $item = $this->provider::findOrFail($id);
        if($item->restaurant_id!=$this->getRestaurant()->id){
            return abort(404);
        }
        $item->delete();

        return redirect()->route($this->webroute_path.'index')->withStatus(__('crud.item_has_been_removed', ['item'=>__($this->title)]));
    }
}
