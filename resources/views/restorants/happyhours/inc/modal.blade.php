@if(isset($isButton) && $isButton)
    <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#{{ $id }}">{{ __('Add') }}</button>
@elseif(isset($isEditButton) && $isEditButton)
    <button type="button" class="dropdown-item" data-toggle="modal" data-target="#{{ $id }}" onClick=(setHappyHours({{ $perodDiscount->toJson() }},this))>Edit</button>
@else
    <style>
        .select2-dropdown{
            z-index: 99999999;
        }
    </style>

   <div class="modal fade" id="{{ $id }}" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
        <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="modal-title-new-extras">{{ __('Add new Happy Hours') }}</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="card bg-secondary shadow border-0">
                        <div class="card-body px-lg-5 py-lg-5">
                            <form role="form" method="post" action="{{ route('admin.restaurant.happyHours.create',$restorant)  }}" enctype="multipart/form-data">
                                @csrf
                                @include('partials.select', ['class'=>"col-12",'name'=>"Day",'var_name'=>"period[new][day]",'placeholder'=>"Select type",'data'=>array_combine(\App\Constants\Days::asArray(),array_map(function ($a){return ucfirst($a);},\App\Constants\Days::asArray())),'required'=>true, 'value'=>0, 'id'=>'new_day'])

                                <div class="form-group">
                                    <label class="form-control-label" for="new_period_start">{{__("Start Time")}}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="ni ni-time-alarm"></i></span>
                                        </div>
                                        <input id="new_period_start" name="period[new][start]" value="" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="form-control-label" for="new_period_end">{{__("End Time")}}</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="ni ni-time-alarm"></i></span>
                                        </div>
                                        <input id="new_period_end" name="period[new][end]" value="" class="flatpickr datetimepicker form-control" type="text" placeholder="{{ __('Time') }}">
                                    </div>
                                </div>

                                @include('partials.input',['id'=>'name','name'=>'Period discount percent','var_name'=>'period[new][amount]','placeholder'=>'Period discount percent','value'=>'', 'required'=>true, 'type'=>'number'])

                                <input type="hidden" name="{{ 'period[new][restorant_id]' }}" value="{{ $restorant->id }}"  type="text">
                                <input type="hidden" name="{{ 'period[new][id]' }}" value="new"  type="text">
                                <input type="hidden" name="{{ 'period[new][discount_type]' }}" value="percent"  type="text">
                                <input type="hidden" name="{{ 'period[new][priority]' }}" value="1"  type="text">

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary my-4">{{ __('Save') }}</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('js')
        <script>
            var timeFormat = '{{ config('settings.time_format') }}';
            document.addEventListener('DOMContentLoaded',()=>{

                changeFlatpickerValue('#new_period_start','00:00');

                changeFlatpickerValue('#new_period_end','01:00');

            })

            function changeFlatpickerValue(selector,date){
                if (typeof pickerConfig === 'undefined'){
                    var pickerConfig = {
                        enableTime: true,
                        dateFormat: timeFormat == "AM/PM" ? "h:i K": "H:i",
                        noCalendar: true,
                        altFormat: timeFormat == "AM/PM" ? "h:i K" : "H:i",
                        altInput: true,
                        allowInput: true,
                        time_24hr: timeFormat == "AM/PM" ? false : true,
                        onChange: [
                            function(selectedDates, dateStr, instance){
                                //...
                                this._selDateStr = dateStr;
                            },
                        ],
                        onClose: [
                            function(selDates, dateStr, instance){
                                if (this.config.allowInput && this._input.value && this._input.value !== this._selDateStr) {
                                    this.setDate(this.altInput.value, false);
                                }
                            }
                        ]
                    };
                }
                var pickr = flatpickr($(selector), {...pickerConfig,
                    onReady (_, __, fp) {
                        fp.calendarContainer.style.zIndex="99999999999999999999";

                    }});
                pickr.setDate(date, false);
            }

            function setHappyHours(id,el) {

                //Remove all seleted

                console.log(el);
                console.log(id);

                let price = $('#itemprice_period_'+id.id).val();
                let end   = $('#end_period_'+id.id).val();
                let start = $('#start_period_'+id.id).val();
                let day   = $('#day_period_'+id.id).val();
                let the_id    = id.id;
                console.log(start);

                changeFlatpickerValue('input[name = \'period[new][end]\']',end);
                changeFlatpickerValue('input[name = \'period[new][start]\']',start);

                $('input[name = \'period[new][amount]\']').val(price);
                $('input[name = \'period[new][id]\']').val(the_id);
               // $('input[name = \'period[new][item_id]\']').val(id.item_id);

                $('#new_day').val(day).change();
                $('#new_day').trigger('change');



            }


        </script>
    @endpush


@endif

