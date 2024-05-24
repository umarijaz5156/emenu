<!-- section-place-content -->
<section class='section section-place-content bg-gray-100  '>
    <div class='packer w-full  md:px-20'>
        <div class='package '>
            @if(!$restorant->getConfig('disable_ordering', false))

                <div id="theCartBottomButton" onClick="openNav()" class=" close-mobile-menu circle callOutShoppingButtonBottom icon icon-shape bg-gradient-red text-white rounded-circle shadow mb-4" style=" background: linear-gradient(87deg, #ffffff 0, #ffffff 100%) !important;">
                    <lottie-player src="https://assets10.lottiefiles.com/packages/lf20_atunf5kv.json"  background="transparent"  speed="0.5"  style="width: 50px; height:50px;" loop autoplay></lottie-player>
                </div>

            @endif
            <div class='content'>

                <!-- tab menu -->
                <div id='place-menu' class='holder-left {{  !$canDoOrdering ? "fullHolder" : ""  }} content-tab expanded'>
                    <div class='content-left w-35'>

                        <div class='categories px-4 md-px-0'>
                            <div class=' text-lg  text-slate-700 font-bold mb-4'>{{__('Categories')}}</div>
                            <nav>
                               @php
$user = App\User::where('restaurant_id', $restorant->id)->first();
$rest = App\Restorant::where('id', $restorant->id)->first();
$plan = App\Plans::find($user->plan_id);
$config = App\Models\Config::where('model_id', $restorant->id)->first();
$perviousPlans = isset($plan) ? json_decode($plan->getConfig('plugins', '[]'), false) : [];
$rests = isset($rest) ? json_decode($rest->getConfig('allergens_enable', '[]'), false) : [];
                               @endphp


                            @foreach ($restorant->categories as $key => $category)
                                @if(!$category->items->isEmpty())
                                    <div class='item'>

                                        <a href='#subsection-<?php        echo $category->id; ?>'
                                        class="font-light leading-6 text-left text-black"
                                        style="list-style: outside none none;"
                                        >{{ $category->name}}</a>
                                        <hr class="h-px my-2 bg-gray-200 border-0 dark:bg-gray-200">
                                    </div>
                                @endif
                            @endforeach


                            </nav>

   <!-- allergens legend -->

       @if(isset($perviousPlans[0]) && $perviousPlans[0] == 'allergenss')
       @if($rests == 'true')
@if(!$restorant->categories->isEmpty())
    <br /><br />
    <div class='categories_title'>{{__('Allergens')}}</div>

    @foreach ($restorant->categories as $key => $category)
        @if(!$category->items->isEmpty())
            <nav>
                @php
                    $displayedTitles = [];
                @endphp
                @foreach ($category->items as $item)
                    @foreach ($item->allergens as $allergen)
                        @if (!in_array($allergen->title, $displayedTitles))
                            <div class='item'>
                                <div class='allergen'>
                                    <img src="{{$allergen->image_link}}" />
                                </div>
                                {{ $allergen->title }}
                            </div>
                            @php
                                $displayedTitles[] = $allergen->title;
                            @endphp
                        @endif
                    @endforeach
                @endforeach
            </nav>
        @endif
    @endforeach
@endif
<!-- allergens legend -->

 @endif
