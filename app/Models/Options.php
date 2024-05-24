<?php

namespace App\Models;

use Akaunting\Money\Currency;
use Akaunting\Money\Money;
use App\Models\TranslateAwareModel;
use App\Traits\HasTranslations;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Options extends TranslateAwareModel
{
    use SoftDeletes;
    use HasTranslations;
    protected $table = 'options';
    protected $fillable = ['name', 'options', 'item_id'];
    public $translatable = ['name','options'];

    public function item()
    {
        return $this->belongsTo(\App\Items::class);
    }

    public function simple_replace_spec_char($subject) {
        $char_map = array(
        );
        return $subject;
        //return strtr($subject, $char_map);
    }

}
