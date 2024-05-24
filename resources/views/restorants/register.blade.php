@extends('layouts.front', ['title' => __('User Profile')])
@if (strlen(config('settings.recaptcha_site_key')) > 2)
    @section('head')
        {!! htmlScriptTagJsApi([]) !!}
    @endsection
@endif

@section('content')
    @include('users.partials.header', [
        'title' => '',
        'headerImage' => config('global.restorant_details_cover_image'),
    ])


    <div class="container-fluid mt--7">
        <div class="row">

        </div>
        <div class="col-xl-8 offset-xl-2">
            <div class="card bg-secondary shadow">
                <div class="card-header bg-white border-0">
                    <div class="row align-items-center">
                        <h3 class="col-12 mb-0">{{ __('Register your restaurant') }}</h3>
                    </div>
                </div>

                @if ($errors->any())
                    @foreach ($errors->all() as $error)
                        <div class="alert alert-danger">
                            {{ $error }}
                        </div>
                    @endforeach
                @endif


                <div class="card-body">
                    <form id="{{ getFormId() }}" method="post" action="{{ route('newrestaurant.store') }}"
                        autocomplete="off">
                        @csrf

                        <h6 class="heading-small text-muted mb-4">{{ __('Restaurant information') }}</h6>

                        @if (session()->has('stripe'))
                            <div class="alert alert-danger">
                                <ul>
                                    <li>{{ session()->get('stripe') }}</li>
                                </ul>
                            </div>
                        @endif
                        @if (session('status'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('status') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        <div class="pl-lg-4">
                            <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                                <label class="form-control-label" for="name">{{ __('Restaurant Name') }}</label>
                                <input type="text" name="name" id="name"
                                    class="form-control form-control-alternative{{ $errors->has('name') ? ' is-invalid' : '' }}"
                                    placeholder="{{ __('Restaurant Name here') }} ..."
                                    value="{{ isset($_GET['name']) ? $_GET['name'] : '' }}" required autofocus>
                                @if ($errors->has('name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <hr class="my-4" />
                        <h6 class="heading-small text-muted mb-4">{{ __('Owner information') }}</h6>
                        <div class="pl-lg-4">
                            <div class="form-group{{ $errors->has('name_owner') ? ' has-danger' : '' }}">
                                <label class="form-control-label" for="name_owner">{{ __('Owner Name') }}</label>
                                <input type="text" name="name_owner" id="name_owner"
                                    class="form-control form-control-alternative{{ $errors->has('name_owner') ? ' is-invalid' : '' }}"
                                    placeholder="{{ __('Owner Name here') }} ..."
                                    value="{{ isset($_GET['name_owner']) ? $_GET['name_owner'] : '' }}" required autofocus>

                                @if ($errors->has('name_owner'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name_owner') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group{{ $errors->has('email_owner') ? ' has-danger' : '' }}">
                                <label class="form-control-label" for="email_owner">{{ __('Owner Email') }}</label>
                                <input type="email" name="email_owner" id="email_owner"
                                    class="form-control form-control-alternative{{ $errors->has('email_owner') ? ' is-invalid' : '' }}"
                                    placeholder="{{ __('Owner Email here') }} ..."
                                    value="{{ isset($_GET['email']) ? $_GET['email'] : '' }}" required autofocus>

                                @if ($errors->has('email_owner'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email_owner') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group{{ $errors->has('phone_owner') ? ' has-danger' : '' }}">
                                <label class="form-control-label" for="phone_owner">{{ __('Owner Phone') }}</label>
                                <input type="tel" name="phone_owner" id="phone_owner"
                                    class="form-control form-control-alternative{{ $errors->has('phone_owner') ? ' is-invalid' : '' }}"
                                    placeholder="{{ __('Owner Phone here') }} ..."
                                    value="{{ isset($_GET['phone']) ? $_GET['phone'] : '' }}" required autofocus>

                                @if ($errors->has('phone_owner'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('phone_owner') }}</strong>
                                    </span>
                                @endif
                            </div>

                            @if ($plan->exists)
                                <div class="form-group{{ $errors->has('phone_owner') ? ' has-danger' : '' }}">
                                    <label class="form-control-label" for="plan_name">{{ __('Plan') }}</label>
                                    <input type="text" disabled="true" name="plan_name" id="plan_name"
                                        class="form-control form-control-alternative{{ $errors->has('phone_owner') ? ' is-invalid' : '' }}"
                                        placeholder="{{ __('Owner Phone here') }}" value="{{ $plan->name }}" required
                                        autofocus>
                                    <input type="hidden" name="plan_id" id="plan_id" value="{{ $plan->id }}"
                                        required autofocus>
                                </div>


                                <div class="form-group">
                                    <label class="form-control-label" for="coupon_name">{{ __('Coupon') }}</label>
                                    <div class = "row">
                                        <div class="col-6">
                                            @if (isset($coupon))
                                                <input type="text" name="coupon_code"
                                                    @if (isset($recalculated) && $recalculated) disabled = "disabled" @endif
                                                    id="coupon_code" class="form-control form-control-alternative"
                                                    placeholder="{{ __('Coupon Code') }}" value="{{ $coupon->code }}"
                                                    autofocus>
                                                <input type="hidden" name="coupon_id"
                                                    class="form-control form-control-alternative"
                                                    value="{{ $coupon->id }}" autofocus>
                                            @else
                                                <input type="text" name="coupon_code" id="coupon_code"
                                                    class="form-control form-control-alternative"
                                                    placeholder="{{ __('Coupon Code') }}" value="" autofocus>
                                            @endif



                                        </div>
                                        <div class="col-6">
                                            @if (!isset($recalculated) || $recalculated != true)
                                                <a id = "planscoupounscreate"
                                                    class="btn btn-sm btn-primary text-white">Apply</a>
                                                <script>
                                                    document.addEventListener('DOMContentLoaded', () => {

                                                        $('#planscoupounscreate').on("click", function(evt) {
                                                            let add = $('input[name="coupon_code"]').val();
                                                            evt.preventDefault();
                                                            let url1 = '{{ route('plancoupons.recalculateplan', ['plan' => $plan]) }}';
                                                            var url = new URL(url1);
                                                            url.searchParams.append('phone', $('input[name="phone_owner"]').val());
                                                            url.searchParams.append('coupon_code', add);
                                                            url.searchParams.append('name', $('input[name="name"]').val());
                                                            url.searchParams.append('email', $('input[name="email_owner"]').val());
                                                            url.searchParams.append('name_owner', $('input[name="name_owner"]').val());
                                                            if (add) {
                                                                window.location = url;
                                                            }

                                                        });
                                                    });
                                                </script>
                                            @endif
                                        </div>
                                        <br />

                                    </div>
                                </div>
                            @endif

                            <div class="text-center">
                                @if (strlen(config('settings.recaptcha_site_key')) > 2)
                                    @if ($errors->has('g-recaptcha-response'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                                        </span>
                                    @endif

                                    {{-- check --}}

                                    {!! htmlFormButton(__('Checkout') . ' ' . round($plan->price, 2) . config('settings.cashier_currency'), [
                                        'id' => 'thesubmitbtn',
                                        'class' => 'btn btn-success mt-4',
                                    ]) !!}
                                @else
                                    <div class="btn-group" role="group">
                                        <button type="submit" id="thesubmitbtn" class="g-recaptcha btn btn-success mt-4"
                                            data-sitekey="{{ config('services.recaptcha.site_key') }}"
                                            data-callback='onSubmit' data-action='register'>
                                            {{ __('Checkout') }} {{ round($plan->price, 2) }}
                                            {{ config('settings.cashier_currency') }}
                                        </button>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br />
    </div>

@endsection

@section('js')
    @if (isset($_GET['name']) && $errors->isEmpty())
        <script>
            "use strict";
            //document.getElementById("thesubmitbtn").click();
        </script>
    @endif
    <script src="https://www.google.com/recaptcha/api.js"></script>

    <script>
        function onSubmit(token) {
            document.getElementById("{{ getFormId() }}").submit();
        }
    </script>
@endsection
