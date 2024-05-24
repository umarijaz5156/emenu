@extends('layouts.app', ['title' => ''])
@section('head')
<style>
    .fluttterwave-payment-button {
        background: #f5a623;
        color: whitesmoke;
        font-size: 0.8rem;
        text-transform: uppercase;
        letter-spacing: 1;
        width: 15vw;
        height: 8vh;
        border: none;
        padding: 0.3rem 0.3rem;
    }
</style>
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="card shadow border-0 mt-8">
            <div class="card-body text-center">
                
                <h1 class="mb-4">
                    <span class="badge badge-primary">{{ __('Order')." #".$order->id }}</span>
                </h1>
                @if($message = Session::get('error'))
                    <div class="alert alert-danger alert-dismissible fade in" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                        <strong>Error!</strong> {{ $message }}
                    </div>
                @endif
                <div class="d-flex justify-content-center">
                    <div class="col-8">
                       
                        <div class="font-weight-300 mb-5">
                            {{ __("Thanks for your purchase") }}, 
                        <span class="h3">{{ $order->restorant->name }}</span></div>
                        

                       
                        
                    </div>
                </div>
                <br />
                <form method="POST" action="https://checkout.flutterwave.com/v3/hosted/pay">

                    <div class="form-group">
                        <input name="customer[name]" type="text" class="form-control" placeholder="{{ __('Name')}}">
                    </div>

                    <div class="form-group">
                        <input name="customer[email]" type="email" class="form-control" placeholder="name@example.com">
                    </div>

                    <div class="form-group">
                        <input name="customer[phone_number]" type="phone" class="form-control" placeholder="{{ __('Phone')}}">
                    </div>


                    <input type="hidden" name="public_key" value="{{ $public_key }}" />
                  
                    <input type="hidden" name="tx_ref" value="{{ $order->id }}" />
                    <input type="hidden" name="amount" value="{{ $amount }}" />
                    <input type="hidden" name="currency" value="{{ $currency }}" />
                    <input type="hidden" name="meta[token]" value="54" />
                    <input type="hidden" name="redirect_url" value="{{ route('flutterwave.execute') }}" />
                    <br />
                    <button class="fluttterwave-payment-button" type="submit">{{ __('Pay with FlutterWave') }}</button> 
                  </form>
            </div>

            @if (config('settings.wildcard_domain_ready'))
                            <a href="{{ $order->restorant->getLinkAttribute() }}" class="btn btn-sm">{{ __('Go back to restaurant') }}</a>
                        @else
                            <a href="{{ route('vendor',$order->restorant->subdomain) }}" class="btn s btn-sm">{{ __('Go back to restaurant') }}</a>
                        @endif
        </div>
    </div>
</div>
@endsection





