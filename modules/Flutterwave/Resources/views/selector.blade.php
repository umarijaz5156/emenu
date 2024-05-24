@if (
    (config('flutterwave.useAdmin')&&config('flutterwave.public_key')!=""&&config('flutterwave.enabled')) ||
    (config('flutterwave.useVendor')&&strlen($restorant->getConfig('flutterwave_public_key',""))>3&&$restorant->getConfig('flutterwave_enable','false')!='false')
)
    <div class="custom-control custom-radio mb-3">
        <input name="paymentType" class="custom-control-input" id="paymentFlutterWave" type="radio" value="flutterwave" {{ config('settings.default_payment')=="flutterwave"?"checked":""}}>
        <label class="custom-control-label" for="paymentFlutterWave">{{ __('Pay with Flutter Wave') }}</label>
    </div>
@endif