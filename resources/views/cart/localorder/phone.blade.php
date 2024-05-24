<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

<div class="card card-profile shadow" id="localorder_phone">
    <div class="px-4">
        <div class="mt-5">
            <h3>{{ __('Phone') }}<span class="font-weight-light"></span></h3>
        </div>
        <div class="card-content border-top">
            <br />
            <div class="form-group{{ $errors->has('phone') ? ' has-danger' : '' }}">
                <input type="text"  @auth()  @endauth name="phone" id="phone" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" placeholder="{{ __( 'Your phone here' ) }} ..." required></input>
                @if ($errors->has('phone'))
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $errors->first('phone') }}</strong>
                    </span>
                @endif
                @error('phone')
                <span class="text-danger">The phone number is required</span>
                @enderror
            </div>
        </div>
        <br />
        <br />
    </div>
</div>
<br />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script>
    $(document).ready(function() {
        @if ($errors->any())
            @foreach ($errors->all() as $error)
                toastr.error('{{ $error }}', '', { positionClass: 'toast-top-full-width' });
            @endforeach
        @endif
    });
</script>

