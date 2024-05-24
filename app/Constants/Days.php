<?php

namespace App\Constants;

class Days
{
    public const MONDAY     = 0;
    public const TUESDAY    = 1;
    public const WEDNESDAY  = 2;
    public const THURSDAY   = 3;
    public const FRIDAY     = 4;
    public const SATURDAY   = 5;
    public const SUNDAY      = 6;

    public static function asArray(){
        return  [
            'monday',
            'tuesday',
            'wednesday',
            'thursday',
            'friday',
            'saturday',
            'sunday'
        ];
    }
}
