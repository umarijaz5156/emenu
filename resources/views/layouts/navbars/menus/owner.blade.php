<ul class="navbar-nav">
    @if (config('settings.makePureSaaS', false))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('home') }}">
                <i class="ni ni-tv-2 text-primary"></i> {{ __('Dashboard') }}
            </a>
        </li>
    @endif
    @if (config('app.ordering') && !config('settings.makePureSaaS', false))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('home') }}">
                <i class="ni ni-tv-2 text-primary"></i> {{ __('Dashboard') }}
            </a>
        </li>
        @if (!config('app.issd'))
            <li class="nav-item">
                <a class="nav-link" href="/live">
                    <i class="ni ni-basket text-success"></i> {{ __('Live Orders') }}<div class="blob red"></div>
                </a>
            </li>
        @endif

        @if (!config('app.issd'))
            <li class="nav-item">
                <a class="nav-link" href="{{ route('orders.index') }}">
                    <i class="ni ni-basket text-orangse"></i> {{ __('Orders') }}
                </a>
            </li>
        @endif
    @endif

    <li class="nav-item">
        <a class="nav-link" href="{{ route('admin.restaurants.edit', auth()->user()->restorant->id) }}">
            <i class="ni ni-shop text-info"></i> {{ __('Restaurant') }}
        </a>
    </li>
    @if (!config('app.issd') && !config('settings.makePureSaaS', false))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('items.index') }}">
                <i class="ni ni-collection text-pink"></i> {{ __('Menu') }}
            </a>
        </li>
    @endif
    <li class="nav-item">
        <a class="nav-link" href="{{ route('dynamic-price.index') }}">
            <i class="ni ni-collection text-pink"></i> {{ __('Dynamic Price') }}
        </a>
    </li>
    @if (config('app.isft'))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('clientss.index') }}">
                <i class="ni ni-single-02 text-blue"></i> {{ __('Clients') }}
            </a>
        </li>
    @endif

    @if (!config('settings.makePureSaaS', false))
        @if (config('app.isqrsaas') && (!config('settings.qrsaas_disable_odering') || config('settings.enable_guest_log')))
            @if (
                !config('settings.is_whatsapp_ordering_mode') ||
                    in_array('poscloud', config('global.modules', [])) ||
                    in_array('deliveryqr', config('global.modules', [])))
                @if (!config('app.isag') && !config('app.issd'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('admin.restaurant.tables.index') }}">
                            <i class="ni ni-ungroup text-red"></i> {{ __('Tables') }}
                        </a>
                    </li>
                @endif
            @endif
        @elseif (config('app.isft') && in_array('poscloud', config('global.modules', [])))
            <li class="nav-item">
                <a class="nav-link" href="{{ route('admin.restaurant.tables.index') }}">
                    <i class="ni ni-ungroup text-red"></i> {{ __('Tables') }}
                </a>
            </li>
        @endif
    @endif


    <!-- Exrta menus -->
    <?php 
        $permission = 
                        [
                            'Delivery areas' => 'deliveryaeras_enable',
                            'Drivers' => 'drivers_enable',
                            'Expenses' => 'expenses_enable',
                            'KDS' => 'kds_enable',
                            'Staff' => 'staff_enable',
                        ];
     ?>

     

    @foreach (auth()->user()->getExtraMenus() as $menu)
        @if (isset($menu['isGroup']) && $menu['isGroup'])
            
            @if(isset($permission[$menu['name']]))
                @if(auth()->user()->restorant)
                    @if (auth()->user()->restorant->getConfig($permission[$menu['name']]) == "true")
                        <a class="nav-link" href="#navbar-{{ $menu['id'] }}" data-toggle="collapse" role="button"
                            aria-expanded="false" aria-controls="navbar-{{ $menu['id'] }}">
                            <i class="ni ni-single-copy-04 text-primary"></i>
                            <span class="nav-link-text">{{ __($menu['name']) }}</span>
                        </a>
                        <div class="collapse" id="navbar-{{ $menu['id'] }}" style="">
                            <ul class="nav nav-sm flex-column">
                                @foreach ($menu['menus'] as $submenu)
                                    <li class="nav-item">
                                        <a class="nav-link"
                                            href="{{ route($submenu['route'], isset($submenu['params']) ? $submenu['params'] : []) }}">
                                            <i class="{{ $submenu['icon'] }}"></i> {{ __($submenu['name']) }}
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                @endif
            @endif
            
        @else
            @if(isset($permission[$menu['name']]))
                @if(auth()->user()->restorant)
                    @if (auth()->user()->restorant->getConfig($permission[$menu['name']]) == "true")
                        <li class="nav-item">
                            @if($menu['route'] == 'clients.index')
                                <a class="nav-link" href="{{ route('clientss.index', isset($menu['params']) ? $menu['params'] : []) }}">
                                    <i class="{{ $menu['icon'] }}"></i> {{ __($menu['name']) }}
                                </a>
                            @else
                                <a class="nav-link" href="{{ route($menu['route'], isset($menu['params']) ? $menu['params'] : []) }}">
                                    <i class="{{ $menu['icon'] }}"></i> {{ __($menu['name']) }}
                                </a>
                            @endif
                        </li>
                    @endif
                @endif
            @endif

        @endif
    @endforeach


    @if (config('app.isqrexact') && !config('settings.makePureSaaS', false))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('qr') }}">
                <i class="ni ni-mobile-button text-red"></i> {{ __('QR Builder') }}
            </a>
        </li>
        @if (config('settings.enable_guest_log'))
            <li class="nav-item">
                <a class="nav-link" href="{{ route('admin.restaurant.visits.index') }}">
                    <i class="ni ni-calendar-grid-58 text-blue"></i> {{ __('Customers log') }}
                </a>
            </li>
        @endif
    @endif

    @if (config('settings.is_agris_mode') ||
            config('settings.is_whatsapp_ordering_mode') ||
            in_array('poscloud', config('global.modules', [])))
        @if (!in_array('deliveryqr', config('global.modules', [])))
            <li class="nav-item">
                <a class="nav-link" href="{{ route('admin.restaurant.simpledelivery.index') }}">
                    <i class="ni ni-pin-3 text-blue"></i> {{ __('Delivery areas') }}
                </a>
            </li>
        @endif
    @endif

    @if (config('settings.enable_pricing'))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('plans.current') }}">
                <i class="ni ni-credit-card text-orange"></i> {{ __('Plan') }}
            </a>
        </li>
    @endif

    @if (config('app.ordering') && config('settings.enable_finances_owner'))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('finances.owner') }}">
                <i class="ni ni-money-coins text-blue"></i> {{ __('Finances') }}
            </a>
        </li>
    @endif

        <li class="nav-item">
            <a class="nav-link" href="{{ route('admin.restaurant.happyHours.show') }}">
                <i class="ni ni-time-alarm mr-2 text-orange"></i> {{ __('Happy hours') }}
            </a>
        </li>



    @if (!config('settings.is_pos_cloud_mode') && !config('app.issd'))
        <li class="nav-item">
            <a class="nav-link" href="{{ route('share.menu') }}">
                <i class="ni ni-send text-green"></i> {{ __('Share') }}
            </a>
        </li>
    @endif


