<?php

namespace App\Console\Commands;

use App\Models\Options;
use Illuminate\Console\Command;

class RepackAllOptions extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:repack-options';

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
        $opts = Options::withTrashed()->get();
        foreach ($opts as $opt){
            //old schema
            $raw = $opt->options;
            if ($raw){
                $arr = explode(",", $opt->options);
            }else{
                $arr = explode(",", $opt->getRawOriginal('options'));
            }

            $opt2 = [];
            $currency = currency(config('settings.cashier_currency'))->getCurrency();
            $ffs = currency('EUR')->getCurrency();
            $sign = '+';
            foreach ($arr as $value) {
                $a = preg_match('/(.*)(\+)[^\d]*(\d+\.*\d*)[^\d]*(\D)/m', $value, $match);
                $price = 0;
                $desc = $value;
                $val = false;
                try{
                    $temp_currency = currency($match[4]);
                    $val = true;
                }catch (\Exception $e){
                    $val = false;
                }

                $temp_currency = (isset($match[4]) && $val)?$match[4]:$currency;

                if ($a && isset($match[3])) {
                    $price    = $match[3];
                    $desc     = isset($match[1])?$match[1]:'';
                    $currency = $temp_currency;
                    $sign     = isset($match[2])?$match[2]:$sign;
                }
                $opt2[] = [
                    'price'    => $price,
                    'desc'     => $desc,
                    'currency' => $currency,
                    'sign'     => $sign
                ];

            }

            $cursign = currency(config('settings.cashier_currency'));

            // dd($options);
            $str = [];
            foreach ($opt2 as $value){
                if (isset($value['price']) && $value['price']){
                    $str[] = "{$value['desc']}{$value['sign']}{$value['price']}{$value['currency']}";
                }else{
                    $str[] = "{$value['desc']}";
                }
            }
            // dd($str);

            $str = implode(',',$str);
            $pack = str_replace(', ', ',', $opt->simple_replace_spec_char($str));
            echo $pack . "\n";
            $l = app()->getLocale();
            $opt->setTranslation('options', $l ,$pack)->save();
        }
    }
}
