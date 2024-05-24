<!--

=========================================================
* Impact Design System - v1.0.0
=========================================================

* Product Page: https://www.creative-tim.com/product/impact-design-system
* Copyright 2010 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/impact-design-system/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-->
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Primary Meta Tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset('argonfront') }}/img/apple-icon.png">
    <link rel="icon" type="image/png" href="{{ asset('argonfront') }}/img/favicon.png">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta property="og:image" content="{{ config('global.site_logo') }}">
    <title>{{ config('global.site_name', 'QRTiger') }}</title>
    {{-- This should be the first script in your <head> --}}
    <script type="text/javascript" src="https://app.getterms.io/cookie-consent/embed/ab91f847-d3c2-4d84-b7bf-89a52ac494a5">
    </script>
    {{-- This should be the first script in your <head> --}}

    <!-- Global site tag (gtag.js) - Google Analytics -->
    @if (config('settings.google_analytics'))
        <script async src="https://www.googletagmanager.com/gtag/js?id=<?php echo config('settings.google_analytics'); ?>"></script>
        <script>
            window.dataLayer = window.dataLayer || [];

            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', '<?php echo config('settings.google_analytics'); ?>');
        </script>
    @endif

    @yield('head')
    @laravelPWA
    @include('layouts.rtl')

    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    @include('partials.aos')

    <!-- Fontawesome -->
    <link type="text/css" href="{{ asset('impactfront') }}/vendor/@fortawesome/fontawesome-free/css/all.min.css"
        rel="stylesheet">


    <!-- Nucleo icons -->
    <link rel="stylesheet" href="{{ asset('impactfront') }}/vendor/nucleo/css/nucleo.css" type="text/css">

    <!-- Front CSS -->
    <link type="text/css" href="{{ asset('impactfront') }}/css/front.min.css" rel="stylesheet">

    <!-- Custom CSS by mobidonia -->
    <link type="text/css" href="{{ asset('custom') }}/css/custom_qr.css" rel="stylesheet">

    <!-- Custom CSS defined by admin -->
    <link type="text/css" href="{{ asset('byadmin') }}/front.css" rel="stylesheet">

    @include('partials.switch')
</head>

<body>

    <header class="header-global">
        @include('qrsaas.partials.nav')
    </header>

    <main>
        @yield('content')

    </main>

    <!-- Footer -->
    @include('qrsaas.partials.footer')

    <!-- Core -->
    <script src="{{ asset('impactfront') }}/vendor/jquery/dist/jquery.min.js"></script>
    <script src="{{ asset('impactfront') }}/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="{{ asset('impactfront') }}/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="{{ asset('impactfront') }}/vendor/headroom.js/dist/headroom.min.js"></script>

    <!-- Vendor JS -->
    <script src="{{ asset('impactfront') }}/vendor/onscreen/dist/on-screen.umd.min.js"></script>
    <script src="{{ asset('impactfront') }}/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="{{ asset('impactfront') }}/vendor/jarallax/dist/jarallax.min.js"></script>
    <script src="{{ asset('impactfront') }}/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- All in one -->
    <script src="{{ asset('custom') }}/js/js.js?id={{ config('config.version') }}"></script>

    <!-- Impact JS -->
    <script src="{{ asset('impactfront') }}/js/front.js"></script>

    <!-- Custom JS defined by admin -->
    <?php echo file_get_contents(base_path('public/byadmin/front.js')); ?>

    <!-- Notify JS -->
    <script src="{{ asset('custom') }}/js/notify.min.js"></script>

    <!-- CKEditor -->
    <script src="{{ asset('ckeditor') }}/ckeditor.js"></script>
    <script>
        var USER_ID = '{{ auth()->user() && auth()->user() ? auth()->user()->id : '' }}';
    </script>




    <script>
        window.onload = function() {

            var ifUser = {!! json_encode(
                auth()->user() &&
                auth()->user() &&
                auth()->user()->hasRole('admin')
                    ? true
                    : false,
            ) !!};

            if (ifUser) {
                initializeCKEditor();

                changeContentEditable(true);

                showEditBtns();

            } else {
                changeContentEditable(false);


            }

            CKEDITOR.on('instanceReady', function(event) {
                var editor = event.editor;

                editor.on('blur', function(e) {

                    var html = editor.getSnapshot()
                    var dom = document.createElement("DIV");
                    dom.innerHTML = html;
                    var plain_text = (dom.textContent || dom.innerText);

                    var APP_URL = {!! json_encode(url('/')) !!}

                    var locale = {!! json_encode(Config::get('app.locale')) !!}

                    changeContent(APP_URL, locale, editor.name, plain_text)
                });
            });

            function showEditBtns() {
                $('.ckedit_btn').each(function(i, obj) {
                    $(this).show();
                });
            }

            function initializeCKEditor() {
                var elements = CKEDITOR.document.find('.ckedit'),
                    i = 0,
                    element;

                while ((element = elements.getItem(i++))) {
                    //CKEDITOR.inline(element);
                    CKEDITOR.inline(element, {
                        removePlugins: 'link, image',
                        removeButtons: 'Bold,Italic,Underline,Strike,Subscript,Superscript,RemoveFormat,Scayt,SpecialChar,About,Styles,Cut,Copy,Undo,Redo,Outdent,Indent,Table,HorizontalRule,NumberedList,BulletedList,Blockquote,Format'
                    });
                }
            }

            $(".ckedit_btn").on('click', function() {
                var next = $(this).next().attr('key');

                var editor = CKEDITOR.instances[next];
                editor.focus();
            });

            function changeContentEditable(bool) {
                $('.ckedit').each(function(i, obj) {
                    $(this).attr("contenteditable", bool);
                });
            }

            function changeContent(APP_URL, locale, key, value) {
                var isDemo = {!! config('settings.is_demo') | config('settings.is_demo') !!};
                if (!isDemo) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });

                    $.ajax({
                        type: 'POST',
                        url: APP_URL + '/admin/languages/' + locale,
                        dataType: 'json',
                        data: {
                            group: "qrlanding",
                            key: key,
                            language: locale,
                            value: value
                        },
                        success: function(response) {
                            if (response) {
                                var msg = {!! json_encode(__('qrlanding.success')) !!}

                                js.notify(msg, "success");
                            }
                        }
                    })

                } else {
                    //ok
                    js.notify("Changing strings not allowed in demo mode.", "warning");
                }



            }


        }
    </script>



    <!-- Partnero Universal -->
    <script>
        (function(p, t, n, e, r, o) {
            p['__partnerObject'] = r;

            function f() {
                var c = {
                    a: arguments,
                    q: []
                };
                var r = this.push(c);
                return "number" != typeof r ? r : f.bind(c.q);
            }
            f.q = f.q || [];
            p[r] = p[r] || f.bind(f.q);
            p[r].q = p[r].q || f.q;
            o = t.createElement(n);
            var _ = t.getElementsByTagName(n)[0];
            o.async = 1;
            o.src = e + '?v' + (~~(new Date().getTime() / 1e6));
            _.parentNode.insertBefore(o, _);
        })(window, document, 'script', 'https://app.partnero.com/js/universal.js', 'po');
        po('settings', 'assets_host', 'https://assets.partnero.com');
        po('program', '77KZHLOB', 'load');
    </script>
    <!-- End Partnero Universal -->

    {{-- Partenero sign up --}}
    <script>
        po('customers',
            'signup', {
                data: {
                    key: 'customer_123456',
                    name: 'John',
                    email: 'john.doe@partnero.com'
                }
            }
        );
    </script>
    {{-- Partenero sign up --}}
</body>

</html>
