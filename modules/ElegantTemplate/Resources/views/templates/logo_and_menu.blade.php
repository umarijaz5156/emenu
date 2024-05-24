  <!-- header -->
  <section id='header' class='header section-header'>

      <div class='packer'>
          <div class='package'>

              <div class='left theProjectLogo desLogo'>

              </div>


              <div class='right'>
                    @yield('addiitional_button_1')
                    @yield('addiitional_button_2')
                  <nav>

                    <!-- Buttons -->
                    @isset($restorant)
                        @if(config('app.isqrsaas'))
                            @if(config('settings.enable_guest_log'))
                                @if ($restorant->getConfig('clients_enable') == "true")
                                    <a href='{{ route('register.visit',['restaurant_id'=>$restorant->id])}}' class='toggle-pre-wrapper'>{{ __('Register visit') }}</a>
                                @endif
                            @endif

                            @if(!config('settings.is_whatsapp_ordering_mode') && !$restorant->getConfig('disable_callwaiter', 0) && strlen(config('broadcasting.connections.pusher.app_id')) > 2 && strlen(config('broadcasting.connections.pusher.key')) > 2 && strlen(config('broadcasting.connections.pusher.secret')) > 2)
                                <a data-toggle="modal" class='btn btn-neutral dropdown-toggle' data-target="#modal-form" href='javascript:;' class='featured'>{{ __('Call Waiter') }}</a>
                            @endif
                            @if(isset($hasGuestOrders)&&$hasGuestOrders)
                                <a href='{{ route('guest.orders')}}' class='featured'>{{ __('My Orders') }}</a>
                            @endif
                        @endif

                        <!--- Languaages -->
                        @if (isset($showGoogleTranslate)&&$showGoogleTranslate&&!$showLanguagesSelector)
                            @include('googletranslate::buttons')
                        @endif
                        @if ($showLanguagesSelector)
                            <div class='dropdown'>
                                <a class='btn btn-neutral dropdown-toggle' href='javascript:;'>{{ $currentLanguage }}</a>
                                <div class='dropdown-menu'>
                                    <div class='dropdown-menu-title'><strong>{{ __('Select Language') }}</strong></div>
                                    @foreach ($restorant->localmenus()->get() as $language)
                                            @if ($language->language!=config('app.locale'))
                                                <a href='?lang={{ $language->language }}'>{{$language->languageName}}</a>
                                            @endif
                                    @endforeach
                                </div>
                            </div>
                        @endif
                        <!-- End Languages -->
                    <link href="/argonfront/css/argon-design-system.min.css?v=1.4.0" rel="stylesheet">
                    @endisset
                    <!--- End buttons -->





                    <!-- <a href='javascript:;' class='featured'>Login/Sign up</a> -->
                    @if(config('app.isft'))

                        @auth()
                            <a href='/home' class='featured'>{{ __('Dashboard') }}</a>
                        @endauth
                        @guest()
                            <a href='{{ route('auth.login') }}' class='featured'>{{ __('Login') }}</a>
                        @endguest
                    @endif


                  </nav>
              </div>

              <div class='related-mobile-menu'>
                  <a href="javascript:;" class='show-mobile-menu'><i class="las la-bars"></i></a>
              </div>
          </div>
      </div>
  </section>
