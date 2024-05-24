@extends('layouts.app', ['title' => ''])
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="card shadow border-0 mt-8">
            <div class="card-body text-center">
                
                <h1 class="mb-4">
                    <span class="badge badge-primary">{{ __('Order')." #".$order }}</span>
                </h1>
               
                
                <div class="d-flex justify-content-center">
                    <div class="col-8">
                       
                        <div class="font-weight-300 mb-5">
                            {{ __("Thanks for your purchase") }}, 
                       </div>
                       <div class="font-weight-300 mb-5">
                        {{ __("Let's finisht the payment now. We will need to following details") }}, 
                   </div>

                   <!-- Notifications -->
                <div class="col-12">
                    @if (session('status'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {{ session('status') }}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    @endif

                    <!-- Errors display -->
                    @if (session('error'))
                    <div role="alert" class="alert alert-danger">{{ session('error') }}</div>
                    @endif

                </div>
                
                        
                        <!-- Create post form that has Name, Surname, Email, IdentityNumber, Address, City, State, Zip, Country -->
                        <form method="POST" action="{{ route('iyzico.pay',['order'=>$order]) }}">
                            @csrf
                            <div class="form-group">
                                <label for="name">{{ __("Name:") }}</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="{{ __("Enter your name") }}">
                              </div>
                              <div class="form-group">
                                <label for="surname">{{ __("Surname:") }}</label>
                                <input type="text" class="form-control" id="surname" name="surname" placeholder="{{ __("Enter your surname") }}">
                              </div>
                              <div class="form-group">
                                <label for="email">{{ __("Email:") }}</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="{{ __("Enter your email") }}">
                              </div>
                              <div class="form-group">
                                <label for="idnumber">{{ __("Identity Number:") }}</label>
                                <input type="text" class="form-control" id="idnumber" name="idnumber" placeholder="{{ __("Enter your identity number") }}">
                              </div>
                             
                              <div class="form-group">
                                <label for="address">{{ __("Address:") }}</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="{{ __("Enter your address") }}">
                              </div>
                              
                              <div class="form-row">
                                <div class="form-group col-md-8">
                                  <label for="city">{{ __("City:") }}</label>
                                  <input type="text" class="form-control" id="city" name="city">
                                </div>
                                
                                
                                <div class="form-group col-md-4">
                                  <label for="zipcode">{{ __("Zip:") }}</label>
                                  <input type="text" class="form-control" id="zipcode" name="zipcode">
                                </div>
                              </div>
                              <div class="form-group">
                                <label for="country">{{ __("Country:") }}</label>
                                <input type="text" class="form-control" id="country" value="Türkiye" name="country" placeholder="{{ __("Enter your country") }}">
                              </div>
                            
                              <button type="submit" class="btn btn-primary">{{ __("Submit") }}</button>
                          </form>
                          


                       
                        
                    </div>
                </div>
                <br />
                
            </div>
        </div>
    </div>
</div>
@endsection