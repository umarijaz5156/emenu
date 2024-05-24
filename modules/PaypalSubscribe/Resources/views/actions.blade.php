@if (strlen(auth()->user()->cancel_url)>5)
    <div class="card-footer py-4">
        <form id="form-subscription-actions" action="{{ route('paypal.subscription.actions') }}" method="post" >
            @csrf
            <button class="btn btn-danger btn-sub-actions"  type="submit" id="action" name="action" value="">{{__('Cancel subscription')}}</button>
        </form>
    </div>  
@endif
