<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DynamicPrice extends Model
{
    use HasFactory;

    protected $fillable = [
        'item_id',
        'start',
        'end',
        'percentage_type',
        'percentage',
        'day',
    ];

    public function item()
    {
        return $this->hasOne(Items::class, 'id', 'item_id');
    }
}
