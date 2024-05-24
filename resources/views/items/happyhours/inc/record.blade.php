<br />
<div class="row" >
    <div class="col-3">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"><i class="ni ni-time-alarm"></i></span>
            </div>
            <input disabled="true" id="{{ 'start'.'_period_'.$perodDiscount->id }}" name="{{ 'period['.$key.']'.'[start]' }}" value="{{date("H:i",strtotime($perodDiscount->start))}}" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
        </div>
    </div>
    <div class="col-3">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"><i class="ni ni-time-alarm"></i></span>
            </div>
            <input disabled="true" id="{{ 'end'.'_period_'.$perodDiscount->id }}" name="{{ 'period['.$key.']'.'[end]' }}" value="{{date("H:i",strtotime($perodDiscount->end))}}" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
        </div>
    </div>
    <div class="col-2 text-center">
        <p class="display-5">{{ __('Price') }}</p>
    </div>
    <div class="col-2">
        <div class="input-group">
            <input disabled="true" style="border:1px solid gray" type="number" id="{{ 'itemprice_period_'.$perodDiscount->id }}" name="{{ 'period['.$key.']'.'[amount]' }}" value="{{ $perodDiscount->amount }}" class="flatpickr datetimepicker form-control" type="text">
            <input type="hidden" name="{{ 'period['.$key.']'.'[item_id]' }}" value="{{ $item->id }}"  type="text">
            <input type="hidden" name="{{ 'period['.$key.']'.'[id]' }}" value="{{ $perodDiscount->id }}"      type="text">
            <input type="hidden" id="{{ 'day_period_'.$perodDiscount->id }}" name="{{ 'period['.$key.']'.'[day]' }}" value="{{ $perodDiscount->day }}"      type="text">
            <input type="hidden" name="{{ 'period['.$key.']'.'[discount_type]' }}" value="value"      type="text">
        </div>
    </div>
    <div class="col-1">
        <div class="input-group">
            @include('items.happyhours.inc.button_edit',compact(['item','perodDiscount']))
        </div>
    </div>
</div>
