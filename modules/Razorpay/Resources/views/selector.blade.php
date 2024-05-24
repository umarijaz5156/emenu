@if (
    (config('razorpay.useAdmin')&&config('razorpay.secret')!=""&&config('razorpay.enabled')) ||
    (config('razorpay.useVendor')&&strlen($restorant->getConfig('razorpay_secret',""))>3&&$restorant->getConfig('razorpay_enable','false')!='false')
)
    <div class="custom-control custom-radio mb-3">
        <input name="paymentType" class="custom-control-input" id="paymentRazorpay" type="radio" value="razorpay" {{ config('settings.default_payment')=="razorpay"?"checked":""}}>
        <label class="custom-control-label" for="paymentRazorpay">{{ __('Pay with Razorpay') }}</label>
    </div>
@endif