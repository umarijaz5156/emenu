<div class="card card-profile shadow">
    <div class="card-header">
        <div class="row align-items-center">
            <div class="col-8">
                <h5 class="h3 mb-0">{{ __("Mass Price Edit for Happy Hours")}}</h5>
            </div>
            <div class="col-4 text-right">
                @include('restorants.happyhours.inc.modal',['id'=>'PDmodal','isButton'=>true,'restourant'=>$restorant])
            </div>
            <small class="text-muted">
                <strong>{{__('Automatically reduce or increase prices on selected menu items for a set time')}}</strong>
            </small>
        </div>

    </div>

    <div class="card-body">

        @if($restorant->happyHours->count())
            <br />

            @foreach(\App\Constants\Days::asArray() as $num=>$day)
                    @include('restorants.happyhours.inc.list',compact('restorant','day'))
            @endforeach

            @push('js')
                <script>
                    var timeFormat = '{{ config('settings.time_format') }}';
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
                </script>
            @endpush
        @endif

    </div>
</div>


@include('restorants.happyhours.inc.modal',['id'=>'PDmodal','restorant'=>$restorant])
