<script src="https://js.paystack.co/v1/inline.js"></script>
<script type="text/javascript">
    var theKey="<?php echo  config('paystack-subscribe.key') ?>";
    var currentUserEmail="{{ auth()->user()->email }}";
    //alert(currentUserEmail)
    
    function updateSubscribtion(subscriptionID, planID){
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type:'POST',
            url: '/paystacksubscribe/subscribe',
            dataType: 'json',
            data: {
                subscriptionID: subscriptionID,
                planID: planID
            },
            success:function(response){
                if(response.status){
                    location.replace(response.success_url);
                }
            }, error: function (response) {
            }
        })
    }

    function payWithPaystack(planCODE,planID) {


            let handler = PaystackPop.setup({
                key: theKey, // Replace with your public key
                email: currentUserEmail,
                plan:planCODE,
               
                // label: "Optional string that replaces customer email"
                onClose: function(){
                    //alert('Window closed.');
                },
                callback: function(response){
                    let message = 'Payment complete! Reference: ' + response.reference;
                    updateSubscribtion(response.reference,planID)
                    //alert(message);
                }
            });

            handler.openIframe();
    }

    


        plans.forEach(plan => {
            
            if((plan.paystack_id!=null&&plan.paystack_id!="") && user.paypal_subscribtion_id != plan.paystack_id){

                var buttonName="{{__('Switch to ')}}"+plan.name;
                $('#button-container-plan-'+plan.id).append("<a href=\"javascript:payWithPaystack(\'"+plan.paystack_id+"\',\'"+plan.id+"\')\" class=\"btn btn-primary\">"+buttonName+"</a>" );

            }
        });
 

</script>