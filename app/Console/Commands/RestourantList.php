<?php

namespace App\Console\Commands;

use App\Restorant;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class RestourantList extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'restaurant:list';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'show restourant list';

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
        $restorareas = collect(DB::select("SELECT `id`,`name`,`subdomain`,`user_id` from `companies` "))->toArray();
        $restorareas = json_decode(json_encode($restorareas), true);

        $this->table(['Id','Name', 'Subdomain', 'UserId'],$restorareas);
        return 0;
    }
}
