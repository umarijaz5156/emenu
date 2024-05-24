{{-- @if (in_array('monday', \App\Constants\Days::asArray()))
	{{ dd('monday') }}
@endif --}}
@foreach(\App\Constants\Days::asArray() as $num=>$day)
		@php
			$dynamicPrice = \App\Models\DynamicPrice::where('item_id', $itemID)->where('day', $day)->first();
		@endphp
		@if (!is_null($dynamicPrice))
			<div>
		     	<h3>{{ __(ucfirst($day)) }}</h3>
		     	<div class="row row-grid align-items-center mt-0">
					<div class="col-lg-3">
						<div class="input-group">
				            <div class="input-group-prepend">
				                <span class="input-group-text" style="padding: 5px;"><i class="ni ni-time-alarm"></i></span>
				            </div>
				            <input disabled=true id="" name="" value="{{ $dynamicPrice->start }}" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
				        </div>
					</div>
					<div class="col-lg-3">
						<div class="input-group">
				            <div class="input-group-prepend">
				                <span class="input-group-text" style="padding: 5px;"><i class="ni ni-time-alarm"></i></span>
				            </div>
				            <input disabled=true id="" name="" value="{{ $dynamicPrice->end }}" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
				        </div>
					</div>
					<div class="col-lg-3">
						<div class="input-group">
				            <input disabled=true style="border:1px solid gray" type="number" id="" name="" value="{{ $dynamicPrice->percentage }}" class="flatpickr datetimepicker form-control" type="text">
				        </div>
					</div>
					<div class="col-lg-3">
						<button type="button" class="btn btn-sm btn-primary dynamic-price-model" data-toggle="modal" data-dynamicPrice='{{ $dynamicPrice->id }}' data-itemID='{{ $itemID }}' data-day='{{ $day }}' data-target="#dynamic-price-model">{{ __('Edit') }}</button>
					</div>
				</div>
			</div>
			<br>
		@else
			<div>
		     	<h3>{{ __(ucfirst($day)) }}</h3>
		     	<div class="row row-grid align-items-center mt-0">
					<div class="col-lg-3">
						<div class="input-group">
				            <div class="input-group-prepend">
				                <span class="input-group-text" style="padding: 5px;"><i class="ni ni-time-alarm"></i></span>
				            </div>
				            <input disabled=true id="" name="" value="" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
				        </div>
					</div>
					<div class="col-lg-3">
						<div class="input-group">
				            <div class="input-group-prepend">
				                <span class="input-group-text" style="padding: 5px;"><i class="ni ni-time-alarm"></i></span>
				            </div>
				            <input disabled=true id="" name="" value="" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
				        </div>
					</div>
					<div class="col-lg-3">
						<div class="input-group">
				            <input disabled=true style="border:1px solid gray" type="number" id="" name="" value="0.00" class="flatpickr datetimepicker form-control" type="text">
				        </div>
					</div>
					<div class="col-lg-3">
						<button type="button" class="btn btn-sm btn-success dynamic-price-model" data-toggle="modal" data-dynamicPrice='' data-day='{{ $day }}' data-itemID='{{ $itemID }}' data-target="#dynamic-price-model">{{ __('Add') }}</button>
					</div>
				</div>
			</div>
			<br>
		@endif
@endforeach