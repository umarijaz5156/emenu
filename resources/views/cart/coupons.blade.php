<div class="p-4 bg-secondary">
    <div class="row">
        <div class="col-md-7">
            <input id="coupon_code" name="coupon_code" type="text" class="form-control form-control-alternative"
                placeholder="{{ __('Discount coupon') }}">
        </div>
        <div class="col-md-5">

            <button id="promo_code_btn_now_hb" type="button"
                class="btn btn-outline-primary">{{ __('Apply') }}</button>
            <span><i id="promo_code_succ" class="ni ni-check-bold text-success"></i></span>
            <span><i id="promo_code_war" class="ni ni-fat-remove text-danger"></i></span>
        </div>
        <span id="coupon_code_msg" style="margin-left: 15px; margin-top: 5px;"></span>
    </div>
</div>
<br />
