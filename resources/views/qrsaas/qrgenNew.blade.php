@extends('layouts.app', ['title' => __('QR')])

@section('content')
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
        .qr-code-size{
            float: left;
            width: 32.50% !important;
            margin: 1px;
            padding: 12px !important;
        }
        .img-thumbnail-main{
            padding: 30px;
        }

        .b-box{
            width:40% !important;
        }
        .b-box-1{
            margin-right: 15px !important;
        }
        .b-box-2{
            margin-left: 15px !important;
        }

        .qr-color-btn{
            height: 30px !important;
            width: 30px !important;
            border-radius: 3px !important;
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
                <div id="qrgen">
                    <div class="row">
                        <div class="col-xl-4">
                            <br/>
                            <div class="card bg-secondary shadow">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">Buisness QR Generators</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <h6 class="heading-small text-muted mb-4">SELECT QR STYLE</h6>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="qr-code-size img-thumbnail">
                                                <img src="{!! $data['qr_1'] !!} " class="qr-image" data-index='1'>
                                            </div> 
                                            <div class="qr-code-size img-thumbnail">
                                                <img src="{!! $data['qr_2'] !!} " class="qr-image" data-index='2'>
                                            </div>
                                            <div class="qr-code-size img-thumbnail">
                                                <img src="{!! $data['qr_3'] !!} " class="qr-image" data-index='3'>
                                            </div>
                                        </div>
                                        <div class="col-md-12 justify-content-center mt-5 d-flex">
                                            <div class="qr-code-size img-thumbnail b-box b-box-1">
                                                <img src="{!! $data['qr_4'] !!} " class="qr-image" data-index='4'>
                                            </div>

                                            <div class="qr-code-size img-thumbnail b-box b-box-2">
                                                <img src="{!! $data['qr_5'] !!} " class="qr-image" data-index='5'>
                                            </div>

                                        </div>
                                        <div class="col-md-12">
                                            
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <br/>
                            <div class="card bg-secondary shadow">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">QR Colours</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <h6 class="heading-small text-muted mb-4">SELECT QR Colours</h6>

                                    <div class="row">
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(168,69,4);" data-colour=168,69,4></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(166,122,9);" data-colour=166,122,9></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(81,145,119);" data-colour=81,145,119></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(78,138,87);" data-colour=78,138,87></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(94,138,166);" data-colour=94,138,166></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(32,97,150);" data-colour=32,97,150></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(113,121,129);" data-colour=113,121,129></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1 mx-2 mt-2">
                                            <div class="qr-color-btn" style="background:rgb(157,52,50);" data-colour=157,52,50></div>
                                        </div>
                                        <div class="col-md-1 mx-2 mt-2">
                                            <div class="qr-color-btn" style="background:rgb(163,93,110);" data-colour=163,93,110></div>
                                        </div>
                                        <div class="col-md-1 mx-2 mt-2">
                                            <div class="qr-color-btn" style="background:rgb(107,66,158);" data-colour=107,66,158></div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-4 mt-3 p-0">
                                            <label for="qr-colour-picker">select color:</label>
                                        </div>
                                        <div class="col-md-3 mt-3 p-0">
                                            <input type="color" name="" class="form-control qr-colour-picker" id="qr-colour-picker" style="padding: 0px; height: 35px; border: 0px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                        </div>

                        <div class="col-xl-4">
                            <br/>
                            <div class="card bg-secondary shadow">
                                    <div class="card-header bg-white border-0">
                                        <div class="row align-items-center">
                                            <div class="col-8">
                                                <h3 class="mb-0">QR Downloader</h3>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body" id="section-to-print" >
                                        <div id="theQR">
                                            <img class="img-thumbnail img-thumbnail-main" src="{!! $data['qr_1'] !!}" data-index='1'>
                                        </div>
                                    <br />
                                    <button type="button" class="btn btn-success download-qr">Download JPG</button>
                                    <br /><br /><br /><br />
                                    </div>


                            </div>

                        </div>

                        <div class="col-xl-4">
                            <br/>
                            <div class="card bg-secondary shadow">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">Menu Print template</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body" id="section-to-print">
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active" ></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="1" ></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img class="d-block w-100" src="{{ asset('qrImagesDefault/menu-qr.png') }}" alt="First slide">
                                            </div>
                                            <div class="carousel-item">
                                                <img class="d-block w-100" src="{{ asset('qrImagesDefault/scan-menu-qr.png') }}" alt="Second slide">
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                    <br />
                                    <a href="{{ route('qr.zip', ['url' => $data['url']]) }}" class="btn btn-success">Download Template</a>
                                    <br /><br />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
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
                <div id="qrgen">
                    <div class="row">
                        <div class="col-xl-4">
                            <br/>
                            <div class="card bg-secondary shadow">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">Buisness QR Generators</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <h6 class="heading-small text-muted mb-4">SELECT QR STYLE</h6>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="qr-code-size img-thumbnail">
                                                <img src="{!! $data['qr_1'] !!} " class="qr-image" data-index='1'>
                                            </div> 
                                            <div class="qr-code-size img-thumbnail">
                                                <img src="{!! $data['qr_2'] !!} " class="qr-image" data-index='2'>
                                            </div>
                                            <div class="qr-code-size img-thumbnail">
                                                <img src="{!! $data['qr_3'] !!} " class="qr-image" data-index='3'>
                                            </div>
                                        </div>
                                        <div class="col-md-12 justify-content-center mt-5 d-flex">
                                            <div class="qr-code-size img-thumbnail b-box b-box-1">
                                                <img src="{!! $data['qr_4'] !!} " class="qr-image" data-index='4'>
                                            </div>

                                            <div class="qr-code-size img-thumbnail b-box b-box-2">
                                                <img src="{!! $data['qr_5'] !!} " class="qr-image" data-index='5'>
                                            </div>

                                        </div>
                                        <div class="col-md-12">
                                            
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <br/>
                            <div class="card bg-secondary shadow">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">QR Colours</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <h6 class="heading-small text-muted mb-4">SELECT QR Colours</h6>

                                    <div class="row">
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(168,69,4);" data-colour=168,69,4></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(166,122,9);" data-colour=166,122,9></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(81,145,119);" data-colour=81,145,119></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(78,138,87);" data-colour=78,138,87></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(94,138,166);" data-colour=94,138,166></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(32,97,150);" data-colour=32,97,150></div>
                                        </div>
                                        <div class="col-md-1 mx-2">
                                            <div class="qr-color-btn" style="background:rgb(113,121,129);" data-colour=113,121,129></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1 mx-2 mt-2">
                                            <div class="qr-color-btn" style="background:rgb(157,52,50);" data-colour=157,52,50></div>
                                        </div>
                                        <div class="col-md-1 mx-2 mt-2">
                                            <div class="qr-color-btn" style="background:rgb(163,93,110);" data-colour=163,93,110></div>
                                        </div>
                                        <div class="col-md-1 mx-2 mt-2">
                                            <div class="qr-color-btn" style="background:rgb(107,66,158);" data-colour=107,66,158></div>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-md-4 mt-3 p-0">
                                            <label for="qr-colour-picker">select color:</label>
                                        </div>
                                        <div class="col-md-3 mt-3 p-0">
                                            <input type="color" name="" class="form-control qr-colour-picker" id="qr-colour-picker" style="padding: 0px; height: 35px; border: 0px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                        </div>

                        <div class="col-xl-4">
                            <br/>
                            <div class="card bg-secondary shadow">
                                    <div class="card-header bg-white border-0">
                                        <div class="row align-items-center">
                                            <div class="col-8">
                                                <h3 class="mb-0">QR Downloader</h3>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card-body" id="section-to-print" >
                                        <div id="theQR">
                                            <img class="img-thumbnail img-thumbnail-main" src="{!! $data['qr_1'] !!}" data-index='1'>
                                        </div>
                                    <br />
                                    <button type="button" class="btn btn-success download-qr">Download JPG</button>
                                    <br /><br /><br /><br />
                                    </div>


                            </div>

                        </div>

                        <div class="col-xl-4">
                            <br/>
                            <div class="card bg-secondary shadow">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">Menu Print template</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body" id="section-to-print">
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active" ></li>
                                            <li data-target="#carouselExampleIndicators" data-slide-to="1" ></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img class="d-block w-100" src="{{ asset('qrImagesDefault/menu-qr.png') }}" alt="First slide">
                                            </div>
                                            <div class="carousel-item">
                                                <img class="d-block w-100" src="{{ asset('qrImagesDefault/scan-menu-qr.png') }}" alt="Second slide">
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>

                                    <br />
                                    <a href="{{ route('qr.zip', ['url' => $data['url']]) }}" class="btn btn-success">Download Template</a>
                                    <br /><br />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
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
<script type="text/javascript">
    $(".qr-image").click(function(){
        var image = $(this).attr("src");
        var index = $(this).attr("data-index");
        
        $(".img-thumbnail-main").attr("src", image);
        $(".img-thumbnail-main").attr("data-index", index);
    });

    $(".download-qr").click(function(){
        var image = $(".img-thumbnail-main").attr("src");
         const downloadLink = document.createElement("a");
         downloadLink.href = image;
         downloadLink.download = 'qr.png';
         downloadLink.click();
    });

    $("body").on('click', '.qr-color-btn', function(){
        var colour = $(this).attr('data-colour');
        getColourQr(colour);
    });

    $("body").on('change', '.qr-colour-picker', function(){
        var colour = $(this).val();
        colour = hexTorgb(colour);
        colour = colour.toString();
        getColourQr(colour);
    });

    function hexTorgb(hex) {
      return ['0x' + hex[1] + hex[2] | 0, '0x' + hex[3] + hex[4] | 0, '0x' + hex[5] + hex[6] | 0];
    }
    
    function getColourQr(colour){
        var index = $(".img-thumbnail-main").attr("data-index");
        var qrUrl = '{{ $data['url'] }}';
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            url : "{{ route('qr.colour') }}",
            data : {'colour' : colour, 'qrIndex':index, 'qrUrl':qrUrl},
            type : 'POST',
            dataType : 'json',
            success : function(data){
                $(".img-thumbnail-main").attr("src", data.qrCode);
            }
        });
    }

</script>
@endsection

@include('email_contact_form_popup')
