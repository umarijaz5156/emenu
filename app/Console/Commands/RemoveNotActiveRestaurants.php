<?php

namespace App\Console\Commands;

use App\Restorant;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class RemoveNotActiveRestaurants extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:remove-not-active-restaurants';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
        $rests = Restorant::all();
        foreach ($rests as $vendor){
            if ($vendor->active !=1){
                Artisan::call('restaurant:delete '.$vendor->subdomain);
                $this->info("removed {$vendor->subdomain}");
            }
        }
        return 0;
    }
}
