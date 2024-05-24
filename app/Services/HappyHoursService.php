<?php
namespace App\Services;
class HappyHoursService
{
    public function getDay($num){
        $dowMap = array('sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday');
        $dow_numeric = date('w');
        return $dowMap[$num];
    }

}
