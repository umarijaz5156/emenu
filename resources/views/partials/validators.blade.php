

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
                if (this.type == "text") {
                    this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                }

            } else {
                // Rejected value: nothing to restore.
                this.value = "";
            }
        });
    });
    }



{{--
     document.querySelectorAll(".myTextBox").forEach((el) => {
        setInputFilter(el, function(value) {
            return /^[^,|\+|-]+$/.test(value); // Allow digits and '.' only, using a RegExp.
   //     }, '{{ __('Commas, +, - not allowed') }}');
        })
     })

--}}

</script>
