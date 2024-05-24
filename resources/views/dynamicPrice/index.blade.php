@extends('layouts.app', ['title' => __('Item Dynamic Price')])
@section('admin_title')
    {{__('Dynamic Price')}}
@endsection
@section('content')

    <div class="header bg-gradient-primary pb-7 pt-5 pt-md-8">
        <div class="container-fluid">
            <div class="header-body">
            	<div class="row align-items-center py-4">
            	</div>
            </div>
        </div>
    </div>
    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col">
                                        <h3 class="mb-0">{{ __('Item Dynamic Price') }}
                                        @php
                                            $restorant = App\Restorant::findOrFail($restorant_id);
                                        @endphp
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                    	<div class="row">
		                    <div class="col-lg-7" style="max-height: 770px; overflow-y: auto;">
		                   		@foreach ($categories as $index => $category)
			                        @if($category->active == 1)
				                        <div class="alert alert-default">
				                            <div class="row">
				                                <div class="col">
				                                    <span class="h1 font-weight-bold mb-0 text-white">{{ $category->name }}</span>
				                                </div>
				                                <div class="col-auto">
				                                    <div class="row">
				                                        <script>
				                                            function setSelectedCategoryId(id){
				                                                $('#category_id').val(id);
				                                            }

				                                            function setRestaurantId(id){
				                                                $('#res_id').val(id);
				                                            }
				                                        </script>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
			                        @endif
			                        @if($category->active == 1)
				                        <div class="row">
				                            <div class="col-lg-12">
				                                <div class="row row-grid">
				                                    @foreach ( $category->items as $item)
				                                        <div class="col-lg-6">
				                                            <div class="card">
				                                            	<input type="radio" id="{{ $item->name }}" name='item' class="item-radio" value="{{ $item->id }}">
				                                            	<label for="{{ $item->name }}">
					                                                {{-- <img class="card-img-top" src="{{ $item->logom }}" alt="..."> --}}
				                                                    <div class="card-body">
				                                                        <h3 class="card-title text-primary text-uppercase">{{ $item->name }}</h3>
				                                                        <p class="card-text description mt-3">{{ $item->description }}</p>

				                                                        <span class="badge badge-primary badge-pill">@money($item->price, config('settings.cashier_currency'),config('settings.do_convertion'))</span>
				                                                        @if($item->happyHours->where('day',strtolower(date('l')))->count())
				                                                            <span class="badge badge-warning">Happy Hours Price</span>
				                                                        @elseif($restorant->happyHoursNow()->count())
				                                                            <span class="badge badge-warning">Happy Hours Price</span>
				                                                        @endif
				                                                        <p class="mt-3 mb-0 text-sm">
				                                                            @if($item->available == 1)
				                                                            <span class="text-success mr-2">{{ __("AVAILABLE") }}</span>
				                                                            @else
				                                                            <span class="text-danger mr-2">{{ __("UNAVAILABLE") }}</span>
				                                                            @endif
				                                                        </p>
				                                                    </div>
				                                            	</label>
				                                            </div>
				                                            <br/>
				                                        </div>
				                                    @endforeach
				                                </div>
				                            </div>
				                        </div>
			                        @endif
		                        @endforeach	
		                    </div>
		                    <div class="col-lg-5">
		                    	<div class="card card-profile shadow">
								    <div class="card-header">
								        <div class="row align-items-center">
								            <div class="col-8">
								                <h5 class="h3 mb-0">{{ __('Dynamic Price') }}</h5>
								            </div>
								        </div>
								    </div>
								    <div class="card-body">
								    	<div id="dynamic-price-list">
								    		<h3 style="color:gray;">Select Item</h3>
								    	</div>
								    </div>
								</div>
		                    </div>
		                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('dynamicPrice.inc.model')
@endsection


@section('js')
        <script>

        	$.ajaxSetup({
		        headers: {
		            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		        }
		    });

            $('body').on('change', '.percentage', function(){
                var val = $(this).val();

                if(val < 0 || val > 100){
                    $(this).addClass('is-invalid').removeClass('is-valid').focus();
                } else {
                    $(this).addClass('is-valid').removeClass('is-invalid').focus();
                }
            });
            $('body').on('click', '.dynamic-price-model', function(){

                var day = $(this).attr('data-day');
                var priceID = $(this).attr('data-dynamicPrice');
                var itemID = $(this).attr('data-itemID');
                var url = '{{ route('dynamic-price.getForm') }}';
                $.ajax({
	                url: url,
	                method: 'POST',
	                data: { priceID:priceID, itemID:itemID, day:day },
	                success: function(response){
	                	$('#dynamic-price-form-html').html(response.html);
	                }
	            });
            });
            $('.item-radio').on('change', function(){
                var itemID = $(this).val();
                $('.item_id_model').val(itemID);
                var url = '{{ route('dynamic-price.getPrice') }}';

                $.ajax({
	                url: url,
	                method: 'POST',
	                data: { itemID:itemID },
	                success: function(response){
	                    $('#dynamic-price-list').html(response.html);
	                }
	            });
            });
            
            $('body').on('click', '.dynamic-price-save', function(){
                var item_id = $(".item_id_model").val();
                var day = $("input[name=day]").val();
                var start = $("input[name=start]").val();
                var end = $("input[name=end]").val();
                var percentage_type = $("input[name=percentage_type]").val();
                var percentage = $("input[name=percentage]").val()

                if(item_id != '' && day != '' && start != '' && end != '' && percentage_type != '' && percentage != ''){
                    $('#dynamic-price-form').submit();
                }
                if (item_id == '') {
                    $('.item_id_err').text('item_id is required');
                }else{
                    $('.item_id_err').text('');
                }
                if (day == '') {
                    $('.day_err').text('day is required');
                }else{
                    $('.day_err').text('');
                }
                if (start == '') {
                    $('.start_err').text('start is required');
                }else{
                    $('.start_err').text('');
                }
                if (end == '') {
                    $('.end_err').text('end is required');
                }else{
                    $('.end_err').text('');
                }
                if (percentage_type == '') {
                    $('.percentage_type_err').text('percentage_type is required');
                }else{
                    $('.percentage_type_err').text('');
                }
                if (percentage == '') {
                    $('.percentage_err').text('percentage is required');
                }else{
                    $('.percentage_err').text('');
                }
            });
        </script>

    @endsection