@extends('layouts.app', ['title' => __('QR')])

@section('content')
    <style>
        <style>

        /* Default styles for larger screens */
        .qr-limit-reached {
            color: red;
            text-align: center;
        }

        .qr-container {
            position: relative;
        }

        .qr-count {
            position: absolute;
            z-index: 2;
            top: 510px;
            left: 400px;
        }

        .qr-content {
            position: relative;
            z-index: 1;
            margin-left: 600px;
        }

        /* Media query for smaller screens (e.g., mobile devices) */
        @media (max-width: 768px) {

            .qr-count,
            .qr-content,
            .qr-container {
                position: static;
                text-align: center;
                margin: 0 auto;
            }

            .qr-count {
                margin-top: 0px;
            }

            .qr-content {
                margin-top: 20px;
            }
        }

        /* Media query for larger screens (e.g., tablets and desktops) */
        @media (min-width: 1200px) {

            .qr-count,
            .qr-content,
            .qr-container {
                position: static;
                text-align: center;
                margin: 0 auto;
            }

            .qr-count {
                margin-top: -10px !important;
            }

            .qr-content {
                margin-top: -20px;
            }
        }
    </style>

    </style>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">

    </div>
    @php
        $planid = Auth::user()->plan_id;
        $plan = App\Plans::where('id', $planid)->first();
        $companies = App\Restorant::where('user_id', Auth::user()->id)->first();
        $qrcount = $plan->limit_qrcode - $companies->qr_count;
    @endphp
    @if ($plan->limit_qrcode == 0)
        <div class="container-fluid mt--7">

            <div class="qr-container">
                <div id="qrgen" data='{{ $data }}'></div>
                <div class="qr-count">

                </div>
                <div class="qr-content">

                </div>
            </div>
        </div>
    @else
        @if ($plan->limit_qrcode <= $companies->qr_count)
            <h3 style="margin-left: 300px" class="qr-limit-reached">
                QrScan limit reached. Please contact admin.
            </h3>
        @else
            <div class="container-fluid mt--7">

                <div class="qr-container">
                    <div id="qrgen" data='{{ $data }}'></div>
                    <div class="qr-count">

                    </div>
                    <div class="qr-content">

                    </div>
                </div>
            </div>
        @endif
    @endif

@endsection

@section('js')
    <script type="text/javascript" src="{{ asset('js/appreact.js') }}"></script>
@endsection


@include('email_contact_form_popup')
