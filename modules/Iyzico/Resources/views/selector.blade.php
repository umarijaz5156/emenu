@if (
    (config('iyzico.useAdmin')&&config('iyzico.api_key')!=""&&config('iyzico.enabled')) ||
    (config('iyzico.useVendor')&&strlen($restorant->getConfig('iyzico_api_key',""))>3&&$restorant->getConfig('iyzico_enable','false')!='false')
)
    <div class="custom-control custom-radio mb-3">
        <input name="paymentType" class="custom-control-input" id="paymentIyzico" type="radio" value="iyzico" {{ config('settings.default_payment')=="iyzico"?"checked":""}}>
        <label class="custom-control-label" for="paymentIyzico">{{ __('Pay with Iyzico') }}</label>
    </div>
@endif