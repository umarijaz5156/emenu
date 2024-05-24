<?php

namespace App\Console\Commands;

use App\Models\PlanLimit;
use App\Plans;
use App\Restorant;
use App\Services\LimitCheckerService;
use App\Services\StripeServices;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Log;
use Laravel\Cashier\Cashier;

class TestCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'test-command';

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
        $this->call('lang:translate',['--source'=>'en','--lang'=>'fr']);
        //Log::channel('mail')->info('hello');
    }
}
