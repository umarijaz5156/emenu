<?php

namespace App\Models;

use App\Items;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HappyHours extends Model
{
    use HasFactory;
    protected $table="period_discounts";
    protected $fillable = [];
    protected $guarded=[];

    public function item()
    {
        return $this->hasOne(Items::class, 'id', 'item_id');
    }
}
