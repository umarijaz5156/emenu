<?php

namespace App\Console\Commands;

use App\Order;
use App\Restorant;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class clearOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'orders:clear {restourantdomain} {status}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Removes all orders with status orders:clear {restourantdomain} {status';

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
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        $domain = $userId = $this->argument('restourantdomain');
        $status = $userId = $this->argument('status');

        $restourant = Restorant::where('subdomain',$domain)->withTrashed()->get()->first();
        if(!$restourant){
            return $this->error('please provide a valid domain name restourent not found. Check php artisan restaurant:list');
        }

        $orders = Order::where('payment_status',$status)->withTrashed()->get();
        if ($orders->count()==0){
            return $this->error('orders with status `'.$status.'` doesnt found ');
        }

        foreach ($orders as $order){
            $item_has_orders   = DB::select("SELECT * FROM `order_has_items` WHERE `order_id`={$order->id}");
            $item_has_statuses = DB::select("SELECT * FROM `order_has_status` WHERE `order_id`={$order->id}");

            if(count($item_has_orders)){
                foreach ($item_has_orders as $order_record){
                    $id = $order_record->id;
                    $this->deleteSimpleModelRaw('order_has_items','id',$order_record->id);
                }
            }
            if(count($item_has_statuses)){
                foreach ($item_has_statuses as $order_record){
                    $id = $order_record->id;
                    $this->deleteSimpleModelRaw('order_has_status','id',$order_record->id);
                }
            }
            $order->forceDelete();
        }

        $this->info('Clear all opened orders deleted '.$orders->count().' records');

        return 0;
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


}
