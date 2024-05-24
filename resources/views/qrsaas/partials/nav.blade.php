<nav id="navbar-main"
    class="navbar navbar-main navbar-expand-lg headroom py-lg-3 px-lg-6 navbar-light navbar-theme-primary">
    <div class="container-fluid">
        <a class="navbar-brand @@logo_classes" href="/">
            <img class="navbar-brand-dark common" src="{{ config('global.site_logo_dark') }}" height="35" alt="Logo">
            <img class="navbar-brand-light common" src="{{ config('global.site_logo') }}" height="35" alt="Logo">
        </a>
        <div class="navbar-collapse collapse justify-content-center" id="navbar_global">
            <div class="navbar-collapse-header">
                <div class="row">
                    <div class="col-6 collapse-brand">
                        <a href="/">
                            <img src="{{ config('global.site_logo') }}" height="35" alt="Logo">
                        </a>
                    </div>
                    <div class="col-6 collapse-close">
                        <a href="#navbar_global" role="button" class="fas fa-times" data-toggle="collapse"
                            data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false"
                            aria-label="Toggle navigation"></a>
                    </div>
                </div>
            </div>
            <ul class="navbar-nav navbar-nav-hover justify-content-center">
                <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-scroll href="/#product" class="nav-link">{{ __('qrlanding.product') }} </a>
                </li>
                <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-scroll href="{{ route('pricing') }}" class="nav-link">{{ __('qrlanding.pricing') }}</a>
                </li>
                {{-- <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-scroll href="#testimonials" class="nav-link">{{ __('qrlanding.testimonials') }}</a>
                </li> --}}
                <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {{ __('qrlanding.demo') }}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/business/demo1" target="blank">Fast food</a>
                        <a class="dropdown-item" href="/business/demo2" target="blank">Gastronomic Restaurant</a>
                        <a class="dropdown-item" href="/business/demo3" target="blank">Restaurant</a>
                        <a class="dropdown-item" href="/business/demo4" target="blank">Bar</a>
                    </div>
                </li>
                {{-- <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-scroll href="#demo" class="nav-link">{{ __('qrlanding.demo') }}</a>
                </li> --}}
                <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-toggle="modal" data-target="#exampleModal" data-scroll href="#"
                        class="nav-link">{{ __('qrlanding.contact_us') }}</a>
                </li>
                <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-scroll href="https://app.sessions.us/book/41c2ad19-98e9-4dc2-b10d-0f3667bf3d81-bf46f/demo"
                        class="nav-link" target="_blank">Book a call</a>
                </li>
                <li class="nav-item" data-toggle="collapse" data-target=".navbar-collapse.show">
                    <a data-scroll class="nav-link btn" href="https://emenusolutionscom.partneroapp.com/program"
                        target="_blank">Become
                        an affiliate
                    </a>
                </li>

                {{-- <li class="nav-item dropdown">
                    <a class="nav-link" href="#">
                        <span>English</span>
                        <i class="fas fa-angle-down nav-link-arrow ml-2"></i>
                    </a>
                    <ul class="dropdown-menu">

                        <li>
                            <a class="dropdown-item" href="#">
                                Demo 1</a>
                        </li>

                    </ul>
                </li> --}}

                @if (!empty(config('global.facebook')))
                    <li class="nav-item">
                        <a class="nav-link nav-link-icon" href="{{ config('global.facebook') }}" target="_blank"
                            data-toggle="tooltip" title="{{ __('Like us on Facebook') }}">
                            <i class="fab fa-facebook-square mr-2"></i>
                            <span class="nav-link-inner--text d-lg-none">{{ __('Facebook') }}</span>
                        </a>
                    </li>
                @endif
                @if (!empty(config('global.instagram')))
                    <li class="nav-item">
                        <a class="nav-link nav-link-icon" href="{{ config('global.instagram') }}" target="_blank"
                            data-toggle="tooltip" title="{{ __('Follow us on Instagram') }}">
                            <i class="fab fa-instagram mr-2"></i>
                            <span class="nav-link-inner--text d-lg-none">{{ __('Instagram') }}</span>
                        </a>
                    </li>
                @endif
            </ul>
        </div>
        <div class=" @@cta_button_classes">
            <a data-scroll href="{{ route('login') }}" class="btn btn-md btn-docs btn-white animate-up-2 mr-3"><i
                    class="fas fa-th-large mr-2"></i>
                @auth()
                    {{ __('qrlanding.dashboard') }}
                @endauth
                @guest()
                    {{ __('qrlanding.login') }}
                @endguest
            </a>
            @guest()
                <a href="{{ route('newrestaurant.register',['plan'=>1]) }}" target="_blank"
                    class="btn btn-md btn-secondary animate-up-2"><i
                        class="fas fa-paper-plane mr-2"></i>{{ __('qrlanding.sign_up') }}</a>
            @endguest

        </div>
        <div class="d-flex d-lg-none align-items-center">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global"
                aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
        </div>
    </div>
</nav>

@include('email_contact_form_popup')


<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
