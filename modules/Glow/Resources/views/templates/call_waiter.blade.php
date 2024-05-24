<div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
    <div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body p-0">
                <div class="card bg-gray-100 shadow border-0 ">
                    <div class="card-header bg-transparent pb-2">
                        <h4 class="text-center mt-2 mb-3 text-lg  text-slate-700 font-bold mb-4">{{ __('Call Waiter') }}</h4>
                    </div>
                    <div class="card-body px-lg-5 py-lg-5">
                        <form role="form" method="post" action="{{ route('call.waiter') }}">
                            @csrf
                            @if (!isset($_GET['tid']))
                                @include('partials.fields',$fields)
                          
                            @else
                                <input type="hidden" value="{{$_GET['tid']}}" name="table_id"  id="table_id"/>
                            @endif 

                           
                             <div class="text-center">
                    <button type="submit" class="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 focus:z-10 focus:ring-4 focus:ring-gray-200" id="call_now_button">{{ __('Call Now') }}</button>
                   </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script>
        $(document).ready(function() {
            // Hide the "Call Now" button initially
            $("#call_now_button").hide();

            // Listen for changes in the dropdown
            $("#table_id").change(function() {
                // Check if an option other than the default is selected
                if ($(this).val() !== "") {
                    // Show the "Call Now" button
                    $("#call_now_button").show();
                } else {
                    // Hide the "Call Now" button
                    $("#call_now_button").hide();
                }
            });
        });
    </script>