@if(!config('settings.hide_project_branding')||(!isset($restorant)))
    <a class="navbar-brand mr-lg-5" href="/">
        <img class="theProjectLogo" src="{{ config('global.site_logo') }}">
    </a>
@else
    <a class="navbar-brand mr-lg-5" id="topLightLogo" href="#">
        <img class="theProjectLogo" src="{{$restorant->logowide }}">
    </a>
    <a class="navbar-brand mr-lg-5" id="topDarkLogo" style="display: none" href="#">
        <img class="theProjectLogo" src="{{$restorant->logowidedark }}">
    </a>
@endif
