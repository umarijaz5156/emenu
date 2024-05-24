@if (strlen(auth()->user()->cancel_url)>5)
    <div class="card-footer py-4">
        <a href="{{ auth()->user()->update_url }}" target="_blank" class="btn btn-warning">{{__('Update subscription')}}</a>
        <a href="{{ auth()->user()->cancel_url }}" target="_blank" class="btn btn-danger">{{__('Cancel subscription')}}</a>
    </div>  
@endif
