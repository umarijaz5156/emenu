<?php

namespace Database\Seeders;

use App\Constants\Days;
use App\Items;
use App\Models\HappyHours;
use App\Models\HappyHoursForRestourant;
use App\Restorant;
use Illuminate\Database\Seeder;

class HappyHoursSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $itemTypes = array(
            "percent"=>"%"
        );
        $items = Items::all();

        foreach ($items as $item){
            foreach(Days::asArray() as $key=>$value){
                $faker = \Faker\Factory::create();
                $randtime_start = $faker->dateTimeBetween('-10 hours','-8 hours' );
                $randtime_end   = $faker->dateTimeBetween('-7 hours','-5 hours' );

                //$to =
                $period_discount = HappyHours::create(['item_id'=>$item->id,
                    'start'=>$randtime_start->format('H:i'),
                    'end'=>$randtime_end->format('H:i'),
                    'discount_type'=>'value',
                    'amount'=>$faker->numberBetween(1,10),
                    'day'=>$value]);
                $period_discount->save();
            }

        }

        $restourants = Restorant::all();

        foreach ($restourants as $restourant){
            foreach(Days::asArray() as $key=>$value){
                $faker = \Faker\Factory::create();
                $randtime_start = $faker->dateTimeBetween('-10 hours','-8 hours' );
                $randtime_end   = $faker->dateTimeBetween('-7 hours','-5 hours' );

                //$to =
                $period_discount = HappyHoursForRestourant::create(['restourant_id'=>$restourant->id,
                    'start'=>$randtime_start->format('H:i'),
                    'end'=>$randtime_end->format('H:i'),
                    'discount_type'=>'percent',
                    'amount'=>$faker->numberBetween(1,10),
                    'day'=>$value]);
                $period_discount->save();
            }
        }
    }
}
