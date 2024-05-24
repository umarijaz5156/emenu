
     {{-- This code should back/uncommented --}}
     
     <!--BonBoarding-->
     {{-- <script data-bb-key="pvher7o08b" src="https://go.bonboarding.com/"></script>
     @if(auth()->user())
        <script type="text/javascript">
            Bonboarding.identify({
                uniqueID: "{{auth()->user()->id}}",
                firstName: "{{auth()->user()->name}}",
                email: "{{auth()->user()->email}}",
                signUpDate: "{{auth()->user()->created_at}}",
            });
        </script>
    @endif --}}
