<style>
    .row-above-footer {
        border-bottom: 1px solid #000; /* Change color and style as needed */
        padding-bottom: 10px; /* Adjust spacing as needed */
    }
</style>

<div class="row-above-footer">
    <div class="packer">
        <div class="badge-container-row d-flex justify-content-center flex-wrap">
            <div class="badge-container mx-3" style="margin-top: 20px">
                <div class="badge-title">Rewards:</div>
            </div>

            @for ($i = 1; $i <= 5; $i++)
                @if (isset($restorant->{'badge_'.$i}))
                    <div class="badge-container mx-3">
                        <img src="{{ asset('storage/' . $restorant->{'badge_'.$i}) }}" alt="Reward Badge {{ $i }}" class="img-fluid" style="width: 50px; height: 50px;"/>
                    </div>
                @endif
            @endfor

        </div>
    </div>
</div>







<!-- footer-->
<div id='footer'>
    <div class='packer'>
        <ul id="footer-pages" class="nav nav-footer justify-content-end">
            <li v-for="page in pages" class="nav-item" v-cloak>
                <a :href="'/pages/' + page.id" class="nav-link">@{{ page.title }}</a>
            </li>
        </ul>
    </div>
    <div class='copyright'>
        <div class='packer'>
            <div class='package'> <a href="" target="_blank">@include("partials.logo")</a> &copy; {{ date('Y') }} <a href="" target="_blank">{{ config('global.site_name', 'mResto') }}</a>.</div>
        </div>
    </div>
</div>
