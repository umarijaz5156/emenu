<div class="col-md-6">
    @include('partials.input',['name'=>'RazorPay Plan ID','id'=>"subscribe[razorpay_id]",'placeholder'=>"RazorPay plan id...",'required'=>false,'value'=>(isset($plan)?$plan->razorpay_id:null)])
</div>