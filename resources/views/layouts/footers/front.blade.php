<footer class="footer notranslate">
    {{-- <div class="row-above-footer">
        <div class="packer">
            <div class="badge-container-row d-flex justify-content-center flex-wrap">
                <div class="badge-container mx-3" style="margin-top: 20px">
                    <div class="badge-title">Rewards:</div>
                </div>

                @for ($i = 1; $i <= 5; $i++)
                    @if (isset($restorant->{'badge_' . $i}))
                        <div class="badge-container mx-3">
                            <img src="{{ asset('storage/' . $restorant->{'badge_' . $i}) }}"
                                alt="Reward Badge {{ $i }}" class="img-fluid"
                                style="width: 50px; height: 50px;" />
                        </div>
                    @endif
                @endfor

            </div>
        </div>
    </div> --}}
    <br />
    <div class="container">
        <div class="row align-items-center justify-content-md-between">
            <div class="col-md-6">
                <div class="copyright">
                    <a href="" target="_blank">@include('partials.logo')</a>. &copy; {{ date('Y') }} <a
                        href="" target="_blank">{{ config('global.site_name', 'mResto') }}</a>.
                </div>
            </div>
            <div class="col-md-6">
                <ul id="footer-pages" class="nav nav-footer justify-content-end">
                    <li v-for="page in pages" class="nav-item" v-cloak>
                        <!--<a :href="'/pages/' + page.id" class="nav-link">@{{ page.title }}</a> -->
                        <a :href="page.link" class="nav-link">@{{ page.title }}</a>
                    </li>

                    {{-- @if (!config('settings.single_mode') && config('settings.restaurant_link_register_position') == 'footer')
                        <li class="nav-item">
                            <a target="_blank" class="button nav-link nav-link-icon"
                                href="{{ route('newrestaurant.register') }}">{{ __(config('settings.restaurant_link_register_title')) }}</a>
                        </li>
                    @endif --}}
                    @if (config('app.isft') && config('settings.driver_link_register_position') == 'footer')
                        <li class="nav-item">
                            <a target="_blank" class="button nav-link nav-link-icon"
                                href="{{ route('driver.register') }}">{{ __(config('settings.driver_link_register_title')) }}</a>
                        </li>
                    @endif

                </ul>
            </div>
        </div>
    </div>
</footer>
