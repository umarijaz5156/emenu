<link rel="stylesheet" href="{{ asset('vendor') }}/flatpickr/flatpickr.min.css">
<script src="{{ asset('vendor') }}/flatpickr/flatpickr.js"></script>

<div id = "shiftpicker" style="display: flex;justify-content: space-around">
        <div class="form-group{{ $errors->has('dayslot') ? ' has-danger' : '' }} w-100">
            <label class="form-control-label" for="phone">{{ __('Select Day') }}</label>
            <input required type="text" id="dayslot" name="dayslot" value="Select Day" class="form-control{{ $errors->has('dayslot') ? ' is-invalid' : '' }}">
            @if ($errors->has('dayslot'))
                <span class="invalid-feedback" role="alert">
                <strong>{{ $errors->first('dayslot') }}</strong>
            </span>
            @endif
        </div>

        <div class="form-group{{ $errors->has('timeslot') ? ' has-danger' : '' }} w-100">
            <label class="form-control-label" for="phone">{{ __('Select Time') }}</label>
            <select  required id="timeslot" name="timeslot" class="form-control{{ $errors->has('timeslot') ? ' is-invalid' : '' }}" >
                <option v-for="(hour,index) of workingHours"
                        :key="index+key"
                        :workingHours="hour">@{{ hour }}</option>
            </select>
            @if ($errors->has('timeslot'))
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('timeslot') }}</strong>
                </span>
            @endif
        </div>
</div>


<script>
document.addEventListener('DOMContentLoaded',()=>{
    const days=JSON.parse(`{!!  json_encode($workingDays, JSON_HEX_APOS) !!}`);

    shiftpicker=new Vue({
        el:"#shiftpicker",

        data:{
            workingHours:[],
            key:1,
            timeActive:false
        },
        mounted() {

            let str = moment(new Date()).format('YYYY-MM-DD').toString()
            this.getHours(str);

            $("#dayslot").flatpickr({minDate: "today", mode:"single", enable: [
                function(date) {
                 return (days.find((el)=>date.getDay() === parseInt(el)) !== undefined);
                }]},);

            $( "#dayslot" ).change((el)=> {
                this.getHours(el.target.value);
            });

        },
        methods: {
            getHours:function(el){
                const form_data = {
                    _token: "{{ csrf_token() }}",
                    day: el,
                    vendor:"{{ $restorant->id }}"
                }

                $.ajax({
                    type: 'POST',
                    url: "{{ route('get_hours') }}",
                    dataType: 'json',
                    data: form_data,
                    success: (response)=> {
                        if (response) {
                            this.workingHours = Object.values(response);
                            this.key+=1000;

                        }
                        console.log(this.workingHours);
                    }
                })

            }
        },
    })
})
</script>
