<div class="col-md-6">
    @include('partials.input',['name'=>'Paystack Plan CODE','id'=>"subscribe[paystack_id]",'placeholder'=>"Plan Code from Paystack starting with PLN_xxxxxx",'required'=>false,'value'=>(isset($plan)?$plan->paystack_id:null)])
</div>