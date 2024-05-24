<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\TempOrder;

class ClearTempOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clear:temp-orders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command will clear temporary orders table every day.';

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
        TempOrder::truncate();
        return 0;
    }
}
