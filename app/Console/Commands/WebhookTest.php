<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Laravel\Cashier\Events\WebhookReceived;
//command for webhook testing you can get payload from stripe dashboard
class WebhookTest extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'test:webhook';

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
        $raw = file_get_contents(base_path().'/tests/mock/invoice.payment_succeeded.json');
        $this->payload = json_decode($raw,true);
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {

        WebhookReceived::dispatch($this->payload);
        return 0;
    }
}
