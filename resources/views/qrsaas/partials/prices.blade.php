<section id="pricing" class="section-header bg-primary pb-2 pb-lg-2 bg-soft">
    {{-- <div class="bg-primary"> --}}
    <div class="container">

        <div class="row justify-content-center mb-6">
            <div class="col-12 col-md-10 text-center">
                <i class="fas fa-edit mr-2 text-white ckedit_btn" type="button" style="display: none"></i>
                <h1 class="display-2 mb-3 ckedit" key="pricing_title" id="pricing_title">
                    {{ __('qrlanding.pricing_title') }}</h1>
                <i class="fas fa-edit mr-2 text-white ckedit_btn" type="button" style="display: none"></i>
                <p class="lead px-5 ckedit" key="pricing_subtitle" id="pricing_subtitle">
                    {{ __('qrlanding.pricing_subtitle') }}</p>
            </div>
        </div>

        <div class="d-flex my-3 justify-content-center">
            <div class="mx-2">
                <label class="switch">
                    <input type="checkbox" id="yearly_btn">
                    <span class="slider round"></span>
                </label>
            </div>
            <h3 id="plan_label">Annual</h3>
        </div>

        <div class="row text-gray">
            {{-- asasasas --}}
            @foreach ($plans as $plan)
                @include('qrsaas.partials.plan', ['plan' => $plan, 'col' => $col])
            @endforeach
        </div>

    </div>
    {{-- </div> --}}
</section>


<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>



<style>
    /* The switch - the box around the slider */
    .switch {
        position: relative;
        display: inline-block;
        width: 58px;
        height: 31px;
    }

    /* Hide default HTML checkbox */
    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    /* The slider */
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 23px;
        width: 23px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked+.slider {
        background-color: #2196F3;
    }

    input:focus+.slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    /* Rounded sliders */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
</style>


<script>
    var only_monthly_plans = false;

    $('.monthly_plan').hide();
    $('.yearly_plan').show();

    $('#plan_label').text('Annual');

    $(document).ready(function() {
        $('#yearly_btn').click(function() {
            // console.log('clicked');
            if (only_monthly_plans) {
                $('.monthly_plan').hide();
                $('.yearly_plan').show();
                only_monthly_plans = false;
                $('#plan_label').text('Annual');
            } else {
                $('.monthly_plan').show();
                $('.yearly_plan').hide();
                only_monthly_plans = true;
                $('#plan_label').text('Monthly');
            }
        });
    });
</script>


{{-- php artisan make:migration free_themes_to_integer_in_table_name --table=compare_plan_name  --}}
