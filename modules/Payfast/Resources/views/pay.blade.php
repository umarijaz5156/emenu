@extends('layouts.app', ['title' => ''])
@section('head')
<script src="https://www.payfast.co.za/onsite/engine.js"></script>  
@endsection
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
                        @if (config('settings.wildcard_domain_ready'))
                            <a href="{{ $order->restorant->getLinkAttribute() }}" class="btn btn-sm">{{ __('Go back to restaurant') }}</a>
                        @else
                            <a href="{{ route('vendor',$order->restorant->subdomain) }}" class="btn s btn-sm">{{ __('Go back to restaurant') }}</a>
                        @endif
                        <br /><br />

                        
                        <script type="text/javascript">window.payfast_do_onsite_payment({"uuid":"{{ $identifier }}"});</script>
                        

                        
                        
                    </div>
                </div>
                <br />
                
            </div>
        </div>
    </div>
</div>
@endsection