</ul>
@if (config('vendorlinks.enable', false))
    <hr class="my-3">
    <h6 class="navbar-heading p-0 text-muted">
        <span class="docs-normal">{{ __(config('vendorlinks.name', '')) }}</span>
    </h6>
    <ul class="navbar-nav mb-md-3">
        @if (strlen(config('vendorlinks.link1link', '')) > 4)
            {{-- Email Button --}}
            <li class="nav-item">
                {{-- <a class="nav-link" href="{{config('vendorlinks.link1link',"")}}" target="_blank"> --}}
                <a class="nav-link" href="#" id="email_button" target="_blank" data-toggle="modal"
                    data-target="#exampleModal" data-whatever="@mdo">
                    {{-- <a class="nav-link" id="email_button"> --}}
                    <span class="nav-link-text">
                        {{ __(config('vendorlinks.link1name', '')) }}
                    </span>
                </a>
            </li>
        @endif




        @if (strlen(config('vendorlinks.link2link', '')) > 4)
            <li class="nav-item">
                <a class="nav-link" href="{{ config('vendorlinks.link2link', '') }}" target="_blank">
                    <span class="nav-link-text">{{ __(config('vendorlinks.link2name', '')) }}</span>
                </a>
            </li>
        @endif

        <li class="nav-item">
            <a class="nav-link" href="{{ route('documentation') }}" target="_blank">
                <span class="nav-link-text">Documentation</span>
            </a>
        </li>

        @if (strlen(config('vendorlinks.link3link', '')) > 4)
            <li class="nav-item">
                <a class="nav-link" href="{{ config('vendorlinks.link3link', '') }}" target="_blank">
                    <span class="nav-link-text">{{ __(config('vendorlinks.link3name', '')) }}</span>
                </a>
            </li>
        @endif

    </ul>
@endif


<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {
        $('#email_button').click(function() {
            $('#exampleModal').show();
        });
    });
</script>
