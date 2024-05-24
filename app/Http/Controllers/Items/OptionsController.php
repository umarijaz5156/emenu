<?php

namespace App\Http\Controllers\Items;

use App\Http\Controllers\Controller;
use App\Items;
use App\Models\Options;
use Illuminate\Http\Request;

class OptionsController extends Controller
{
    private function getFields()
    {
        return [
            ['ftype'=>'splitstring', 'name'=>'Name', 'id'=>'name', 'placeholder'=>'Enter option name, ex size', 'required'=>true],
            ['ftype'=>'splitstring', 'name'=>'List of option values', 'id'=>'options', 'placeholder'=>'Enter comma separated list of avaliable option values, ex: small,medium,large', 'required'=>true],
        ];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Items $item)
    {

        $items = $item->options()->paginate(10);
        // dd($items);

        return view('items.options.index', ['setup' => [
            'title'=>__('Options for').' '.$item->name,
            'action_link'=>route('items.options.create', ['item'=>$item->id]),
            'action_name'=>'Add new option',
            'items'=>$items,
            'item_names'=>'options',
            'breadcrumbs'=>[
                [__('Menu'), '/items'],
                [$item->name, '/items/'.$item->id.'/edit'],
                [__('Options'), null],
            ],
        ]]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Items $item)
    {

        $value = [];
        $fields = $this->getFields();
        $fields[1]['value'] = $value;

        $payload_objects = ['setup' => [
            'title'=>__('New option for').' '.$item->name,
            'action_link'=>route('items.options.index', ['item'=>$item->id]),
            'action_name'=>__('Back'),
            'iscontent'=>true,
            'action'=>route('items.options.store', ['item'=>$item->id]),
            'breadcrumbs'=>[
                [__('Menu'), '/items'],
                [$item->name, '/items/'.$item->id.'/edit'],
                [__('Options'), route('items.options.index', ['item'=>$item->id])],
                [__('New'), null],
            ],
        ],
        'fields'=>$fields,
        // 'item_id'=>$item->id,
    ];

        // dd($payload_objects);

        return view('general.form', $payload_objects);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Items $item, Request $request)
    {

        // $options = Options::where('item_id', $item->id)->get();

        $string = $this->pack(request()->options);

        $option = Options::create([
            'name'=>$request->name,
            'options'=> str_replace(', ', ',', $this->simple_replace_spec_char($string)),
            'item_id'=>$item->id,
        ]);
        $option->save();

        return redirect()->route('items.options.index', ['item'=>$item->id])->withStatus(__('Option has been added'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Options $option)
    {
        $fields = $this->getFields();
        $fields[0]['value'] = $option->name;
        $fields[1]['value'] = $this->unpack($option->options);

        return view('general.form', ['setup' => [
            'title'=>__('Edit option').' '.$option->name,
            'action_link'=>route('items.options.index', ['item'=>$option->item]),
            'action_name'=>__('Back'),
            'iscontent'=>true,
            'isupdate'=>true,
            'action'=>route('items.options.update', ['option'=>$option->id]),
            'breadcrumbs'=>[
                [__('Menu'), '/items'],
                [$option->item->name, '/items/'.$option->item->id.'/edit'],
                [__('Options'), route('items.options.index', ['item'=>$option->item->id])],
                [$option->name, null],
            ],
        ],
        'fields'=>$fields, ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Options $option)
    {
        $option->name = $request->name;
        $option->options = $this->pack($request->options);
        $option->update();
        return redirect()->route('items.options.index', ['item'=>$option->item->id])->withStatus(__('Option has been updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Options $option)
    {
        $option->delete();

        return redirect()->route('items.options.index', ['item'=>$option->item->id])->withStatus(__('Option has been removed'));
    }

    /** String to array
     * @param string $option
     * @return mixed
     */
    public static function unpack($option)
    {
        $opt = [];

        if ($option == '') {
            $opt = [];
        }else{
            $arr = explode(",", $option);
            $global_currency = (auth()->user() && auth()->user()->restorant && auth()->user()->restorant->currency!='') ? auth()->user()->restorant->currency :config('settings.cashier_currency');
            $sign = '+';
            foreach ($arr as $value) {
                $a = preg_match('/(.*)(\+)[^\d]*(\d+\.*\d*)[^\d]*(\D\D\D)/m', $value, $match);
                $price = 0;
                $desc = $value;
                $val = false;
                try{
                    $temp_currency = currency($match[4]);
                    $val = true;
                }catch (\Exception $e){
                    $val = false;
                }

                $temp_currency = (isset($match[4]) && $val)?$match[4]:$global_currency;

                if ($a && isset($match[3])) {
                    $price    = $match[3];
                    $desc     = isset($match[1])?$match[1]:'';
                    $currency = $temp_currency;
                    $sign     = isset($match[2])?$match[2]:$sign;
                }
                $opt[] = [
                    'price'    => $price,
                    'desc'     => $desc,
                    'currency' => $temp_currency,
                    'sign'     => $sign
                ];

            }
        }

        return $opt;
    }

    private function pack(mixed $options)
    {
        $str = [];

        if (!empty(request()->options)) {
            foreach (request()->options as $value){
                if ($value['price']){
                    $str[] = "{$value['desc']}{$value['sign']}{$value['price']}{$value['currency']}";
                }else{
                    $str[] = "{$value['desc']}";
                }

            }
        }
        // dd($str);

        $str = implode(',',$str);
        $pack = str_replace(', ', ',', $str);
        return $pack;
    }
}
