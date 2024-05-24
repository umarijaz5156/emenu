    <style>
        .select2-dropdown{
            z-index: 99999999;
        }
    </style>

   <div class="modal fade" id="dynamic-price-model" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
        <div class="modal-dialog modal- modal-dialog-centered modal-" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="modal-title-new-extras">{{ __('Add new Dynamic Price') }}</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="card bg-secondary shadow border-0">
                        <div class="card-body px-lg-5 py-lg-5">
                            <div id="dynamic-price-form-html"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    