@endif
                        </div>







                    </div>
                    <div class='content-center -mt-10'>




                        @if(!$restorant->categories->isEmpty())
                            @foreach ($restorant->categories as $key => $category)
                                <h1 id='subsection-<?php        echo $category->id; ?>' class="mt-10 text-lg ml-6 text-slate-700 font-bold">{{ $category->name }}</h1>
                                <div class="grid grid-cols-1 xl:grid-cols-2 gap-6 p-6 flex flex-grow">
                                    @foreach ($category->aitems as $item)
                                    <a href='javascript:;' onClick="setCurrentItem({{ $item->id }})"
                                        class="grid relative gap-2 justify-between items-center p-4 m-0 align-baseline bg-white p-3 shadow-lg hover:shadow-xl rounded-lg replace-row"
                                        style="text-decoration: none; transition: all 0.3s ease-in-out 0s; outline: none; ">
                                        <div class="p-0 m-0 w-full align-baseline border-0 reverse-row">
                                            <h2 class="text-slate-700 font-bold">{{ $item->name }}</h2>
                                            <p class="mt-1 text-sm text-slate-400">{{ $item->short_description }}</p>
                                             @if ($restorant->show_price == 0 || $item->price == 0)
                                    @else
                                            @if ($item->discounted_price > 0)
                                                <span style="text-decoration: line-through;" class="mt-1 text-sm text-slate-500 font-bold">@money($item->discounted_price, config('settings.cashier_currency'),config('settings.do_convertion'))</span>
                                            @endif
                                                <span class="mt-1 text-sm text-slate-500 font-bold">@money($item->price, config('settings.cashier_currency'),config('settings.do_convertion'))</span>
                                                @if($item->happyHoursNow()->count() || ($item->category->restorant->getCurrentHappyHoursPercent() && $item->getRawOriginal('discounted_price') <= 0))
                                                    <div
                                                        class="relative select-none items-center whitespace-nowrap rounded-lg bg-green-500 py-1.5 px-3 font-sans text-xs font-bold uppercase text-white">
                                                        <span class="">{{ __("Happy Hours discount") }}</span>
                                                    </div>
                                            @endif
                                      @if(isset($perviousPlans[0]) && $perviousPlans[0] == 'allergenss')
                                         @if($rests == 'true')
                                               <div class="allergens">
                                                               @foreach ($item->allergens as $allergen)
                                                                <div class='allergen' data-toggle="tooltip" data-placement="bottom" title="{{$allergen->title}}" >
                                                                    <img  src="{{$allergen->image_link}}" />
                                                                </div>
                                                               @endforeach

                                                           </div>
                                         @endif
                                      @endif
                                   @endif
                                        </div>
                                        @if (strlen($item->logom) > 5)
                                        <picture class="block overflow-hidden relative right-0 m-0 w-24 rounded-lg border border-solid border-zinc-100"
                                            style='max-height: 100px; min-width: 100px; content: ""; padding-bottom: 96%;'>
                                            <source srcset="{{$item->logom }}" media="(min-width: 569px)" class="text-neutral-700" />
                                            <img loading="lazy" src="{{ $item->logom }}"
                                                class="block object-cover absolute p-0 m-0 w-full max-w-full h-full align-middle border-0 border-none" />
                                        </picture>

                                        @endif
                                        @if (isset($plugins) && in_array('allergens', $plugins))
                                            <div class="allergens">
                                                @foreach ($item->allergens as $allergen)
                                                    <div class='allergen' data-toggle="tooltip"
                                                         data-placement="bottom"
                                                         title="{{$allergen->title}}">
                                                        <img src="{{$allergen->image_link}}"/>
                                                    </div>
                                                @endforeach
                                            </div>
                                        @endif

                                    </a>


                                    @endforeach
                               </div>
                            @endforeach
                        @endif





                    </div>
                </div>
                <style>
                    .replace-row{
                        grid-template-rows: 1fr;
                        grid-template-columns: minmax(100px, 1fr) 100px;
                    }

                    @media (max-width: 350px) {
                        .replace-row{
                            grid-template-rows: 1fr 1fr;
                            grid-template-columns:1fr;
                        }
                        .replace-row .reverse-row{
                            order: 9999;
                        }
                        .replace-row picture{
                            width: 100%;
                        }
                    }

                </style>

                <!-- tab info -->
                <div id='place-info' class='holder-left {{  !$canDoOrdering ? "fullHolder" : ""  }} content-tab'>
                    <div class='full-width'>
                        <div class='box-infos bg-white p-3 shadow-lg hover:shadow-xl rounded-lg mr-10'>
                            <div class='head'>
                                <h3><i class="las la-map-marker"></i>{{ __('Address') }}</h3>
                                <div class='info'>
                                    <p><strong>{{ $restorant->address }} {{$restorant->city}} {{$restorant->zipcode}} </strong>  
                                        
                                        Open with <a class="mb-sm-3 mb-md-0" id="tabs-icons-text-1-tab"
                            href="https://maps.google.com/maps?saddr=&amp;daddr={{ $restorant->address }} {{ $restorant->city }} {{ $restorant->zipcode }}"
                                target="_blank">
                            {{ __('Google Map') }}
                                    </a>

                                    </p>
                                    <p>{{ $restorant->phone }}</p>
                                </div>
                            </div>
                            <div class='content'>
                                <div>
                                    <div class='schedule'>
                                        <h4 class="mt-4 font-bold">{{ __('Working Hours') }}</h4>
                                        <ol class='items'>
                                            @foreach ($wh as $day=>$hours)
                                                <li>
                                                    @if ($day==$currentDay)
                                                        <div class='day'>{{ __(ucfirst($day))}}
                                                            <span class='tag'>
                                                                {{ __('Today') }}
                                                            </span>
                                                        </div>
                                                    @else
                                                        <div class='day'>{{ __(ucfirst($day))}} </div>
                                                    @endif
                                                    @foreach ($hours as $timeRange)
                                                        <div class='hours'>{{ $timeRange->start() }} - {{ $timeRange->end() }} </div>
                                                    @endforeach

                                                </li>
                                            @endforeach

                                        </ol>

                                    </div>
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                @if ($canDoOrdering)
                    <div class='holder-right' style="width:400px">
                        <!-- New cart -->
                            @include('glow::templates.side_cart',['id'=>'cartList','idtotal'=>'totalPrices'])
                        <!-- End New cart -->
                    </div>
                @endif

            </div>
        </div>
    </div>




</section>
