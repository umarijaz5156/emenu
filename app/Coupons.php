<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Coupons extends Model
{
    protected $table = 'coupons';

    protected $guarded = [];

    public function vendor()
    {
        return $this->belongsTo(\App\Restorant::class,'restaurant_id');
    }

    public function calculateDeduct($currentCartValue){
        // return 3;
        if( Carbon::now()->between(new Carbon($this->active_from),new Carbon($this->active_to)) && $this->limit_to_num_uses >0 ){

            // return 'asas';

            if ($this->type == 0) {
                if($this->price > $currentCartValue){
                    return $currentCartValue;
                }else{
                    return $this->price;
                }
               
            }else if ($this->type == 1) {
                return round(($this->price / 100)*$currentCartValue,2);
            }else{
                if($this->price > $currentCartValue){
                    return $currentCartValue;
                }else{
                    return $this->price;
                }
            }
        }else{
            // return '-----------d-';
            return null;
        }
        
    }


    public function getTaxedCut($currentCartValue){
        // return 3;
        if( Carbon::now()->between(new Carbon($this->active_from),new Carbon($this->active_to)) && $this->limit_to_num_uses >0 ){

            // return 'asas';

            if ($this->type == 0) {
                if($this->price > $currentCartValue){
                    return $currentCartValue;
                }else{
                    return $this->price;
                }
               
            }else if ($this->type == 1) {
                return round($currentCartValue/(100-$this->price)*$this->price,2);
            }else{
                if($this->price > $currentCartValue){
                    return $currentCartValue;
                }else{
                    return $this->price;
                }
            }
        }else{
            // return '-----------d-';
            return null;
        }
        
    }

    
}
