<div class="col-md-6">
    @include('partials.input',['name'=>'PayPal Pricing Plan ID','id'=>"subscribe[paypal_id]",'placeholder'=>"Product price plan id from PayPal starting with P-xxxxxx",'required'=>false,'value'=>(isset($plan)?$plan->paypal_id:null)])
</div>