<?php

namespace App\Console\Commands;

use App\Address;
use App\Categories;
use App\Hours;
use App\Items;
use App\Order;
use App\Restorant;
use App\User;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class DeleteRestourant extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'restaurant:delete {domain}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'this command deletes all restourants with all drivers, items, hours, payment issues, etc';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param $restourant
     * @return void
     */
    public function deleteSimpleModel($classname,$ref_id): void
    {
        if( method_exists($classname, 'trashed') ) {
            $values = $classname::where('id', $ref_id)->withTrashed()->get();
        }else{
            $values = $classname::where('id', $ref_id)->get();
        }

        if ($values) {
            foreach ($values as $value) {
                $value->forceDelete();
            };
        }
    }

    public function deleteSimpleModelRaw($tablename,$key,$ref_id): void
    {
        $values = DB::select("SELECT * from `{$tablename}` where `{$key}`='{$ref_id}'");

        if ($values) {
            foreach ($values as $value) {
                DB::delete("DELETE FROM {$tablename} WHERE `id`={$value->id}");
            };
        }
    }

    /**
     * Prompt for missing input arguments using the returned questions.
     *
     * @return array
     */
    protected function promptForMissingArgumentsUsing()
    {
        return [
            'domain' => 'please provide an existing domain',
        ];
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $domain = $userId = $this->argument('domain');

        //check if restourant exists
        $restourant = Restorant::where('subdomain',$domain)->withTrashed()->get()->first();
        if ($restourant == null){
            return $this->error('There is no such restourant with domain '.$domain);
        }

        $orders_in = implode(',',Order::withTrashed()->where('restorant_id',$restourant->id)->pluck('id')->toArray());



        $categories =  Categories::where('restorant_id',$restourant->id)->withTrashed()->get();

        $items = new Collection([]);
        foreach ($categories as $category){
            $items_temp = Items::where('category_id',$category->id)->withTrashed()->get();
            $items = $items->merge($items_temp);
        }
        $items_in = implode(',',$items->pluck('id')->toArray());

        $extras_in = "";
        if ($items_in){
            $extras = collect(DB::select("SELECT * from `extras` where `item_id` in ({$items_in})"));
            $extras_in = implode(',',$extras->pluck('id')->toArray());
        }else{
            $this->warn('no extras left for this restourant');
        }

        //get user
        $user = User::where('id',$restourant->user_id)->withTrashed()->get()->first();


        $restorareas = collect(DB::select("SELECT * from `restoareas` where `restaurant_id` = {$restourant->id}"));
        $restorareas_in = implode(',',$restorareas->pluck('id')->toArray());

        $variants_in="";
        if($items_in){
            $variants = collect(DB::select("SELECT * from `variants` where `item_id` in ({$items_in})"));
            $variants_in = implode(',',$variants->pluck('id')->toArray());
        }else{
            $this->warn('no variants left for this restourant');
        }


        $this->deleteSimpleModelRaw('hours','restorant_id',$restourant->id);
        $this->deleteSimpleModel(Address::class,$user->id);


        $config_data = $restourant->getAllConfigs();
        foreach ($config_data as $key => $value){
            $q = 'DELETE FROM configs where model_type = \''.str_replace('\\','\\\\',Restorant::class).'\' AND `key`=\''.$key.'\' AND `value`=\''.$value.'\'';
            DB::statement($q);
        }


        $this->deleteSimpleModelRaw('expenses','restaurant_id',$restourant->id);
        $this->deleteSimpleModelRaw('expenses_category','restaurant_id',$restourant->id);
        $this->deleteSimpleModelRaw('expenses_vendor','restaurant_id',$restourant->id);



        if ($items_in){
            DB::delete("DELETE FROM `options` WHERE `item_id` IN ({$items_in})");
            DB::delete("DELETE FROM `order_has_items` WHERE `item_id` IN ({$items_in})");
        }
        if ($orders_in){
            DB::delete("DELETE FROM `order_has_status` WHERE `order_id` IN ({$orders_in})");
        }
        //dd($items_in);

        $this->deleteSimpleModelRaw('order_has_status','user_id',$user->id);
        $this->info('order_has_statuss deleted');
        $this->deleteSimpleModelRaw('orders','restorant_id',$restourant->id);
        $this->info('order_has_statuss deleted');
        $this->deleteSimpleModelRaw('payment_histories','user_id',$user->id);
        $this->info('order_has_statuss deleted');

        if ($items_in){
            DB::delete("DELETE FROM `period_discounts` WHERE `item_id` IN ({$items_in})");
            $this->info('period_discounts deleted');
        }



        $this->deleteSimpleModelRaw('period_discounts_for_restourants','restourant_id',$restourant->id);
        $this->deleteSimpleModelRaw('order_has_status','user_id',$user->id);
        $this->deleteSimpleModelRaw('simple_delivery_areas','restaurant_id',$restourant->id);
        $this->deleteSimpleModelRaw('sms_verifications','user_id',$user->id);
        $this->deleteSimpleModelRaw('sms_verifications','user_id',$user->id);
        $this->deleteSimpleModelRaw('tables','restaurant_id',$restourant->id);
        $this->deleteSimpleModelRaw('localmenus','restaurant_id',$restourant->id);
        $this->deleteSimpleModelRaw('restoareas','restaurant_id',$restourant->id);
        $this->deleteSimpleModelRaw('coupons','restaurant_id',$restourant->id);

        $variants_has_extras_in = "";
        if($extras_in){
            $variants_has_extras = collect(DB::select("SELECT * from `variants_has_extras` WHERE `extra_id` IN ({$extras_in})"));
            $variants_has_extras_in = implode(',',$variants_has_extras->pluck('id')->toArray());
        }



        if($variants_has_extras_in){
            DB::delete("DELETE FROM `variants_has_extras` WHERE `id` IN ({$variants_has_extras_in})");
        }

        if($variants_in){
            DB::delete("DELETE FROM `variants` WHERE `id` IN ({$variants_in})");
        }

        if ($items_in){
            DB::delete("DELETE FROM `extras` WHERE `item_id` IN ({$items_in})");
            DB::delete("DELETE FROM `items` WHERE `id` IN ({$items_in})");
            $this->info('items and  extras deleted');
        }else{
            $this->warn('no items and extras for this restourant');
        }

        if($variants_in){
            DB::delete("DELETE FROM `variants` WHERE `id` IN ({$variants_in})");
        }

        foreach ($categories as $category){
            $category->forceDelete();
        }

       collect(DB::statement("UPDATE `users` set `restaurant_id` = null where `restaurant_id` = {$restourant->id}"));

        $user->restaurant_id = null;
        $user->save();

        if($restourant){
            DB::delete("DELETE FROM `companies` WHERE `id` = {$restourant->id}");
        }

        $otherRestourantsUnderThisUserExists = collect(DB::select("SELECT COUNT(*) as 'count' from `companies`  where `user_id` = {$user->id}"))->toArray()[0]->count>0;

        if($user && !$otherRestourantsUnderThisUserExists){
            $this->info("deleting user {$user->id}");
            DB::delete("DELETE FROM `users` WHERE `id` = {$user->id}");
        }else{
            $this->warn("leave user cuz model is bundled with other restourants, user Id = {$user->id}");
        }


        return 0;
    }
}
