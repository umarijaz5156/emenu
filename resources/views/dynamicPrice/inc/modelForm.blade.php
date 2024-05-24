    @if (!is_null($dynamicPrice))
        <form role="form" method="post" action="{{ route('dynamic-price.update', $dynamicPrice->id) }}" enctype="multipart/form-data" id="dynamic-price-form">
            @csrf
            
            <input type="hidden" name="item_id" value="{{ $dynamicPrice->item_id }}" class="item_id_model">
            <input type="hidden" name="day" value="{{ $dynamicPrice->day }}" class="day_model">
            <span class="item_id_err text-danger"></span>
            <span class="day_err text-danger"></span>
            <div class="form-group">
                <label class="form-control-label" for="new_period_start">{{__("Start Time")}}</label>
                <div class="input-group">
                    <input type="time" class="form-control" name="start" value="{{ $dynamicPrice->start }}">
                </div>
                <span class="start_err text-danger"></span>
            </div>
            <div class="form-group">
                <label class="form-control-label" for="new_period_end">{{__("End Time")}}</label>
                <div class="input-group">
                    <input type="time" class="form-control" name="end" value="{{ $dynamicPrice->end }}">
                </div>
                    <span class="end_err text-danger"></span>
            </div>
            <div class="form-group">
                <label class="form-control-label" for="new_period_end">{{__("Type")}}</label>
                <div class="input-group">
                    <input type="radio" name="percentage_type" id="minus" value="-"  {{ $dynamicPrice->percentage_type == '-' ? 'checked' : '' }}>
                    <label for="minus">Minus</label>
                </div>
                <div class="input-group">
                    <input type="radio" name="percentage_type" id="plush" value="+" {{ $dynamicPrice->percentage_type == '+' ? 'checked' : '' }}>
                    <label for="plush">Plus</label>
                </div>
                <span class="percentage_type_err text-danger"></span>
            </div>
            <div class="form-group">
                <label class="form-control-label" for="new_period_end">{{__("Percentage")}}</label>
                <div class="input-group">
                    <input type="number" id="percentage" name="percentage" class="form-control percentage" value="{{ $dynamicPrice->percentage }}">
                </div>
                    <span class="percentage_err text-danger"></span>
            </div>
        </form>
    @else
        <form role="form" method="post" action="{{ route('dynamic-price.store') }}" enctype="multipart/form-data" id="dynamic-price-form">
            @csrf

            <input type="hidden" name="item_id" value="{{ $itemID ?? '' }}" class="item_id_model">
            <input type="hidden" name="day" value="{{ $day ?? '' }}" class="day_model">
            <span class="item_id_err text-danger"></span>
            <span class="day_err text-danger"></span>
            <div class="form-group">
                <label class="form-control-label" for="new_period_start">{{__("Start Time")}}</label>
                <div class="input-group">
                    <input type="time" class="form-control" name="start">
                </div>
                <span class="start_err text-danger"></span>
            </div>
            <div class="form-group">
                <label class="form-control-label" for="new_period_end">{{__("End Time")}}</label>
                <div class="input-group">
                    <input type="time" class="form-control" name="end">
                </div>
                    <span class="end_err text-danger"></span>
            </div>
            <div class="form-group">
                <label class="form-control-label" for="new_period_end">{{__("type")}}</label>
                <div class="input-group">
                    <input type="radio" name="percentage_type" id="minus" value="-" checked="checked">
                    <label for="minus">minus</label>
                </div>
                <div class="input-group">
                    <input type="radio" name="percentage_type" id="plush" value="+">
                    <label for="plush">plush</label>
                </div>
                <span class="percentage_type_err text-danger"></span>
            </div>
            <div class="form-group">
                <label class="form-control-label" for="new_period_end">{{__("Percentage")}}</label>
                <div class="input-group">
                    <input type="number" id="percentage" name="percentage" class="form-control percentage" value="0">
                </div>
                    <span class="percentage_err text-danger"></span>
            </div>
    @endif
<div class="text-center">
    <button type="submit" class="btn btn-primary my-4 dynamic-price-save">{{ __('Save') }}</button>
</div>