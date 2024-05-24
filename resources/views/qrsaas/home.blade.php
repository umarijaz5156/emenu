@extends('qrsaas.master')

@section('content')
    <!-- Loader -->
    <div class="preloader bg-soft flex-column justify-content-center align-items-center">
        <div class="loader-element">
            <span class="loader-animated-dot"></span>
            <img src="{{ config('global.site_logo') }}" height="40" alt="logo">
        </div>
    </div>

    <!-- Hero 1 -->
    @include('qrsaas.partials.hero')

    <!-- Product -->
    @include('qrsaas.partials.product')

    {{-- Audience video --}}
    @include('qrsaas.partials.audience_video')

    <!-- Testimonials -->
    @include('qrsaas.partials.testimonials')

    <!-- Featured clients -->
    @if (in_array('feautureclients', config('global.modules', [])))
        @include('feautureclients::qrsaas')
    @endif

    <!-- DEMO -->
    @include('qrsaas.partials.demo')
@endsection


<script>
    window.embeddedChatbotConfig = {
        chatbotId: "j7ZzxNFyeJeZdRGm9OSZa",
        domain: "www.chatbase.co"
    }
</script>
<script src="https://www.chatbase.co/embed.min.js" chatbotId="j7ZzxNFyeJeZdRGm9OSZa" domain="www.chatbase.co" defer>
</script>
