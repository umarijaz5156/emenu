<div class="col-md-6">
    @include('partials.input',['name'=>'Paddle ID','id'=>"subscribe[paddle_id]",'placeholder'=>"Paddle ID here...",'required'=>false,'value'=>(isset($plan)?$plan->paddle_id:null)])
</div>