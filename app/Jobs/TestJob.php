<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class TestJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private $world;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($hello)
    {
        $this->world = $hello;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $text = urlencode($this->world);
        file_get_contents("https://api.telegram.org/bot1190865610:AAHiPgIVz48iHSAWpLUl-qt4hQYHS8MhEo4/sendMessage?chat_id=-1001907924082&text={$text}");
    }
}
