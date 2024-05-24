<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<footer class="footer section pt-6 pt-md-8 pt-lg-10 pb-3 bg-primary text-white overflow-hidden">
    <div class="pattern pattern-soft top"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 mb-lg-0">
                <a href="#" class="icon icon-lg text-white mr-3 ">
                    <h3>{{ config('app.name') }}</h3>
                </a>

                <p class="my-4">{{ __('qrlanding.hero_title') }}<br />{{ __('qrlanding.hero_subtitle') }}</p>

            </div>
            <div class="col-4 col-sm-3 col-md-2 col-lg-3 mb-4 mb-lg-0">
                <h4>{{ __('qrlanding.menu') }}</h4>
                <ul class="links-vertical">
                    {{-- @foreach ($pages as $page)
                        <li><a target="_blank" href="/blog/{{ $page->slug }}">{{ $page->title }}</a></li>
                    @endforeach --}}
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="#product" class="nav-link">{{ __('qrlanding.product') }} </a>
                    </li>
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="{{ route('pricing') }}" class="nav-link">{{ __('qrlanding.price') }} </a>
                    </li>
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="#testimonials" class="nav-link">{{ __('qrlanding.testimonials') }} </a>
                    </li>
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="#demo" class="nav-link">{{ __('qrlanding.demo') }} </a>
                    </li>
                </ul>
            </div>

            <div class="col-4 col-sm-3 col-md-2 col-lg-3 mb-4 mb-lg-0">
                <h4>{{ __('qrlanding.company') }}</h4>
                <ul class="links-vertical">
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="/pages/1" class="nav-link">{{ __('qrlanding.term_of_use') }} </a>
                    </li>
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="/pages/2" class="nav-link">{{ __('qrlanding.privacy_policy') }}
                        </a>
                    </li>
                    <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="#contact_us" class="nav-link">{{ __('qrlanding.contact_us') }} </a>
                    </li>
                    {{-- <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                        <a data-scroll href="{{ route('documentation') }}" class="nav-link">Documentation </a>
                    </li> --}}
                </ul>
            </div>

            <div class="col-4 col-sm-3 col-md-2 col-lg-3 mb-4 mb-lg-0">
                <h4>{{ __('qrlanding.my_account') }}</h4>
                <ul class="links-vertical">
                    <li><a target="_blank" href="/login">

                            @auth()
                                {{ __('qrlanding.dashboard') }}
                            @endauth
                            @guest()
                                {{ __('qrlanding.login') }}
                            @endguest

                        </a></li>
                    @guest()
                        <li><a target="_blank"
                                href="{{ route('newrestaurant.register') }}">{{ __('qrlanding.register') }}</a></li>
                    @endguest
                </ul>
            </div>

            <div class="col-12 col-sm-6 col-lg-3 col-md-3">
                @guest()
                    <h4>{{ __('qrlanding.register') }}</h4>
                    <form action="{{ route('newrestaurant.register') }}" class="d-flex flex-column mb-5 mb-lg-0">
                        <input class="form-control" type="text" name="name"
                            placeholder="{{ __('qrlanding.hero_input_name') }}" required>
                        <input class="form-control my-3" type="email" name="email"
                            placeholder="{{ __('qrlanding.hero_input_email') }}" required>
                        <input class="form-control my-1" type="text" name="phone"
                            placeholder="{{ __('qrlanding.hero_input_phone') }}" required>
                        <button class="btn btn-danger my-3" type="submit">{{ __('qrlanding.join_now') }}</button>
                    </form>
                @endguest
            </div>
        </div>

        <div class="row mt-md-5 mt-sm-0">
            <div class="mx-2">
                <b class="lead">Follow us:</b>
                <a class="mx-2 lead" href="https://www.facebook.com/emenusolutions1" target="_blank"><i
                        class="fa-brands fa-square-facebook"></i></a>
                <a class="mx-2 lead" href="https://www.instagram.com/emenusolutions_" target="_blank"><i
                        class="fa-brands fa-instagram"></i></a>
                <a class="mx-2 lead" href="https://www.twitter.com/emenusolutions" target="_blank"><i
                        class="fa-brands fa-square-twitter"></i></a>
                <a class="mx-2 lead" href="https://www.pinterest.com/emenusolutions" target="_blank"><i
                        class="fa-brands fa-square-pinterest"></i></a>
                <a class="mx-2 lead" href="https://www.youtube.com/@emenusolutions" target="_blank"><i
                        class="fa-brands fa-youtube"></i></a>
                <a class="mx-2 lead" href="https://www.linkedin.com/company/emenusolutions" target="_blank"><i
                        class="fa-brands fa-linkedin"></i></a>
                <a class="mx-2 lead" href="https://www.quora.com/profile/EmenuSolutions" target="_blank"><i
                        class="fa-brands fa-quora"></i></i></a>
            </div>
        </div>

        @if (config('settings.enable_default_cookie_consent'))
            @include('cookieConsent::index')
        @endif
        <hr class="my-2">
        <div class="row">
            <div class="col pb-4 mb-md-0">
                <div class="d-flex text-center justify-content-center align-items-center">
                    <p class="font-weight-normal mb-0">© <a href="{{ config('app.url') }}"
                            target="_blank">{{ config('app.name') }}</a>
                        <span class="current-year">{{ date('Y') }}</span>. {{ __('All rights reserved') }}.
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
