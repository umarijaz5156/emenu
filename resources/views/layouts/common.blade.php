<link rel="stylesheet" href="{{ asset('vendor') }}/intltelinput/build/css/intlTelInput.css">
<style type="text/css">
    .iti__flag {background-image: url("/vendor/intltelinput/build/img/flags.png");}

@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
  .iti__flag {background-image: url("/vendor/intltelinput/build/img/flags@2x.png");}
}
</style>

<script src="{{ asset('vendor') }}/intltelinput/build/js/intlTelInput.js"></script>
<script src="{{ asset('vendor') }}/intltelinput/build/js/utils.js"></script>
<style>
    .phoneOk{
        background-color: #00ff006b !important;
    }
    .phoneError{
        background-color: #ff00006b !important;
    }
    #phone_owner{
        color:black !important;
    }
</style>
<script>
    var defCountry="<?php echo config('settings.default_country','US'); ?>";
    function initPhone(name){
        var input = document.querySelector("input[name='"+name+"']");
        if(input!=null){
            var iti=window.intlTelInput(input, {
              nationalMode:true,
                hiddenInput: name,
                //customContainer:"form-controls",
                autoHideDialCode:true,
                separateDialCode:true,
                autoPlaceholder:"aggressive",
                initialCountry: defCountry,
                utilsScript: "/vendor/intltelinput/build/js/utils.js",
            });


        var reset = function() {
		  input.classList.remove("error");
          setTheHidden();
		};

        var setTheHidden =function(){
            var theHidden=document.querySelector("input[type=hidden][name='"+name+"']");
            theHidden.value = iti.getSelectedCountryData().dialCode+input.value;
            console.log(theHidden.value);
        }


		input.addEventListener('change', reset);
		input.addEventListener('keyup', reset);

        input.addEventListener("countrychange", function() {
            setTheHidden();
        });

        setTheHidden();

        }
    }

    function initOwnerPhone(name){

        fetch('https://ipinfo.io/json?token=1f4d01c45c3aee')
            .then((response) => { return response.json(); })
            .then((data) => {
                defCountry = data.country;
                let input = document.querySelector("input[name='"+name+"']");
                if(input!=null){
                    var iti=window.intlTelInput(input, {
                        nationalMode:true,
                        hiddenInput: name,
                        //customContainer:"form-controls",
                        autoHideDialCode:true,
                        separateDialCode:true,
                        autoPlaceholder:"aggressive",
                        initialCountry: defCountry,
                        utilsScript: "/vendor/intltelinput/build/js/utils.js",
                    });


                    let reset = function() {
                        input.classList.remove("error");
                        input.classList.remove('phoneOk');
                        input.classList.remove('phoneError');
                        setTheHidden();
                    };

                    let setTheHidden =function(){
                        var theHidden=document.querySelector("input[type=hidden][name='"+name+"']");
                        theHidden.value = iti.getSelectedCountryData().dialCode+input.value;
                        console.log(theHidden.value);
                    }
                    let errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];

                    input.addEventListener('keyup', function() {
                        reset();
                        if (input.value.trim()) {

                            if (iti.isValidNumber()) {
                                input.classList.add("phoneOk");
                                //document.querySelector('#thesubmitbtn').removeAttribute("disabled")
                            } else {
                                //document.querySelector('#thesubmitbtn').setAttribute("disabled","disabled")
                                input.classList.add("phoneError");
                                let errorCode = iti.getValidationError();
                                let errorText = errorMap[errorCode];
                            }
                        }
                    });

                    input.addEventListener('change', reset);


                    input.addEventListener("countrychange", function() {
                        setTheHidden();
                    });

                    setTheHidden();

                }
            });



    }

    setTimeout(() => {
            initPhone('whatsapp_phone');
            initPhone('phone');
            initOwnerPhone('phone_owner');
            initPhone('phone_number');
            //initPhone('phone_driver');


        }, 3000);

</script>
