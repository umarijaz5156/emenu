<div class="text-center payment_form_submiter" id="flutterwave-payment-form" style="display: {{ config('settings.default_payment')=="flutterwave"?"block":"none"}};" >
    <button
        v-if="totalPrice"
        type="submit"
        class="btn btn-success mt-4 paymentbutton"
        onclick="this.disabled=true;this.form.submit();"
    >{{ __('Pay with FlutterWave') }}</button>
</div>


