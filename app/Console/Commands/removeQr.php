<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Storage;

class removeQr extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'remove:qr-from-storage';

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
        $files = Storage::allfiles('public/qrs');
        $dates = ['.gitignore'];

        foreach ($files as $key => $value) {
            if (!in_array(basename($value), $dates)) {
                Storage::delete($value);
            }
        }
    }
}
