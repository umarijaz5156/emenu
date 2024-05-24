    <!-- Front CSS -->
    <link type="text/css" href="{{ asset('impactfront') }}/css/front.min.css" rel="stylesheet">

    <!-- Custom CSS by mobidonia -->
    <link type="text/css" href="{{ asset('custom') }}/css/custom_qr.css" rel="stylesheet">

    <!-- Custom CSS defined by admin -->
    <link type="text/css" href="{{ asset('byadmin') }}/front.css" rel="stylesheet">

    <section class="my-5 py-3">
        <div class="container">
            <h1 class="display-2 mb-3 text-center my-5">
                {{ __('qrlanding.compare_plan') }}
            </h1>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_features" class="price_header plan_cell editable">
                        <h6 class="h-100 text-white">
                            Features
                            <i></i>
                            {{-- @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_features')
                                {{ $label->name }}
                                
                            @endif
                        @endforeach --}}
                        </h6>
                    </div>
                </div>
                <div class="col-3 my-0 p-0">
                    <div class="price_header plan_cell">
                        <h6 class="h-100 text-white">Basic Plan<i></i></h6>
                    </div>
                </div>
                <div class="col-3 my-0 p-0">
                    <div class="price_header plan_cell">
                        <h6 class="h-100 text-white">Premium Plan<i></i></h6>
                    </div>
                </div>
                <div class="col-3 my-0 p-0">
                    <div class="price_header plan_cell">
                        <h6 class="h-100 text-white">Enterprise Plan<i></i></h6>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_cost_saving_eco" class="w-100 py-3 row_odd text-center" even="false">
                        {{-- COST-SAVING & ECOFRIENDLY --}}
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_cost_saving_eco')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_no_setup_cost" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_no_setup_cost')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->no_setup_cost)
                            <span style="color: green;"><i class="fas fa-check py-1"></i></span>
                        @else
                            <i class="fas fa-times py-1"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" value="" id="basic_plan_no_setup_cost"
                                {{ $basic_plan->no_setup_cost ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_no_setup_cost">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->no_setup_cost)
                            <span style="color: green;"><i class="fas fa-check py-1"></i></span>
                        @else
                            <i class="fas fa-times py-1"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" value=""
                                id="premium_plan_no_setup_cost" {{ $premium_plan->no_setup_cost ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_no_setup_cost">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->no_setup_cost)
                            <span style="color: green;"><i class="fas fa-check py-1"></i></span>
                        @else
                            <i class="fas fa-times py-1"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_no_setup_cost"
                                {{ $enterprise_plan->no_setup_cost ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_no_setup_cost">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_eco_friendly" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_eco_friendly')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->eco_friendly)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_eco_friendly"
                                {{ $basic_plan->eco_friendly ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_eco_friendly">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->eco_friendly)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_eco_friendly"
                                {{ $premium_plan->eco_friendly ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_eco_friendly">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->eco_friendly)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_eco_friendly"
                                {{ $enterprise_plan->eco_friendly ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_eco_friendly">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_boost_your_business" class="w-100 py-3 row_even text-center">
                        <h6 class="m-0 p-0 text-uppercase">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_boost_your_business')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>

            <div class="row">
                <div id="compare_plan_name_cut_opt_cost" class="col-3 my-0 p-0">
                    <div class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_cut_opt_cost')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->cut_opt_cost)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_cut_opt_cost"
                                {{ $basic_plan->cut_opt_cost ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_cut_opt_cost">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->cut_opt_cost)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_cut_opt_cost"
                                {{ $premium_plan->cut_opt_cost ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_cut_opt_cost">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->cut_opt_cost)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_cut_opt_cost"
                                {{ $enterprise_plan->cut_opt_cost ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_cut_opt_cost">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_detailed_reports" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_detailed_reports')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->detailed_reports)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_detailed_reports"
                                {{ $basic_plan->detailed_reports ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_detailed_reports">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->detailed_reports)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_detailed_reports"
                                {{ $premium_plan->detailed_reports ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_detailed_reports">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->detailed_reports)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_detailed_reports"
                                {{ $enterprise_plan->detailed_reports ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_detailed_reports">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_increase_sales" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_increase_sales')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->increase_sales)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_increase_sales"
                                {{ $basic_plan->increase_sales ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_increase_sales">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->increase_sales)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_increase_sales"
                                {{ $premium_plan->increase_sales ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_increase_sales">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->increase_sales)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_increase_sales"
                                {{ $enterprise_plan->increase_sales ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_increase_sales">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_saving_foh" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_saving_foh')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->savings_foh)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_saving_foh"
                                {{ $basic_plan->savings_foh ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_saving_foh">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->savings_foh)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_saving_foh"
                                {{ $premium_plan->savings_foh ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_saving_foh">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->savings_foh)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                            {{-- <span style="color: red">(limit to 200 products)</span> --}}
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_saving_foh"
                                {{ $enterprise_plan->savings_foh ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_saving_foh">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div class="row_odd plan_cell h-100">
                        Coupon code
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_order_limit" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_order_limit')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->order_limit)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_order_limit"
                                {{ $basic_plan->order_limit ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_order_limit">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->order_limit)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_order_limit"
                                {{ $premium_plan->order_limit ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_order_limit">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->order_limit)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_order_limit"
                                {{ $enterprise_plan->order_limit ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_order_limit">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>




            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_order_management" class="w-100 py-3 row_odd text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_order_management')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_delivery_pick_dine" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_delivery_pick_dine')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->delivery_pick_dine)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_delivery_pick_dine"
                                {{ $basic_plan->delivery_pick_dine ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_delivery_pick_dine">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->delivery_pick_dine)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_delivery_pick_dine"
                                {{ $premium_plan->delivery_pick_dine ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_delivery_pick_dine">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->delivery_pick_dine)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_delivery_pick_dine"
                                {{ $enterprise_plan->delivery_pick_dine ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_delivery_pick_dine">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_payments_gateway" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_payments_gateway')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->payments_gateway)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_payments_gateway"
                                {{ $basic_plan->payments_gateway ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_payments_gateway">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->payments_gateway)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_payments_gateway"
                                {{ $premium_plan->payments_gateway ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_payments_gateway">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->payments_gateway)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_payments_gateway"
                                {{ $enterprise_plan->payments_gateway ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_payments_gateway">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_data_analytics" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_data_analytics')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->data_analytics)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_data_analytics"
                                {{ $basic_plan->data_analytics ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_data_analytics">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->data_analytics)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_data_analytics"
                                {{ $premium_plan->data_analytics ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_data_analytics">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->data_analytics)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_data_analytics"
                                {{ $enterprise_plan->data_analytics ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_data_analytics">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_engage" class="w-100 py-3 row_odd text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_engage')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_connect_customers" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_connect_customers')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->connect_customers)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_connect_customers"
                                {{ $basic_plan->connect_customers ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_connect_customers">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->connect_customers)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_connect_customers"
                                {{ $premium_plan->connect_customers ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_connect_customers">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->connect_customers)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_connect_customers"
                                {{ $enterprise_plan->connect_customers ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_connect_customers">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_control_presence" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_control_presence')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->control_presence)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_control_presence"
                                {{ $basic_plan->control_presence ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_control_presence">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->control_presence)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_control_presence"
                                {{ $premium_plan->control_presence ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_control_presence">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->control_presence)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_control_presence"
                                {{ $enterprise_plan->control_presence ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_control_presence">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_customer_support" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_customer_support')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->customer_supports)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_customer_supports"
                                {{ $basic_plan->customer_supports ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_customer_supports">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->customer_supports)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_customer_supports"
                                {{ $premium_plan->customer_supports ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_customer_supports">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->customer_supports)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_customer_supports"
                                {{ $enterprise_plan->customer_supports ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_customer_supports">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_collect_reviews" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_collect_reviews')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->collect_reviews)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_collect_reviews"
                                {{ $basic_plan->collect_reviews ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_collect_reviews">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->collect_reviews)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_collect_reviews"
                                {{ $premium_plan->collect_reviews ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_collect_reviews">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->collect_reviews)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_collect_reviews"
                                {{ $enterprise_plan->collect_reviews ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_collect_reviews">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_elevate_dining_experience" class="w-100 py-3 row_even text-center">
                        <h6 class="p-0 m-0 text-uppercase">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_elevate_dining_experience')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach

                        </h6>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_add_items" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_add_items')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="basic_plan_add_items" class="row_odd plan_cell h-100">
                        {{-- {{ $basic_plan->add_items }} --}}
                        <span style="color: red;">
                            <i class="fas fa-check"></i> (50 items)
                        </span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="premium_plan_add_items" class="row_odd plan_cell h-100">
                        {{-- {{ $premium_plan->add_items }} --}}
                        <span style="color: red"><i class="fas fa-check"></i> (200
                            items)</span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="enterprise_plan_add_items" class="row_odd plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span> {{-- {{ $enterprise_plan->add_items }} items --}}
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_browse_menu" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_browse_menu')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->browse_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_browse_menu"
                                {{ $basic_plan->browse_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_browse_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->browse_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_browse_menu"
                                {{ $premium_plan->browse_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_browse_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->browse_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_browse_menu"
                                {{ $enterprise_plan->browse_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_browse_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_call_waiter" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_call_waiter')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->call_waiter)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_call_waiter"
                                {{ $basic_plan->call_waiter ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_call_waiter">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->call_waiter)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_call_waiter"
                                {{ $premium_plan->call_waiter ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_call_waiter">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->call_waiter)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_call_waiter"
                                {{ $enterprise_plan->call_waiter ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_call_waiter">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_create_dining_experience" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_create_dining_experience')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->create_dining_experience)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_create_dining_experience"
                                {{ $basic_plan->create_dining_experience ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_create_dining_experience">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->create_dining_experience)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox"
                                id="premium_plan_create_dining_experience"
                                {{ $premium_plan->create_dining_experience ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_create_dining_experience">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->create_dining_experience)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox"
                                id="enterprise_plan_create_dining_experience"
                                {{ $enterprise_plan->create_dining_experience ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_create_dining_experience">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_dynamic_pricing" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_dynamic_pricing')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->dynamic_pricing)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_dynamic_pricing"
                                {{ $basic_plan->dynamic_pricing ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_dynamic_pricing">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->dynamic_pricing)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_dynamic_pricing"
                                {{ $premium_plan->dynamic_pricing ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_dynamic_pricing">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->dynamic_pricing)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_dynamic_pricing"
                                {{ $enterprise_plan->dynamic_pricing ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_dynamic_pricing">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_qr_code_menu" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_qr_code_menu')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->qr_code_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_qr_code_menu"
                                {{ $basic_plan->qr_code_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_qr_code_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->qr_code_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_qr_code_menu"
                                {{ $premium_plan->qr_code_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_qr_code_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->qr_code_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_qr_code_menu"
                                {{ $enterprise_plan->qr_code_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_qr_code_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_quick_search" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_quick_search')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->quick_search)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_quick_search"
                                {{ $basic_plan->quick_search ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_quick_search">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->quick_search)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_quick_search"
                                {{ $premium_plan->quick_search ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_quick_search">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->quick_search)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_quick_search"
                                {{ $enterprise_plan->quick_search ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_quick_search">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_unique_qr_code" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_unique_qr_code')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="basic_plan_unique_qr_code" class="row_even plan_cell h-100">
                        <span style="color:red"><i class="fas fa-check"></i> (10
                            tables)</span>
                        {{-- {{ $basic_plan->unique_qr_code }} --}}
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="premium_plan_unique_qr_code" class="row_even plan_cell h-100">
                        <span style="color:red"><i class="fas fa-check"></i> (25
                            tables)</span>
                        {{-- {{ $premium_plan->unique_qr_code }} --}}
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="enterprise_plan_unique_qr_code" class="row_even plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span> {{-- {{ $enterprise_plan->unique_qr_code }} tables --}}
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_expand" class="w-100 py-3 row_odd text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_expand')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_expand_features" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_expand_features')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->expand_features)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_expand_features"
                                {{ $basic_plan->expand_features ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_expand_features">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->expand_features)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_expand_features"
                                {{ $premium_plan->expand_features ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_expand_features">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->expand_features)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_expand_features"
                                {{ $enterprise_plan->expand_features ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_expand_features">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_globalize" class="w-100 py-3 row_odd text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_globalize')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_custom_domain" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_custom_domain')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach

                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->custom_domain)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_custom_domain"
                                {{ $basic_plan->custom_domain ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_custom_domain">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->custom_domain)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_custom_domain"
                                {{ $premium_plan->custom_domain ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_custom_domain">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->custom_domain)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_custom_domain"
                                {{ $enterprise_plan->custom_domain ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_custom_domain">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_menu_generator" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_menu_generator')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->menu_generator)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_menu_generator"
                                {{ $basic_plan->menu_generator ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_menu_generator">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->menu_generator)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_menu_generator"
                                {{ $premium_plan->menu_generator ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_menu_generator">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->menu_generator)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_menu_generator"
                                {{ $enterprise_plan->menu_generator ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_menu_generator">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_translation" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_translation')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="basic_plan_translation_languages" class="row_even plan_cell h-100">
                        <i class="fas fa-times"></i> {{-- {{ $basic_plan->translation_languages }} languages --}}
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="premium_plan_translation_languages" class="row_even plan_cell h-100">
                        <span style="color: red"><i class="fas fa-check"></i> (4 languages)</span>
                        {{-- {{ $premium_plan->translation_languages }} languages --}}
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="enterprise_plan_translation_languages" class="row_even plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span> {{-- {{ $enterprise_plan->translation_languages }} languages --}}
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_effortless_menu_control" class="w-100 py-3 row_odd text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_effortless_menu_control')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_allergens" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_allergens')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->allergens)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_allergens"
                                {{ $basic_plan->allergens ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_allergens">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->allergens)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_allergens"
                                {{ $premium_plan->allergens ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_allergens">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->allergens)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_allergens"
                                {{ $enterprise_plan->allergens ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_allergens">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_menu_management" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_menu_management')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->menu_management)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_menu_management"
                                {{ $basic_plan->menu_management ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_menu_management">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->menu_management)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_menu_management"
                                {{ $premium_plan->menu_management ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_menu_management">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->menu_management)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_menu_management"
                                {{ $enterprise_plan->menu_management ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_menu_management">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_optional_change" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_optional_change')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->operational_change)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_optional_change"
                                {{ $basic_plan->operational_change ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_optional_change">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->operational_change)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_optional_change"
                                {{ $premium_plan->operational_change ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_optional_change">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->operational_change)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_optional_change"
                                {{ $enterprise_plan->operational_change ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_optional_change">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_support" class="w-100 py-3 row_odd text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_support')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach
                        </h6>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_multiple_accounts" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_multiple_accounts')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="basic_plan_multiple_accounts" class="row_even plan_cell h-100">
                        {{-- Limit to {{ $basic_plan->multiple_accounts }} staff --}}
                        <span style="color: red"><i class="fas fa-check"></i> (Limit to 3 staff)</span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="premium_plan_multiple_accounts" class="row_even plan_cell h-100">
                        {{-- Limit to {{ $premium_plan->multiple_accounts }} staff --}}
                        <span style="color: red"><i class="fas fa-check"></i> (Limit to 5 staff)</span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="enterprise_plan_multiple_accounts" class="row_even plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span> {{-- Limit to {{ $enterprise_plan->multiple_accounts }} staff --}}
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_support_tickets" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_support_tickets')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->support_tickets)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_support_tickets"
                                {{ $basic_plan->support_tickets ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_support_tickets">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->support_tickets)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_support_tickets"
                                {{ $premium_plan->support_tickets ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_support_tickets">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->support_tickets)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_support_tickets"
                                {{ $enterprise_plan->support_tickets ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_support_tickets">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_priority_support" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_priority_support')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->priority_support)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_priority_support"
                                {{ $basic_plan->priority_support ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_priority_support">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->priority_support)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_priority_support"
                                {{ $premium_plan->priority_support ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_priority_support">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->priority_support)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_priority_support"
                                {{ $enterprise_plan->priority_support ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_priority_support">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_qr_scans" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_qr_scans')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="basic_plan_qr_scans" class="row_odd plan_cell h-100">
                        {{-- {{ $basic_plan->qr_scans }} per month --}}
                        <span style="color: red"><i class="fas fa-check"></i> (5000 per month)</span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="premium_plan_qr_scans" class="row_odd plan_cell h-100">
                        {{-- {{ $premium_plan->qr_scans }} per month --}}
                        <span style="color: red"><i class="fas fa-check"></i> (10000 per month)</span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="enterprise_plan_qr_scans" class="row_odd plan_cell h-100">
                        <span style="color: green;"><i class="fas fa-check"></i></span> {{-- {{ $enterprise_plan->qr_scans }} per month --}}
                    </div>

                </div>
            </div>

            {{-- Header --}}
            <div class="row">
                <div class="col-12 my-0 p-0">
                    <div id="compare_plan_name_design_it_your_way" class="w-100 py-3 row_even text-center">
                        <h6 class="m-0 p-0">
                            @foreach ($labels as $label)
                                @if ($label->slug == 'compare_plan_name_design_it_your_way')
                                    {{ $label->name }}
                                    {{-- @break --}}
                                @endif
                            @endforeach

                        </h6>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_suitable_business" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_suitable_business')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->suitable_business)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_suitable_business"
                                {{ $basic_plan->suitable_business ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_suitable_business">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->suitable_business)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_suitable_business"
                                {{ $premium_plan->suitable_business ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_suitable_business">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->suitable_business)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_suitable_business"
                                {{ $enterprise_plan->suitable_business ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_suitable_business">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_add_images" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_add_images')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->add_images)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_add_images"
                                {{ $basic_plan->add_images ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_add_images">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->add_images)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_add_images"
                                {{ $premium_plan->add_images ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_add_images">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->add_images)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_add_images"
                                {{ $enterprise_plan->add_images ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_add_images">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>


            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_add_logo" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_add_logo')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->add_logo)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_add_logo"
                                {{ $basic_plan->add_logo ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_add_logo">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->add_logo)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_add_logo"
                                {{ $premium_plan->add_logo ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_add_logo">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->add_logo)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_add_logo"
                                {{ $enterprise_plan->add_logo ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_add_logo">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_customizable_design" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_customizable_design')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->customizable_design)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_customizable_design"
                                {{ $basic_plan->customizable_design ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_customizable_design">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->customizable_design)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_customizable_design"
                                {{ $premium_plan->customizable_design ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_customizable_design">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->customizable_design)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox"
                                id="enterprise_plan_customizable_design"
                                {{ $enterprise_plan->customizable_design ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_customizable_design">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_free_themes" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_free_themes')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="basic_plan_free_themes" class="row_odd plan_cell h-100">
                        {{-- {{ $basic_plan->free_themes }} --}}
                        <span style="color: red;">
                            <i class="fas fa-check"></i> (Default theme)
                        </span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="premium_plan_free_themes" class="row_odd plan_cell h-100">
                        {{-- {{ $premium_plan->free_themes }} --}}
                        <span style="color: red;">
                            <i class="fas fa-check"></i> (Default theme)
                        </span>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div id="enterprise_plan_free_themes" class="row_odd plan_cell h-100">
                        {{-- {{ $enterprise_plan->free_themes }} --}}
                        <span style="color: red;">
                            <i class="fas fa-check"></i>(Default, glow and elegant themes)
                        </span>
                    </div>
                </div>
            </div>

            {{-- Working --}}
            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_instant_updates" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_instant_updates')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->instants_updates)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_instants_updates"
                                {{ $basic_plan->instants_updates ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_instants_updates">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->instants_updates)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_instants_updates"
                                {{ $premium_plan->instants_updates ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_instants_updates">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->instants_updates)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_instants_updates"
                                {{ $enterprise_plan->instants_updates ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_instants_updates">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_personalise_menu" class="row_odd plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_personalise_menu')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($basic_plan->personalise_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_personalise_menu"
                                {{ $basic_plan->personalise_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_personalise_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($premium_plan->personalise_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_personalise_menu"
                                {{ $premium_plan->personalise_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_personalise_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_odd plan_cell h-100">
                        @if ($enterprise_plan->personalise_menu)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_personalise_menu"
                                {{ $enterprise_plan->personalise_menu ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_personalise_menu">
                                &nbsp;
                            </label>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-3 my-0 p-0">
                    <div id="compare_plan_name_view_from_device" class="row_even plan_cell h-100">
                        @foreach ($labels as $label)
                            @if ($label->slug == 'compare_plan_name_view_from_device')
                                {{ $label->name }}
                                {{-- @break --}}
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($basic_plan->view_from_device)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="basic_plan_view_from_device"
                                {{ $basic_plan->view_from_device ? 'checked' : '' }}>
                            <label class="form-check-label" for="basic_plan_view_from_device">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($premium_plan->view_from_device)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="premium_plan_view_from_device"
                                {{ $premium_plan->view_from_device ? 'checked' : '' }}>
                            <label class="form-check-label" for="premium_plan_view_from_device">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row_even plan_cell h-100">
                        @if ($enterprise_plan->view_from_device)
                            <span style="color: green;"><i class="fas fa-check"></i></span>
                        @else
                            <i class="fas fa-times"></i>
                        @endif
                        <div class="form-check edit_checkbox" style="display: none;">
                            <input class="form-check-input" type="checkbox" id="enterprise_plan_view_from_device"
                                {{ $enterprise_plan->view_from_device ? 'checked' : '' }}>
                            <label class="form-check-label" for="enterprise_plan_view_from_device">
                                &nbsp;
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-3 my-0 p-0 text-center">
                    &nbsp;
                </div>

                {{-- Join now basic --}}
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row">
                        <div class="col-12">
                            @foreach ($plans as $plan)
                                @if ($plan['name'] == 'BASIC PLAN' && $plan['period'] == 1)
                                    <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                                        class="btn btn-block btn-outline-gray animate-up-2 m-0">
                                        {{ __('qrlanding.join_now') . ' ' }} (monthly)
                                        <span class="icon icon-xs ml-3">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                        <div class="col-12">
                            @foreach ($plans as $plan)
                                @if ($plan['name'] == 'BASIC PLAN' && $plan['period'] == 2)
                                    <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                                        class="btn btn-block btn-outline-gray animate-up-2 m-0">
                                        {{ __('qrlanding.join_now') . ' ' }} (yearly)
                                        <span class="icon icon-xs ml-3">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>

                {{-- Join now premium --}}
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row">
                        <div class="col-12">
                            @foreach ($plans as $plan)
                                @if ($plan['name'] == 'PREMIUM PLAN' && $plan['period'] == 1)
                                    <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                                        class="btn btn-block btn-outline-gray animate-up-2 m-0">
                                        {{ __('qrlanding.join_now') . ' ' }} (monthly)
                                        <span class="icon icon-xs ml-3">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                        <div class="col-12">
                            @foreach ($plans as $plan)
                                @if ($plan['name'] == 'PREMIUM PLAN' && $plan['period'] == 2)
                                    <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                                        class="btn btn-block btn-outline-gray animate-up-2 m-0">
                                        {{ __('qrlanding.join_now') . ' ' }} (yearly)
                                        <span class="icon icon-xs ml-3">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>

                {{-- Join now enterprise --}}
                <div class="col-3 my-0 p-0 text-center">
                    <div class="row">
                        <div class="col-12">
                            @foreach ($plans as $plan)
                                @if ($plan['name'] == 'Entreprise Plan' && $plan['period'] == 1)
                                    <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                                        class="btn btn-block btn-outline-gray animate-up-2 m-0">
                                        {{ __('qrlanding.join_now') . ' ' }} (monthly)
                                        <span class="icon icon-xs ml-3">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                        <div class="col-12">
                            @foreach ($plans as $plan)
                                @if ($plan['name'] == 'Entreprise Plan' && $plan['period'] == 2)
                                    <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                                        class="btn btn-block btn-outline-gray animate-up-2 m-0">
                                        {{ __('qrlanding.join_now') . ' ' }} (yearly)
                                        <span class="icon icon-xs ml-3">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    {{-- Toast (Data saved successfully) --}}
    <div class="d-flex justify-content-end">
        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div id="toast-container"></div>
        </div>

        <!-- Button to Trigger Toast -->
        <button id="comapre_plan_toast_btn" type="button" onclick="showToast()" class="btn btn-primary"
            style="display: none;">Show
            Toast</button>
    </div>
    {{-- Toast (Data saved successfully) --}}


    <style>
        .price_header {
            background: #4472c4;
        }

        .row_odd {
            background: #cfd5ea;
        }

        .row_even {
            background: #e9ebf5;
        }

        .price_header h6 {
            /* margin: 0 0; */
            padding: 5px 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* .plan_cell h6 { */
        /* margin: 0 0;
            display: flex;
            align-items: center; */
        /* text-transform: capitalize; */
        /* } */

        .plan_cell {
            margin: 0px 2px;
            padding: 4px 10px;
            text-transform: uppercase;
        }

        @media screen and (max-width: 576px) {
            .plan_cell h6 {
                font-size: 10px;
            }

            .plan_cell {
                font-size: 10px;
            }
        }
    </style>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>



    <script>
        var ifUser = {!! json_encode(
            auth()->user() &&
            auth()->user() &&
            auth()->user()->hasRole('admin')
                ? true
                : false,
        ) !!};

        var DateTime = new Date();

        if (ifUser) {
            $('.edit_checkbox').change(function() {
                update_data_to_server();
            });

            $('.plan_cell').click(function() {
                // console.log('asasa')
                if ($(this).find('i').length) {
                    $(this).find('.edit_checkbox').show();
                    return
                }


                let tag_name = $(this).prop('tagName').toLowerCase();

                $(this).replaceWith(function() {
                    return $('<input>', {
                        class: 'plan_cell w-100 h-100',
                        id: $(this).attr('id'),
                        old_class: $(this).attr('class') + ($(this).find('h6').length ? ' h6' : ''),
                        value: $.trim($(this).text())
                    });
                });


                $(document).on('blur', '.plan_cell', function() {
                    $(this).replaceWith(
                        $(`<${tag_name}>`, {
                            class: $(this).attr('old_class') + ' h-100',
                            id: $(this).attr('id'),
                            text: $.trim($(this).val())
                        })
                    );
                    update_data_to_server();
                });
            });

            function update_data_to_server() {
                const data = prepare_data();
                data['_token'] = $('meta[name="csrf-token"]').attr('content');

                // console.log(data);
                $.ajax({
                    type: 'POST',
                    url: '{{ route('compare_plans') }}',
                    data: data,
                    success: function(response) {
                        // console.log('success', response);
                        $('#comapre_plan_toast_btn').click();
                        // window.location.reload();
                    },
                    error: function(error) {
                        console.error('error', error.responseJSON.message);
                    }
                })
            };

            function prepare_data() {
                const data = {
                    'all_labels': {
                        // 'compare_plan_name_features': $.trim(
                        //     $('#compare_plan_name_features').text()),

                        'compare_plan_name_cost_saving_eco': $.trim(
                            $('#compare_plan_name_cost_saving_eco').text()),

                        'compare_plan_name_no_setup_cost': $.trim(
                            $('#compare_plan_name_no_setup_cost').text()),

                        'compare_plan_name_eco_friendly': $.trim(
                            $('#compare_plan_name_eco_friendly').text()),

                        'compare_plan_name_boost_your_business': $.trim(
                            $('#compare_plan_name_boost_your_business').text()),

                        'compare_plan_name_cut_opt_cost': $.trim(
                            $('#compare_plan_name_cut_opt_cost').text()),

                        'compare_plan_name_detailed_reports': $.trim(
                            $('#compare_plan_name_detailed_reports').text()),

                        'compare_plan_name_increase_sales': $.trim(
                            $('#compare_plan_name_increase_sales').text()),

                        'compare_plan_name_saving_foh': $.trim(
                            $('#compare_plan_name_saving_foh').text()),

                        'compare_plan_name_order_limit': $.trim(
                            $('#compare_plan_name_order_limit').text()),

                        'compare_plan_name_order_limit': $.trim(
                            $('#compare_plan_name_order_limit').text()),

                        // 'compare_plan_name_unlimited_product': $.trim(
                        //  $('#compare_plan_name_unlimited_product').text()),

                        'compare_plan_name_order_management': $.trim(
                            $('#compare_plan_name_order_management').text()),

                        'compare_plan_name_delivery_pick_dine': $.trim(
                            $('#compare_plan_name_delivery_pick_dine').text()),

                        'compare_plan_name_payments_gateway': $.trim(
                            $('#compare_plan_name_payments_gateway').text()),

                        'compare_plan_name_data_analytics': $.trim(
                            $('#compare_plan_name_data_analytics').text()),

                        'compare_plan_name_engage': $.trim(
                            $('#compare_plan_name_engage').text()),

                        'compare_plan_name_connect_customers': $.trim(
                            $('#compare_plan_name_connect_customers').text()),

                        'compare_plan_name_control_presence': $.trim(
                            $('#compare_plan_name_control_presence').text()),

                        'compare_plan_name_customer_support': $.trim(
                            $('#compare_plan_name_customer_support').text()),

                        'compare_plan_name_collect_reviews': $.trim(
                            $('#compare_plan_name_collect_reviews').text()),

                        'compare_plan_name_elevate_dining_experience': $.trim(
                            $('#compare_plan_name_elevate_dining_experience').text()),

                        'compare_plan_name_add_items': $.trim(
                            $('#compare_plan_name_add_items').text()),

                        'compare_plan_name_browse_menu': $.trim(
                            $('#compare_plan_name_browse_menu').text()),

                        'compare_plan_name_call_waiter': $.trim(
                            $('#compare_plan_name_call_waiter').text()),

                        'compare_plan_name_create_dining_experience': $.trim(
                            $('#compare_plan_name_create_dining_experience').text()),

                        'compare_plan_name_dynamic_pricing': $.trim(
                            $('#compare_plan_name_dynamic_pricing').text()),

                        'compare_plan_name_qr_code_menu': $.trim(
                            $('#compare_plan_name_qr_code_menu').text()),

                        'compare_plan_name_quick_search': $.trim(
                            $('#compare_plan_name_quick_search').text()),

                        'compare_plan_name_unique_qr_code': $.trim(
                            $('#compare_plan_name_unique_qr_code').text()),

                        'compare_plan_name_expand': $.trim(
                            $('#compare_plan_name_expand').text()),

                        'compare_plan_name_expand_features': $.trim(
                            $('#compare_plan_name_expand_features').text()),

                        'compare_plan_name_globalize': $.trim(
                            $('#compare_plan_name_globalize').text()),

                        'compare_plan_name_custom_domain': $.trim(
                            $('#compare_plan_name_custom_domain').text()),

                        'compare_plan_name_menu_generator': $.trim(
                            $('#compare_plan_name_menu_generator').text()),

                        'compare_plan_name_translation': $.trim(
                            $('#compare_plan_name_translation').text()),

                        'compare_plan_name_effortless_menu_control': $.trim(
                            $('#compare_plan_name_effortless_menu_control').text()),

                        'compare_plan_name_allergens': $.trim(
                            $('#compare_plan_name_allergens').text()),

                        'compare_plan_name_menu_management': $.trim(
                            $('#compare_plan_name_menu_management').text()),

                        'compare_plan_name_optional_change': $.trim(
                            $('#compare_plan_name_optional_change').text()),

                        'compare_plan_name_support': $.trim(
                            $('#compare_plan_name_support').text()),

                        'compare_plan_name_multiple_accounts': $.trim(
                            $('#compare_plan_name_multiple_accounts').text()),

                        'compare_plan_name_support_tickets': $.trim(
                            $('#compare_plan_name_support_tickets').text()),

                        'compare_plan_name_priority_support': $.trim(
                            $('#compare_plan_name_priority_support').text()),

                        'compare_plan_name_qr_scans': $.trim(
                            $('#compare_plan_name_qr_scans').text()),

                        'compare_plan_name_design_it_your_way': $.trim(
                            $('#compare_plan_name_design_it_your_way').text()),

                        'compare_plan_name_suitable_business': $.trim(
                            $('#compare_plan_name_suitable_business').text()),

                        'compare_plan_name_add_images': $.trim(
                            $('#compare_plan_name_add_images').text()),

                        'compare_plan_name_add_logo': $.trim(
                            $('#compare_plan_name_add_logo').text()),

                        'compare_plan_name_customizable_design': $.trim(
                            $('#compare_plan_name_customizable_design').text()),

                        'compare_plan_name_free_themes': $.trim(
                            $('#compare_plan_name_free_themes').text()),

                        'compare_plan_name_instant_updates': $.trim(
                            $('#compare_plan_name_instant_updates').text()),

                        'compare_plan_name_personalise_menu': $.trim(
                            $('#compare_plan_name_personalise_menu').text()),

                        'compare_plan_name_view_from_device': $.trim(
                            $('#compare_plan_name_view_from_device').text()),

                    },

                    'basic_plan_no_setup_cost': $('#basic_plan_no_setup_cost').prop('checked') ? 1 : 0,
                    'premium_plan_no_setup_cost': $('#premium_plan_no_setup_cost').prop('checked') ? 1 : 0,
                    'enterprise_plan_no_setup_cost': $('#enterprise_plan_no_setup_cost').prop('checked') ? 1 : 0,

                    'basic_plan_eco_friendly': $('#basic_plan_eco_friendly').prop('checked') ? 1 : 0,
                    'premium_plan_eco_friendly': $('#premium_plan_eco_friendly').prop('checked') ? 1 : 0,
                    'enterprise_plan_eco_friendly': $('#enterprise_plan_eco_friendly').prop('checked') ? 1 : 0,

                    'basic_plan_cut_opt_cost': $('#basic_plan_cut_opt_cost').prop('checked') ? 1 : 0,
                    'premium_plan_cut_opt_cost': $('#premium_plan_cut_opt_cost').prop('checked') ? 1 : 0,
                    'enterprise_plan_cut_opt_cost': $('#enterprise_plan_cut_opt_cost').prop('checked') ? 1 : 0,

                    'basic_plan_detailed_reports': $('#basic_plan_detailed_reports').prop('checked') ? 1 : 0,
                    'premium_plan_detailed_reports': $('#premium_plan_detailed_reports').prop('checked') ? 1 : 0,
                    'enterprise_plan_detailed_reports': $('#enterprise_plan_detailed_reports').prop('checked') ? 1 : 0,

                    'basic_plan_increase_sales': $('#basic_plan_increase_sales').prop('checked') ? 1 : 0,
                    'premium_plan_increase_sales': $('#premium_plan_increase_sales').prop('checked') ? 1 : 0,
                    'enterprise_plan_increase_sales': $('#enterprise_plan_increase_sales').prop('checked') ? 1 : 0,

                    'basic_plan_saving_foh': $('#basic_plan_saving_foh').prop('checked') ? 1 : 0,
                    'premium_plan_saving_foh': $('#premium_plan_saving_foh').prop('checked') ? 1 : 0,
                    'enterprise_plan_saving_foh': $('#enterprise_plan_saving_foh').prop('checked') ? 1 : 0,

                    'basic_plan_order_limit': $('#basic_plan_order_limit').prop('checked') ? 1 : 0,
                    'premium_plan_order_limit': $('#premium_plan_order_limit').prop('checked') ? 1 : 0,
                    'enterprise_plan_order_limit': $('#enterprise_plan_order_limit').prop('checked') ? 1 : 0,

                    // 'basic_plan_unlimited_product': $('#basic_plan_unlimited_product').prop('checked') ? 1 : 0,
                    // 'premium_plan_unlimited_product': $('#premium_plan_unlimited_product').prop('checked') ? 1 : 0,
                    // 'enterprise_plan_unlimited_product': $('#enterprise_plan_unlimited_product').prop('checked') ? 1 :
                    //     0,

                    'basic_plan_delivery_pick_dine': $('#basic_plan_delivery_pick_dine').prop('checked') ? 1 : 0,
                    'premium_plan_delivery_pick_dine': $('#premium_plan_delivery_pick_dine').prop('checked') ? 1 : 0,
                    'enterprise_plan_delivery_pick_dine': $('#enterprise_plan_delivery_pick_dine').prop('checked') ? 1 :
                        0,

                    'basic_plan_payments_gateway': $('#basic_plan_payments_gateway').prop('checked') ? 1 : 0,
                    'premium_plan_payments_gateway': $('#premium_plan_payments_gateway').prop('checked') ? 1 : 0,
                    'enterprise_plan_payments_gateway': $('#enterprise_plan_payments_gateway').prop('checked') ? 1 : 0,

                    'basic_plan_data_analytics': $('#basic_plan_data_analytics').prop('checked') ? 1 : 0,
                    'premium_plan_data_analytics': $('#premium_plan_data_analytics').prop('checked') ? 1 : 0,
                    'enterprise_plan_data_analytics': $('#enterprise_plan_data_analytics').prop('checked') ? 1 : 0,

                    'basic_plan_connect_customers': $('#basic_plan_connect_customers').prop('checked') ? 1 : 0,
                    'premium_plan_connect_customers': $('#premium_plan_connect_customers').prop('checked') ? 1 : 0,
                    'enterprise_plan_connect_customers': $('#enterprise_plan_connect_customers').prop('checked') ? 1 :
                        0,

                    'basic_plan_control_presence': $('#basic_plan_control_presence').prop('checked') ? 1 : 0,
                    'premium_plan_control_presence': $('#premium_plan_control_presence').prop('checked') ? 1 : 0,
                    'enterprise_plan_control_presence': $('#enterprise_plan_control_presence').prop('checked') ? 1 : 0,

                    'basic_plan_customer_supports': $('#basic_plan_customer_supports').prop('checked') ? 1 : 0,
                    'premium_plan_customer_supports': $('#premium_plan_customer_supports').prop('checked') ? 1 : 0,
                    'enterprise_plan_customer_supports': $('#enterprise_plan_customer_supports').prop('checked') ? 1 :
                        0,

                    'basic_plan_collect_reviews': $('#basic_plan_collect_reviews').prop('checked') ? 1 : 0,
                    'premium_plan_collect_reviews': $('#premium_plan_collect_reviews').prop('checked') ? 1 : 0,
                    'enterprise_plan_collect_reviews': $('#enterprise_plan_collect_reviews').prop('checked') ? 1 : 0,

                    'basic_plan_add_items': $('#basic_plan_add_items').text(),
                    'premium_plan_add_items': $('#premium_plan_add_items').text(),
                    'enterprise_plan_add_items': $('#enterprise_plan_add_items').text(),

                    'basic_plan_browse_menu': $('#basic_plan_browse_menu').prop('checked') ? 1 : 0,
                    'premium_plan_browse_menu': $('#premium_plan_browse_menu').prop('checked') ? 1 : 0,
                    'enterprise_plan_browse_menu': $('#enterprise_plan_browse_menu').prop('checked') ? 1 : 0,

                    'basic_plan_call_waiter': $('#basic_plan_call_waiter').prop('checked') ? 1 : 0,
                    'premium_plan_call_waiter': $('#premium_plan_call_waiter').prop('checked') ? 1 : 0,
                    'enterprise_plan_call_waiter': $('#enterprise_plan_call_waiter').prop('checked') ? 1 : 0,

                    'basic_plan_create_dining_experience': $('#basic_plan_create_dining_experience').prop('checked') ?
                        1 : 0,
                    'premium_plan_create_dining_experience': $('#premium_plan_create_dining_experience').prop(
                            'checked') ?
                        1 : 0,
                    'enterprise_plan_create_dining_experience': $('#enterprise_plan_create_dining_experience').prop(
                            'checked') ?
                        1 : 0,

                    'basic_plan_dynamic_pricing': $('#basic_plan_dynamic_pricing').prop('checked') ? 1 : 0,
                    'premium_plan_dynamic_pricing': $('#premium_plan_dynamic_pricing').prop('checked') ? 1 : 0,
                    'enterprise_plan_dynamic_pricing': $('#enterprise_plan_dynamic_pricing').prop('checked') ? 1 : 0,

                    'basic_plan_qr_code_menu': $('#basic_plan_qr_code_menu').prop('checked') ? 1 : 0,
                    'premium_plan_qr_code_menu': $('#premium_plan_qr_code_menu').prop('checked') ? 1 : 0,
                    'enterprise_plan_qr_code_menu': $('#enterprise_plan_qr_code_menu').prop('checked') ? 1 : 0,

                    'basic_plan_quick_search': $('#basic_plan_quick_search').prop('checked') ? 1 : 0,
                    'premium_plan_quick_search': $('#premium_plan_quick_search').prop('checked') ? 1 : 0,
                    'enterprise_plan_quick_search': $('#enterprise_plan_quick_search').prop('checked') ? 1 : 0,

                    'basic_plan_unique_qr_code': $('#basic_plan_unique_qr_code').text(),
                    'premium_plan_unique_qr_code': $('#premium_plan_unique_qr_code').text(),
                    'enterprise_plan_unique_qr_code': $('#enterprise_plan_unique_qr_code').text(),

                    'basic_plan_expand_features': $('#basic_plan_expand_features').prop('checked') ? 1 : 0,
                    'premium_plan_expand_features': $('#premium_plan_expand_features').prop('checked') ? 1 : 0,
                    'enterprise_plan_expand_features': $('#enterprise_plan_expand_features').prop('checked') ? 1 : 0,

                    'basic_plan_custom_domain': $('#basic_plan_custom_domain').prop('checked') ? 1 : 0,
                    'premium_plan_custom_domain': $('#premium_plan_custom_domain').prop('checked') ? 1 : 0,
                    'enterprise_plan_custom_domain': $('#enterprise_plan_custom_domain').prop('checked') ? 1 : 0,

                    'basic_plan_menu_generator': $('#basic_plan_menu_generator').prop('checked') ? 1 : 0,
                    'premium_plan_menu_generator': $('#premium_plan_menu_generator').prop('checked') ? 1 : 0,
                    'enterprise_plan_menu_generator': $('#enterprise_plan_menu_generator').prop('checked') ? 1 : 0,

                    'basic_plan_translation_languages': $('#basic_plan_translation_languages').text(),
                    'premium_plan_translation_languages': $('#premium_plan_translation_languages').text(),
                    'enterprise_plan_translation_languages': $('#enterprise_plan_translation_languages').text(),

                    'basic_plan_allergens': $('#basic_plan_allergens').prop('checked') ? 1 : 0,
                    'premium_plan_allergens': $('#premium_plan_allergens').prop('checked') ? 1 : 0,
                    'enterprise_plan_allergens': $('#enterprise_plan_allergens').prop('checked') ? 1 : 0,

                    'basic_plan_menu_management': $('#basic_plan_menu_management').prop('checked') ? 1 : 0,
                    'premium_plan_menu_management': $('#premium_plan_menu_management').prop('checked') ? 1 : 0,
                    'enterprise_plan_menu_management': $('#enterprise_plan_menu_management').prop('checked') ? 1 : 0,

                    'basic_plan_optional_change': $('#basic_plan_optional_change').prop('checked') ? 1 : 0,
                    'premium_plan_optional_change': $('#premium_plan_optional_change').prop('checked') ? 1 : 0,
                    'enterprise_plan_optional_change': $('#enterprise_plan_optional_change').prop('checked') ? 1 : 0,

                    'basic_plan_multiple_accounts': $('#basic_plan_multiple_accounts').text().replace('Limit to ', ''),
                    'premium_plan_multiple_accounts': $('#premium_plan_multiple_accounts').text().replace('Limit to ',
                        ''),
                    'enterprise_plan_multiple_accounts': $('#enterprise_plan_multiple_accounts').text().replace(
                        'Limit to ',
                        ''),

                    'basic_plan_support_tickets': $('#basic_plan_support_tickets').prop('checked') ? 1 : 0,
                    'premium_plan_support_tickets': $('#premium_plan_support_tickets').prop('checked') ? 1 : 0,
                    'enterprise_plan_support_tickets': $('#enterprise_plan_support_tickets').prop('checked') ? 1 : 0,

                    'basic_plan_priority_support': $('#basic_plan_priority_support').prop('checked') ? 1 : 0,
                    'premium_plan_priority_support': $('#premium_plan_priority_support').prop('checked') ? 1 : 0,
                    'enterprise_plan_priority_support': $('#enterprise_plan_priority_support').prop('checked') ? 1 : 0,

                    'basic_plan_qr_scans': $('#basic_plan_qr_scans').text(),
                    'premium_plan_qr_scans': $('#premium_plan_qr_scans').text(),
                    'enterprise_plan_qr_scans': $('#enterprise_plan_qr_scans').text(),

                    'basic_plan_suitable_business': $('#basic_plan_suitable_business').prop('checked') ? 1 : 0,
                    'premium_plan_suitable_business': $('#premium_plan_suitable_business').prop('checked') ? 1 : 0,
                    'enterprise_plan_suitable_business': $('#enterprise_plan_suitable_business').prop('checked') ? 1 :
                        0,

                    'basic_plan_add_images': $('#basic_plan_add_images').prop('checked') ? 1 : 0,
                    'premium_plan_add_images': $('#premium_plan_add_images').prop('checked') ? 1 : 0,
                    'enterprise_plan_add_images': $('#enterprise_plan_add_images').prop('checked') ? 1 : 0,

                    'basic_plan_add_logo': $('#basic_plan_add_logo').prop('checked') ? 1 : 0,
                    'premium_plan_add_logo': $('#premium_plan_add_logo').prop('checked') ? 1 : 0,
                    'enterprise_plan_add_logo': $('#enterprise_plan_add_logo').prop('checked') ? 1 : 0,

                    'basic_plan_customizable_design': $('#basic_plan_customizable_design').prop('checked') ? 1 : 0,
                    'premium_plan_customizable_design': $('#premium_plan_customizable_design').prop('checked') ? 1 : 0,
                    'enterprise_plan_customizable_design': $('#enterprise_plan_customizable_design').prop('checked') ?
                        1 : 0,

                    'basic_plan_free_themes': $('#basic_plan_free_themes').val(),
                    'premium_plan_free_themes': $('#premium_plan_free_themes').val(),
                    'enterprise_plan_free_themes': $('#enterprise_plan_free_themes').val(),

                    'basic_plan_instants_updates': $('#basic_plan_instants_updates').prop('checked') ? 1 : 0,
                    'premium_plan_instants_updates': $('#premium_plan_instants_updates').prop('checked') ? 1 : 0,
                    'enterprise_plan_instants_updates': $('#enterprise_plan_instants_updates').prop('checked') ? 1 : 0,

                    'basic_plan_personalise_menu': $('#basic_plan_personalise_menu').prop('checked') ? 1 : 0,
                    'premium_plan_personalise_menu': $('#premium_plan_personalise_menu').prop('checked') ? 1 : 0,
                    'enterprise_plan_personalise_menu': $('#enterprise_plan_personalise_menu').prop('checked') ? 1 : 0,

                    'basic_plan_view_from_device': $('#basic_plan_view_from_device').prop('checked') ? 1 : 0,
                    'premium_plan_view_from_device': $('#premium_plan_view_from_device').prop('checked') ? 1 : 0,
                    'enterprise_plan_view_from_device': $('#enterprise_plan_view_from_device').prop('checked') ? 1 : 0,
                }
                return data
            }

            function showToast() {
                let currentDateTime = new Date();
                let timeDifference = (currentDateTime.getTime() - DateTime.getTime()) / 1000;
                DateTime = currentDateTime;

                if (timeDifference < 0.5) {
                    return
                }

                // Create a new toast element
                var toast = document.createElement('div');
                toast.classList.add('toast.rounded');
                toast.setAttribute('role', 'alert');
                toast.setAttribute('aria-live', 'assertive');
                toast.setAttribute('aria-atomic', 'true');

                // Create the toast body
                var toastBody = document.createElement('div');
                toastBody.classList.add('toast-body.m-0.p-0');
                toastBody.innerHTML = `
                <div class="alert alert-success m-0" role="alert">
                    Changed successfully. Please refresh the page!
                </div>
                `;

                // Append the toast body to the toast element
                toast.appendChild(toastBody);

                // Append the toast to the toast container
                document.getElementById('toast-container').appendChild(toast);

                // Create a new bootstrap Toast instance and show it
                var bootstrapToast = new bootstrap.Toast(toast);
                bootstrapToast.show();
            }
        };
    </script>
