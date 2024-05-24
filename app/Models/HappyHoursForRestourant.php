<?php

namespace App\Models;

use App\Items;
use App\Restorant;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HappyHoursForRestourant extends Model
{
    use HasFactory;

    protected $table = "period_discounts_for_restourants";
    protected $fillable = [];
    protected $guarded = [];

    public function restourant()
    {
        return $this->hasOne(Restorant::class, 'id', 'restourant_id');
    }
}
