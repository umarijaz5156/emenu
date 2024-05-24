<input style="display:none;" id="d-none form-group-{{ $id }}" class="form-group {{ $errors->has($id) ? ' has-danger' : '' }}  @isset($class) {{$class}} @endisset">

    @isset($separator)
    <br />
    <h4 class="display-4 mb-0">{{ __($separator) }}</h4>
    <hr />
@endisset


<fieldset class="form-group row">
    <label class="form-control-label">{{ __($name) }}</label><br />


    @isset($additionalInfo)
        <small class="text-muted"><strong>{{ __($additionalInfo) }}</strong></small>
    @endisset

    @if ($errors->has($id))
        <span class="invalid-feedback" role="alert">
            <strong>{{ $errors->first($id) }}</strong>
        </span>
    @endif
    <div class="col-sm-10">
        @foreach ($data as $key => $item)
            @php $period = isset($var_name)?$var_name:$id; @endphp
            <div class="form-check">

                @if (is_array(__($item)))
                    <input name="@isset($var_name){{ $var_name }}@else{{ $id }}@endif" id="new_day{{$key}}" class="form-check-input"
                           type="radio"  value="{{ $item }}" />
                @else
                    @if (old($id)&&old($id).""==$key."")
                        <input name="@isset($var_name){{ $var_name }}@else{{ $id }}@endif" id="new_day{{$key}}" class="form-check-input"
                               checked="checked"
                               type="radio"   value="{{ $item }}" />
                    @elseif (isset($value)&&trim(strtoupper($value.""))==trim(strtoupper($key."")))
                        <input name="@isset($var_name){{ $var_name }}@else{{ $id }}@endif" id="new_day{{$key}}" class="form-check-input"
                               checked="checked"
                               type="radio"   value="{{ $item }}" />
                    @elseif (app('request')->input($id)&&strtoupper(app('request')->input($id)."")==strtoupper($key.""))
                        <input name="@isset($var_name){{ $var_name }}@else{{ $id }}@endif" id="new_day{{$key}}" class="form-check-input"
                               checked="checked"
                               type="radio"  value="{{ $item }}" />
                    @else
                        <input name="@isset($var_name){{ $var_name }}@else{{ $id }}@endif" id="new_day{{$key}}" class="form-check-input"
                               type="radio"  value="{{ $item }}" />
                    @endif
                @endif

                <label class="form-check-label" for="@isset($var_name){{ $var_name }}@else{{ $id }}@endif">
                    {{ __($item) }}
                </label>
            </div>
        @endforeach
    </div>
</fieldset>


