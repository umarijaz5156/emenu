
<script type="text/javascript">
        "use strict";
       
        function payWithRazorpay(razopayPlanID,planID) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $.ajax({
                type:'POST',
                url: '/razorpaysubscribe/getsubscribelink',
                dataType: 'json',
                data: {
                    razopayPlanID: razopayPlanID,
                    planID: planID
                },
                success:function(response){
                    console.log(response);
                    if(response.status){
                        window.open(response.success_url);
                    }
                }, error: function (response) {
                    console.log("Error");
                    console.log(response);
                }
            })
        }

        plans.forEach(plan => {
            
            if((plan.razorpay_id!=null&&plan.razorpay_id!="") && user.paypal_subscribtion_id != plan.razorpay_id){

                var buttonName="{{__('Switch to ')}}"+plan.name;
                $('#button-container-plan-'+plan.id).append("<a href=\"javascript:payWithRazorpay(\'"+plan.razorpay_id+"\',\'"+plan.id+"\')\" class=\"btn btn-primary\">"+buttonName+"</a>" );

            }
        });

        


    </script> 