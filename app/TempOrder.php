<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TempOrder extends Model
{
    use HasFactory;

    protected $table = 'temp_orders';
    protected $fillable = ['body', 'ordermd', 'restorant_id'];

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function restorant()
    {
        return $this->hasOne(\App\Restorant::class, 'id', 'restorant_id');
    }

    /**
     * Get the user's first name.
     *
     * @param  string  $value
     * @return string
     */
    public function getBodyAttribute($value)
    {
        return json_decode($value, true);
    }

    /**
     * Get the user's first name.
     *
     * @param  string  $value
     * @return string
     */
    public function setBodyAttribute($value)
    {
        $this->attributes['body'] = json_encode($value);
    }

    /**
     * Get the user's first name.
     *
     * @param  string  $value
     * @return string
     */
    public function setOrdermdAttribute($value)
    {
        $this->attributes['ordermd'] = md5($value);
    }
}
