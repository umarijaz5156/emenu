@if (
    (config('paystack.useAdmin')&&config('paystack.secretKey')!=""&&config('paystack.enabled')) ||
    (config('paystack.useVendor')&&strlen($restorant->getConfig('paystack_secretKey',""))>3&&$restorant->getConfig('paystack_enable','false')!='false')
)
    <div class="custom-control custom-radio mb-3">
        <input name="paymentType" class="custom-control-input" id="paymentPaystack" type="radio" value="paystack" {{ config('settings.default_payment')=="paystack"?"checked":""}}>
        <label class="custom-control-label" for="paymentPaystack">{{ __('Pay with Paystack') }}</label>
    </div>
@endif