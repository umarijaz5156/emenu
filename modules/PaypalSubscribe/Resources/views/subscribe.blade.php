<script src="https://www.paypal.com/sdk/js?client-id=<?php echo config('paypal-subscribe.client_id'); ?>&vault=true&intent=subscription" data-sdk-integration-source="button-factory"></script>
<script type="text/javascript">
    
    
    function updateSubscribtion(subscriptionID, planID){
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type:'POST',
            url: '/paypalsubscribe/subscribe',
            dataType: 'json',
            data: {
                subscriptionID: subscriptionID,
                planID: planID
            },
            success:function(response){
                if(response.status){
                    location.replace(response.success_url);
                    //window.location.reload();
                }
            }, error: function (response) {
            }
        })
    }


        plans.forEach(plan => {
            
            if((plan.paypal_id!=null&&plan.paypal_id!="") && user.paypal_subscribtion_id != plan.paypal_id){
                paypal.Buttons({
                    style: {
                        shape: 'rect',
                        color: 'gold',
                        layout: 'vertical',
                        label: 'subscribe'
                    },
                    createSubscription: function(data, actions) {
                        return actions.subscription.create({
                            'plan_id': plan.paypal_id
                        });
                    },
                    onError: function (err) {
                            
                    },
                    onApprove: function(data, actions) {
                        updateSubscribtion(data.subscriptionID, plan.id);
                    }
                }).render('#button-container-plan-'+plan.id);
            }
        });
 

</script>