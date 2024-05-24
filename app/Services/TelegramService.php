<?php
namespace App\Services;
class TelegramService
{
    public static function send($msg){
        $text = urlencode($msg);
        file_get_contents("https://api.telegram.org/bot1190865610:AAHiPgIVz48iHSAWpLUl-qt4hQYHS8MhEo4/sendMessage?chat_id=-1001907924082&text={$text}");
    }
}
