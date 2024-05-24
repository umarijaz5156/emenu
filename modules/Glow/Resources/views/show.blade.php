<!DOCTYPE html>
<html>
@include('glow::templates.head')

<body>
    <?php
    function clean($string)
    {
        $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.
    
        return preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
    }
    ?>
    @include('glow::templates.mobile-menu')
    <div id='wrapper'>
        @include('glow::templates.header')
        @include('restorants.partials.modals')
        @include('glow::templates.call_waiter')
        @include('glow::templates.links')
        @include('glow::templates.place-content')
        @if (isset($doWeHaveImpressumApp) && $doWeHaveImpressumApp && strlen($restorant->getConfig('impressum_value', '')) > 5)
            @include('glow::templates.impressum')
        @endif
        @include('glow::templates.footer')

    </div>


    @include('glow::templates.scripts')


</body>

</html>
