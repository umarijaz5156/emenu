<?php
if (! function_exists('trans')) {
    /**
     * Translate the given message.
     *
     * @param  string|null  $key
     * @param  array  $replace
     * @param  string|null  $locale
     * @return \Illuminate\Contracts\Translation\Translator|string|array|null
     */
    function trans($key = null, $replace = [], $locale = null)
    {

        if (is_null($key)) {
            return app('translator');
        }

        $vendor_entity_name=env('VENDOR_ENTITY_NAME','Restaurant');
        $vendor_entity_name_plural=env('VENDOR_ENTITY_NAME_PLURAL','Restaurants');

        $message=app('translator')->get($key, $replace, $locale);
        if (strpos($key, 'estaurant') !== false&&$vendor_entity_name!="Restaurant"&&$vendor_entity_name_plural!="Restaurants" /* Also check in the value to change to is not restaurant  */) {
            $translatedEntity_plural=__($vendor_entity_name_plural);
            $translatedEntity=__($vendor_entity_name);

            //ES
            $message=str_replace("Restaurantes",  $translatedEntity_plural, $message);
            $message=str_replace("Restaurante", $translatedEntity, $message);
            $message=str_replace("restaurantes", strtolower($translatedEntity_plural), $message);
            $message=str_replace("restaurante",  strtolower($translatedEntity), $message);

            //ES
            $message=str_replace("Restaurants",  $translatedEntity_plural, $message);
            $message=str_replace("Restaurant", $translatedEntity, $message);
            $message=str_replace("restaurants", strtolower($translatedEntity_plural), $message);
            $message=str_replace("restaurant",  strtolower($translatedEntity), $message);


        }
        return $message;
    }

}

if (! function_exists('formatCurrencyInString')) {
    /**
     * Format currencies in string
     *
     * @param  string|null  $key
     * @param  array  $replace
     * @param  string|null  $locale
     * @return \Illuminate\Contracts\Translation\Translator|string|array|null
     */
    function formatCurrencyInString($cartItemName, $restID)
    {
        $restourant = \App\Restorant::find($restID);
        if ($restourant){
            $currency = $restourant->currency;
            $re = '/(\+\d+\.*\d*)(\D\D\D)/m';
            $subst = "$1 {$currency}";
            $cartItemName = preg_replace($re, $subst, $cartItemName);
        }
        return $cartItemName;
    }

}

?>
