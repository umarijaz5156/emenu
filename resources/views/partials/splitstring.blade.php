@isset($separator)
    <br />
    <h4 class="display-4 mb-0">{{ __($separator) }}</h4>
    <hr />
@endisset
<div id="form-group-{{ $id }}"
    class="form-group{{ $errors->has($id) ? ' has-danger' : '' }}  @isset($class) {{ $class }} @endisset">
    @if (!(isset($type) && $type == 'hidden'))
    <label class="form-control-label" for="{{ $id }}">{{ __($name) }}@isset($link)
            <a target="_blank" href="{{ $link }}">{{ $linkName }}</a>
        @endisset
    </label>
@endif
@php
    $currency = auth()->user()->restorant->currency!='' ? auth()->user()->restorant->currency :config('settings.cashier_currency');
@endphp
@if ($id == 'options')
    <br />
    <div class="table-responsive">
        <table class="table align-items-center table-flush" id="table-{{ $id }}">
            <thead class="thead-light">
                <tr>
                    <th>Descriptions</th>
                    <th>Value</th>
                    <th>Currency</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($value as $index => $entry)
                    <tr id ="table-{{ $id }}-tr-{{ $index }}">
                        <td>
                            <input type="text" name="{{ $id }}[{{ $index }}][desc]"
                                value="{{ $entry['desc'] }}"
                                class="myTextBox form-control @isset($editclass) {{ $editclass }} @endisset {{ $errors->has($id) ? ' is-invalid' : '' }}">
                        </td>
                        <td style="width:100px">
                            <input type="text" name="{{ $id }}[{{ $index }}][price]"
                                value="{{ $entry['price'] }}"
                                class="myPriceBox form-control @isset($editclass) {{ $editclass }} @endisset {{ $errors->has($id) ? ' is-invalid' : '' }}">
                        </td>
                        <td>
                            <input type="text" disabled value="{{  $entry['currency'] }}">
                        </td>
                        <td>
                            <a onclick="removeNewRecord({{ $index }})"
                                class="btn btn-sm btn-danger text-white">Delete</a>
                        </td>
                        <input type="hidden" name="{{ $id }}[{{ $index }}][sign]"
                            value="{{ $entry['sign'] }}">
                        <input type="hidden" name="{{ $id }}[{{ $index }}][currency]"
                            value="{{ $entry['currency'] }}">

                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <a onclick = "addNewRecord(window.tableIndex)" class="btn btn-secondary">Add new record</a>
    <script>
        window.tableIndex = {{ isset($index) ? $index + 1 : 0 }};

        function addNewRecord(index) {
            let html = `
               <tr id ="table-{{ $id }}-tr-${index}">
                            <td>
                                <input type="text" id="text${index}"  name="{{ $id }}[${index}][desc]"  value="new item"
                                       class="form-control @isset($editclass) {{ $editclass }} @endisset {{ $errors->has($id) ? ' is-invalid' : '' }}">
                            </td>
                            <td>
                                <input type="text" id="price${index}"  name="{{ $id }}[${index}][price]" value="0"
                                       class="form-control @isset($editclass) {{ $editclass }} @endisset {{ $errors->has($id) ? ' is-invalid' : '' }}">
                            </td>
                            <td>
                                <input type="text" disabled value="{{ $currency }}">
                            </td>
                            <td>
                                <a onclick="removeNewRecord(${index})" class="btn btn-sm btn-danger text-white">Delete</a >
                            </td>
                            <input type="hidden" name="{{ $id }}[${index}][sign]" value="+">
                            <input type="hidden" name="{{ $id }}[${index}][currency]" value="{{ $currency }}"">

                        </tr>

               `;
            document.querySelector('#table-{{ $id }} tbody').insertAdjacentHTML('beforeend', html);

            setInputFilter(document.querySelector(`#price${index}`), function(value) {
                return /^\d*\.?\d*$/.test(value); // Allow digits and '.' only, using a RegExp.
            }, '{{ __("Only digits and '.' are allowed") }}');


            // setInputFilter(document.querySelector(`#text${index}`), function(value) {
            //     return /^[^,]+$/.test(value); // Allow digits and '.' only, using a RegExp.
            // }, '{{ __('Commas, + and -  not allowed') }}');

            window.tableIndex++;
        }

        function removeNewRecord(index) {
            document.querySelector('#table-{{ $id }}-tr-' + index).remove();
        }
    </script>
@else
    <input @isset($accept) accept="{{ $accept }}" @endisset
        step="{{ isset($step) ? $step : '.01' }}"
        @isset($min) min="{{ $min }}" @endisset
        @isset($max) max="{{ $max }}" @endisset
        type="{{ isset($type) ? $type : 'text' }}"
        name="@if(isset($var_name)){{ str_replace(' ', '', $var_name) }}@else{{ str_replace(' ', '', $id) }}@endif"
        id="{{ $id }}"
        class="form-control form-control @isset($editclass) {{ $editclass }} @endisset {{ $errors->has($id) ? ' is-invalid' : '' }}"
        placeholder="{{ __($placeholder) }}"
        value="{{ old($id) ? old($id) : (isset($value) ? $value : (app('request')->input($id) ? app('request')->input($id) : null)) }}"
        <?php if ($required) {
            echo 'required';
        } ?> @if (isset($disabled) && $disabled) disabled @endif>
    <!-- Conditionally added disabled attribute -->
@endif

@isset($additionalInfo)
    <small class="text-muted"><strong>{{ __($additionalInfo) }}</strong></small>
@endisset
@if ($errors->has($id))
    <span class="invalid-feedback" role="alert">
        <strong>{{ $errors->first($id) }}</strong>
    </span>
@endif
</div>
<script>
    // Restricts input for the given textbox to the given inputFilter function.
    function setInputFilter(textbox, inputFilter, errMsg) {
        ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop", "focusout"].forEach(
            function(event) {
                textbox.addEventListener(event, function(e) {
                    if (inputFilter(this.value)) {
                        // Accepted value.
                        if (["keydown", "mousedown", "focusout"].indexOf(e.type) >= 0) {
                            this.classList.remove("input-error");
                            this.setCustomValidity("");
                        }

                        this.oldValue = this.value;
                        this.oldSelectionStart = this.selectionStart;
                        this.oldSelectionEnd = this.selectionEnd;
                    } else if (this.hasOwnProperty("oldValue")) {
                        // Rejected value: restore the previous one.
                        this.classList.add("input-error");
                        this.setCustomValidity(errMsg);
                        this.reportValidity();
                        this.value = this.oldValue;
                        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                    } else {
                        // Rejected value: nothing to restore.
                        this.value = "";
                    }
                });
            });
    }

    //mount prices
    document.querySelectorAll(".myPriceBox").forEach((el) => {
        setInputFilter(el, function(value) {
            return /^\d*\.?\d*$/.test(value); // Allow digits and '.' only, using a RegExp.
        }, '{{ __("Only digits and '.' are allowed") }}');
    })


    // document.querySelectorAll(".myTextBox").forEach((el) => {
    //     setInputFilter(el, function(value) {
    //         return /^[^,|\+|-]+$/.test(value);
    //     }, '{{ __('Commas, +, - not allowed') }}');
    // })
</script>
