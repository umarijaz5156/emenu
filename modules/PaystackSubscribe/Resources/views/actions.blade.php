@if (strlen(auth()->user()->paystack_subscribtion_id)>5)
    <div class="card-footer py-4">
        <form id="form-subscription-actions" action="{{ route('paystack.subscription.actions') }}" method="get" >
            @csrf
            <button class="btn btn-danger btn-sub-actions"  type="submit" id="action" name="action" value="">{{__('Manage subscription')}}</button>
        </form>
    </div>  
@endif
