<div class="card card-profile shadow mt--300">
    <div class="px-4">
        <div class="mt-5">
            <h3>{{ __('Checkout') }}<span class="font-weight-light"></span></h3>
        </div>
        <div class="border-top">
            <!-- Price overview -->
            <div id="totalPrices" v-cloak>
                <div class="card card-stats mb-4 mb-xl-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                @if ($errors->has('error'))
                                    <div class="alert alert-danger">
                                        {{ $errors->first('error') }}
                                    </div>
                                @endif

                                <span v-if="itemsCount==0">{{ __('Cart is empty') }}!</span>
                                @if ($restorant->show_price == 0)
                                @else
                                    <span v-if="itemsCount"><strong>{{ __('Subtotal') }}:</strong></span>
                                    <span v-if="itemsCount" class="ammount"><strong
                                            id="subtotalhb">@{{ totalPriceFormat }}</strong></span>
                                @endif
                                @if (config('app.isft') ||
                                        config('settings.is_whatsapp_ordering_mode') ||
                                        in_array('poscloud', config('global.modules', [])) ||
                                        in_array('deliveryqr', config('global.modules', [])))
                                    <span
                                        v-if="itemsCount&&deliveryPrice>0"><br /><strong>{{ __('Delivery') }}:</strong></span>
                                    <span v-if="itemsCount&&deliveryPrice>0"
                                        class="ammount"><strong>@{{ deliveryPriceFormated }}</strong></span><br />
                                @endif
                                <br />
                                <div v-if="deduct">
                                    <span v-if="deduct">{{ __('Applied coupon discount') }}:</span>
                                    <span v-if="deduct" class="ammount">@{{ deductFormat }}</span>
                                    <br />
                                </div>

                                <div v-if="tip">
                                    <span v-if="tip">{{ __('Applied tip') }}:</span>
                                    <span v-if="tip" class="ammount">@{{ tipFormat }}</span>
                                    <br />
                                </div>
                                @if ($restorant->show_price == 0)
                                @else
                                    <span v-if="itemsCount"><strong>{{ __('TOTAL') }}:</strong></span>
                                    <span v-if="itemsCount"
                                        class="ammount"><strong>@{{ withDeliveryFormat }}</strong></span>
                                    <div><span class="ammount" id="discounted_price"></span></div>
                                @endif
                                {{-- <input v-if="itemsCount" type="hidden" id="tootalPricewithDeliveryRaw"
                                    :value="withDelivery" /> --}}
                                <input type="hidden" id="tootalPricewithDeliveryRaw" value="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End price overview -->


            @if (in_array('coupons', config('global.modules', [])))
                <!-- Coupons -->
                @if ($restorant->getConfig('couons_enable') == "true")
                    @include('cart.coupons')
                @endif
                
                <!-- End coupons -->
            @endif

            @if (in_array('tips', config('global.modules', [])))
                <!-- Tip -->
                @include('cart.tips')
                <!-- End tip -->
            @endif

            <!-- Payment  Methods -->
            <div class="cards">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <!-- Errors on Stripe -->
                            @if (session('error'))
                                <div role="alert" class="alert alert-danger">{{ session('error') }}</div>
                            @endif

                            @if (!config('settings.is_whatsapp_ordering_mode'))
                                <!-- COD -->
                                @if (!config('settings.hide_cod'))
                                    <div class="custom-control custom-radio mb-3">
                                        <input name="paymentType" class="custom-control-input" id="cashOnDelivery"
                                            type="radio" value="cod">
                                        <label class="custom-control-label" for="cashOnDelivery"><span
                                                class="delTime">{{ config('app.isqrsaas') ? __('Cash / Card Terminal') : __('Cash on delivery') }}</span>
                                            <span class="picTime">{{ __('Cash on pickup') }}</span></label>
                                    </div>
                                @endif

                                @if ($enablePayments)

                                    <!-- STIPE CART -->
                                    @if (config('settings.stripe_key') && config('settings.enable_stripe'))
                                        <div class="custom-control custom-radio mb-3 d-none">
                                            <input name="paymentType" class="custom-control-input" id="paymentStripe"
                                                type="radio" value="stripe"
                                                {{ config('settings.default_payment') == 'stripe' ? 'checked' : '' }}>
                                            <label class="custom-control-label"
                                                for="paymentStripe">{{ __('Pay with card') }}</label>
                                        </div>
                                    @endif

                                    <!-- Extra Payments ( Via module ) -->
                                    @foreach ($extraPayments as $extraPayment)
                                        @include($extraPayment . '::selector')
                                    @endforeach


                                @endif

                            @endif
                        </div>
                    </div>
                </div>
            </div>

            <!-- END Payment -->

            <div class="text-center">
                <div class="custom-control custom-checkbox mb-3">
                    <input class="custom-control-input" id="privacypolicy" type="checkbox">
                    <!--<label class="custom-control-label" for="privacypolicy">{{ __('I agree to the Terms and Conditions and Privacy Policy') }}</label>-->
                    <label class="custom-control-label" for="privacypolicy">
                        &nbsp;&nbsp;{{ __('I agree to the') }}
                        <a href="{{ config('settings.link_to_ts') }}" target="_blank"
                            style="text-decoration: underline;">{{ __('Terms of Service') }}</a> {{ __('and') }}
                        <a href="{{ config('settings.link_to_pr') }}" target="_blank"
                            style="text-decoration: underline;">{{ __('Privacy Policy') }}</a>.
                    </label>
                </div>
            </div><br />

            <!-- Payment Actions -->
            @if (!config('settings.social_mode') || config('settings.do_regular_checkout_social', false))

                <!-- COD -->
                @include('cart.payments.cod')

                <!-- Extra Payments ( Via module ) -->
                @foreach ($extraPayments as $extraPayment)
                    {{-- {{ $extraPayment }} <br> --}}
                    @include($extraPayment . '::button')
                @endforeach

                </form>

                <!-- Stripe -->
                @include('cart.payments.stripe')
            @elseif(config('settings.is_whatsapp_ordering_mode'))
                @include('cart.payments.whatsapp')
            @elseif(config('settings.is_facebook_ordering_mode'))
                @include('cart.payments.facebook')
            @endif
            <!-- END Payment Actions -->

            <br />


        </div>
        <br />
        <br />
    </div>
</div>

@if (config('settings.is_demo') && config('settings.enable_stripe'))
    @include('cart.democards')
@endif


<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
        $('#promo_code_btn_now_hb').click(function() {
            const discounted_price = $('#discounted_price');
            const totalPrice = $('#subtotalhb').text().substring(1)


            // make ajax request
            $.ajax({
                type: 'POST',
                url: "coupons/apply",
                data: {
                    _token: "{{ csrf_token() }}",
                    code: $('#coupon_code').val(),
                    cartValue: totalPrice
                },
                success: function(response) {
                    console.log(response);
                    discounted_price.html(
                        `<strong>Discounted price: ${totalPrice-response.deduct}</strong>`
                    )
                    if (response.status == false) {
                        $('#coupon_code_msg').text(response.msg).addClass('text-danger').removeClass('text-success');
                    }else{
                        $('#coupon_code_msg').text(response.msg).addClass('text-success').removeClass('text-danger');
                    }
                },
                error: function(error) {
                    console.log('asasa', error);
                    discounted_price.text(error.responseJSON.msg)
                }
            })
        });
    });
</script>
