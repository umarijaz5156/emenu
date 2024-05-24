@extends('layouts.app', ['title' => __('Restaurants')])
@section('admin_title')
    {{__('Restaurants')}}
@endsection
@section('content')
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>
    <div class="container-fluid mt--7">
        @include('restorants.happyhours.show')
        <div class="modal fade modal-xl" id="modal-order-details" tabindex="-1" role="dialog"
             aria-labelledby="modal-default" aria-hidden="true">
            <div class="modal-dialog modal-l modal-dialog-centered" style="max-width:1140px" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="modal-title-order"></h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-7">
                                <h3 id="restorant-name"></h3>
                                <h3>
                                    <p id="restorant-address"></p>
                                    <p id="restorant-info"></p>
                                </h3>
                                <h4 id="client-name"></h4>
                                <h4>
                                    <p id="client-info"></p>
                                </h4>
                                <h4>Order</h4>
                                <p>
                                </p>
                                <ol id="order-items">
                                </ol>
                                <p></p>
                                <h4 id="delivery-price"></h4><h4>
                                </h4><h4>Total</h4>
                                <h4>
                                    <p id="total-price"></p>
                                </h4>
                            </div>
                            <div class="col-md-5">
                                <div class="card">
                                    <!-- Card header -->
                                    <div class="card-header">
                                        <!-- Title -->
                                        <h5 class="h3 mb-0">Status History</h5>
                                    </div>
                                    <!-- Card body -->
                                    <div class="card-body">
                                        <div class="timeline timeline-one-side" id="status-history"
                                             style="height: 240px; overflow-y: scroll" data-timeline-content="axis"
                                             data-timeline-axis-style="dashed">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('restorants.partials.modals')
@endsection
