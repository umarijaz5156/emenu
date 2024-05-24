<link rel="stylesheet" href="{{ asset('country_code_phone') }}/css/intlTelInput.css">

{{-- <h1 class="py-5">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</h1> --}}
{{-- Popup form section --}}
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
    style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            {{-- <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> --}}
            <div class="modal-body">
                <form>
                    @csrf
                    <div class="form-group my-2">
                        <label for="recipient-name" class="col-form-label">Full Name:</label>
                        <input type="text" class="form-control" name="full_name" id="full_name">
                    </div>
                    <div class="form-group my-2">
                        {{--  Full Name, Restaurant Name, Phone Number (with country code), Subject, and Message. --}}
                        <label for="recipient-name" class="col-form-label">Restaurant Name:</label>
                        <input type="text" class="form-control" name="restaurant_name" id="restaurant_name">
                    </div>
                    <div class="form-group my-2">
                        <label for="recipient-name" class="col-form-label">Phone Number:</label>
                        <input type="tel" class="form-control" name="phone_number_hb" id="phone_number_hb">
                    </div>
                    <div class="form-group my-2">
                        <label for="recipient-name" class="col-form-label">Subject:</label>
                        <input type="text" class="form-control" name="subject" id="subject">
                    </div>
                    <div class="form-group my-2">
                        <label for="message-text" class="col-form-label">Message:</label>
                        <textarea class="form-control" name="message" id="message"></textarea>
                    </div>
                </form>
            </div>

            <div class="col-md-12">
                <div id="ajax_success_alert" class="alert alert-success" style="display: none;"></div>
            </div>
            <div class="col-md-12">
                <div id="ajax_error_alert" class="alert alert-danger" style="display: none;"></div>
            </div>

            <div class="modal-footer">
                <button type="button" id="contact_form_cancel_btn" class="btn btn-secondary"
                    data-dismiss="modal">Cancel</button>
                <button id="contact_form_btn" type="button" class="btn btn-primary">
                    Send message
                </button>
            </div>
        </div>
    </div>
</div>
{{-- Popup form section --}}


{{-- Thank yu popup --}}
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#thank_you_modal" style="display: none;"
    id="thank_you_modal_btn">
    Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="thank_you_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                Thank you! Your message has been sent. A representative will get back to you in 24-48 hours.
            </div>
            {{-- <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div> --}}
        </div>
    </div>
</div>
{{-- Thank yu popup --}}

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>

<script src="{{ asset('country_code_phone') }}/js/intlTelInput.js"></script>

<script>
    var ifUser = {!! json_encode(auth()->user() ? true : false) !!};

    var input = document.querySelector("#phone_number_hb");
    var phone_number_with_code = window.intlTelInput(input, {
        utilsScript: "{{ asset('country_code_phone') }}/js/utils.js"
    });


    $(document).ready(function() {
        $('#contact_form_btn').click(function(e) {
            const alert_success_div = $('#ajax_success_alert');
            const alert_error_div = $('#ajax_error_alert');

            if (!ifUser) {
                alert_error_div.text('Please login first.');
                alert_error_div.show();
                return;
            }

            alert_success_div.hide();
            alert_error_div.hide();

            const full_name = $('#full_name').val();
            const restaurant_name = $('#restaurant_name').val();
            const phone_number = phone_number_with_code.getNumber();
            const subject = $('#subject').val();
            const message = $('#message').val();

            if (full_name == '' || restaurant_name == '' || phone_number == '' || subject == '' ||
                message == '') {
                alert_error_div.text('All fields are required.');
                alert_error_div.show();
                return;
            }

            // console.log(full_name, restaurant_name, phone_number, subject, message);
            // console.log(phone_number);
            // return

            const form_data = {
                _token: $('meta[name="csrf-token"]').attr('content'),
                full_name: full_name,
                restaurant_name: restaurant_name,
                phone_number: phone_number,
                subject: subject,
                message: message,
            }

            $.ajax({
                url: "{{ route('submitcontactform') }}",
                type: "POST",
                data: form_data,
                success: function(response) {
                    console.log(response);
                    alert_success_div.text(response.message);
                    alert_success_div.show();
                    $('#contact_form_cancel_btn').click();
                    $('#thank_you_modal_btn').click();
                },
                error: function(xhr, status, error) {
                    console.log(xhr.responseText);
                    alert_error_div.text(xhr.responseJSON.message);
                    alert_error_div.show();
                }
            });


        });
    });
</script>
