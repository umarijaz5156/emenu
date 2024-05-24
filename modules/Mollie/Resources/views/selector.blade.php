@if (
    (config('mollie.useAdmin')&&config('mollie.mollie_payment_key')!=""&&config('mollie.enabled')) ||
    (config('mollie.useVendor')&&strlen($restorant->getConfig('mollie_payment_key',""))>3&&$restorant->getConfig('mollie_enable','false')!='false')
)
    <div class="custom-control custom-radio mb-3">
        <input name="paymentType" class="custom-control-input" id="paymentMollie" type="radio" value="mollie" {{ config('settings.default_payment')=="mollie"?"checked":""}}>
        <label class="custom-control-label" for="paymentMollie">{{ __('Pay with Mollie') }}</label>
    </div>
@endif