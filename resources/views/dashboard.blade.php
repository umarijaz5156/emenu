@extends('layouts.app')
@section('admin_title')
    {{ __('Dashboard') }}
@endsection

@section('content')



    <style>
        label {
            /* display: block;
                                                                                                                                                                                font:
                                                                                                                                                                                    1rem 'Fira Sans',
                                                                                                                                                                                    sans-serif; */
        }

        input,
        label {
            margin: 0.4rem 0;
        }

        /* HTML: <div class="loader"></div> */
        .loader {
            margin: auto;
            width: 150px;
            height: 150px;
            color: #f03355;
            background:
                conic-gradient(from -45deg at top 20px left 50%, #0000, currentColor 1deg 90deg, #0000 91deg),
                conic-gradient(from 45deg at right 20px top 50%, #0000, currentColor 1deg 90deg, #0000 91deg),
                conic-gradient(from 135deg at bottom 20px left 50%, #0000, currentColor 1deg 90deg, #0000 91deg),
                conic-gradient(from -135deg at left 20px top 50%, #0000, currentColor 1deg 90deg, #0000 91deg);
            animation: l4 1.5s infinite cubic-bezier(0.3, 1, 0, 1);
        }

        @keyframes l4 {
            50% {
                width: 60px;
                height: 60px;
                transform: rotate(180deg)
            }

            100% {
                transform: rotate(360deg)
            }
        }
    </style>

    @if (!auth()->user()->hasRole('driver'))
        @include('layouts.headers.cards.general')
    @else
        @include('layouts.headers.cards.driver')
    @endif


    @if (
        (auth()->user()->hasRole('admin') && config('app.isft')) ||
            (auth()->user()->hasRole('owner') && in_array('drivers', config('global.modules', []))))
        <div class="container-fluid mt--7 mb-8">
            <div class="row">
                <div class="col-xl-12">
                    @include('drivers.map')
                </div>
            </div>
        </div>
    @endif


    @if (!auth()->user()->hasRole('driver'))
        <div class="container-fluid mt-7">


            {{-- HB codes --}}
            <div class="row my-5 shadow px-2 py-5">

                <div class="col-6 col-md-4 text-center">
                    <label for="start">Start date:</label>
                    <input type="date" id="start_time_picker" name="start_time_picker" max="{{ date('Y-m-d') }}"
                        value="2023-01-01" />
                </div>
                <div class="col-6 col-md-4 text-center">
                    <label for="start">End date:</label>
                    <input type="date" id="end_time_picker" name="end_time_picker" max="{{ date('Y-m-d') }}"
                        value="{{ date('Y-m-d') }}" />
                </div>

                <div class="col-6 col-md-4 text-center">
                    <button class="btn btn-primary btn-sm mt-1" id="filter_btn">{{ __('Filter') }}</button>
                </div>



                <div class="col-12">
                    <div id="filter_loader" style="display: none;min-height: 500px">
                        <div class="loader"></div>
                    </div>
                    <div class="my-3" id="chartContainer" style="height: 400px; width: 100%;"></div>
                </div>
                <div class="col-12">
                    {{-- <div id="filter_loader" style="display: none;min-height: 500px">
                        <div class="loader"></div>
                    </div> --}}
                    <div class="my-3" id="chartContainerSales" style="height: 400px; width: 100%;"></div>
                </div>

            </div>
            {{-- HB codes --}}

            @if ($doWeHaveExpensesApp)
                <script>
                    var categoriesLabels = {!! json_encode($expenses['last30daysCostPerGroupLabels']) !!};
                    var categoriesValues = {!! json_encode($expenses['last30daysCostPerGroupValues']) !!};

                    var vendorsLabels = {!! json_encode($expenses['last30daysCostPerVendorLabels']) !!};
                    var vendorsValues = {!! json_encode($expenses['last30daysCostPerVendorValues']) !!};
                </script>
                <div class="row mt-5">
                    <div class="col-xl-6">
                        <div class="card shadow">
                            <div class="card-header bg-transparent">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6 class="text-uppercase text-muted ls-1 mb-1">{{ __('Expenses') }} ( 30
                                            {{ __('days') }} )</h6>
                                        <h2 class="mb-0">{{ __('By category') }}</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Chart -->
                                @if (count($salesValue) > 0)
                                    <div class="chart">
                                        <canvas id="chart-bycategory" class="chart-canvas"></canvas>
                                    </div>
                                @else
                                    <p>{{ __('No expenses right now!') }}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card shadow">
                            <div class="card-header bg-transparent">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6 class="text-uppercase text-muted ls-1 mb-1">{{ __('Expenses') }} ( 30
                                            {{ __('days') }} )</h6>
                                        <h2 class="mb-0">{{ __('By vendor') }}</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <!-- Chart -->
                                @if (count($salesValue) > 0)
                                    <div class="chart">
                                        <canvas id="chart-byvendor" class="chart-canvas"></canvas>
                                    </div>
                                @else
                                    <p>{{ __('No expenses right now!') }}</p>
                                @endif
                            </div>
                        </div>
                    </div>

                </div>
            @endif

            @if (auth()->user()->hasRole('owner') && config('settings.enable_pricing'))
                <br /><br />
                @include('plans.info', [
                    'planAttribute' => auth()->user()->restorant->getPlanAttribute(),
                    'showLinkToPlans' => true,
                ])
            @endif

            @include('layouts.footers.auth')
        </div>
    @endif
@endsection
@section('topjs')
    <script src="{{ asset('argon') }}/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="{{ asset('argon') }}/vendor/chart.js/dist/Chart.extension.js"></script>
@endsection
@push('js')

    @if (
        (auth()->user()->hasRole('admin') && config('app.isft')) ||
            (auth()->user()->hasRole('owner') && in_array('drivers', config('global.modules', []))))
        <!-- Live orders -->
        <script src="{{ asset('custom') }}/js/liveorders.js"></script>

        <!-- Google Map -->
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?libraries=geometry,drawing&callback=initDriverMap&key=<?php echo config('settings.google_maps_api_key'); ?>">
        </script>

        <script type="text/javascript">
            var map = null;
            var clientsAndDriverMarkers = [];

            function initDriverMap() {
                map = new google.maps.Map(document.getElementById('map_location'), {
                    center: {
                        lat: 40.7128,
                        lng: -74.006
                    },
                    zoom: 15
                });
                getRestorants();
            }

            function getRestorants() {

                var infowindow = new google.maps.InfoWindow();

                const image = "/custom/img/pin_restaurant.svg";

                var bounds = new google.maps.LatLngBounds();

                var link = '/restaurantslocations';
                axios.get(link).then(function(response) {


                    response.data.restaurants.forEach(restaurant => {

                        /**
                         *  Restaurant Marker
                         **/
                        var restoMarker = new google.maps.Marker({
                            position: new google.maps.LatLng(parseFloat(restaurant.lat), parseFloat(
                                restaurant.lng)),
                            animation: google.maps.Animation.DROP,
                            map,
                            title: restaurant.name,
                            icon: image,
                            color: "red"
                        });

                        // console.log('restaurant', restaurant);
                        // console.log(restaurant.lat);
                        // console.log(restaurant.lng);
                        // console.log('--------------------');

                        restoMarker.addListener("click", () => {
                            var content = "<a href=\"/orders?restorant_id=" + restaurant.id +
                                "\"><strong>" + restaurant.name + "</strong></a>";
                            infowindow.setContent(content);
                            infowindow.open({
                                anchor: restoMarker,
                                map,
                                shouldFocus: false,
                            });
                        });
                        bounds.extend(restoMarker.position);
                    });

                    map.fitBounds(bounds);

                    getDriverOrders();
                    setInterval(() => {
                        getDriverOrders();
                    }, 20000);

                });
            }


            function getDriverOrders() {

                var infowindow = new google.maps.InfoWindow();

                const image = "/custom/img/pin_driver.svg";

                var link = '/driverlocations';



                for (let i = 0; i < clientsAndDriverMarkers.length; i++) {
                    clientsAndDriverMarkers[i].setMap(null);
                }
                clientsAndDriverMarkers = [];


                axios.get(link).then(function(response) {



                        response.data.drivers.forEach(driver => {


                            if (driver.lat != null) {


                                /**
                                 *  Driver Marker
                                 **/
                                var driverMarker = new google.maps.Marker({
                                    position: new google.maps.LatLng(parseFloat(driver.lat), parseFloat(
                                        driver.lng)),
                                    map,
                                    title: driver.name,
                                    icon: image,
                                    color: "red"
                                });
                                clientsAndDriverMarkers.push(driverMarker);
                                google.maps.event.addListener(driverMarker, 'click', (function(driverMarker, i) {
                                    var content = "<a href=\"/orders?driver_id=" + driver.id + "\">" +
                                        driver.name + "</a>";
                                    content += "<br />";
                                    content += "Orders: " + driver.driverorders.length;
                                    content += "<br />";
                                    content += "---------";
                                    content += "<br />";
                                    driver.driverorders.forEach(order => {
                                        content += "Order <a href=\"/orders/" + order.id +
                                            "\">#" + order.id +
                                            "</a> <a href=\"/orders?restorant_id=" + order
                                            .restorant_id + "\"><strong>" + order.restorant
                                            .name + "</strong></a>";
                                        content += "<br />";
                                    });
                                    content += "---------";
                                    content += "<br />";
                                    return function() {
                                        infowindow.setContent(content);
                                        infowindow.open(map, driverMarker);
                                    }
                                })(driverMarker, i));


                                /**
                                 *  Driver Path
                                 **/
                                var driverPathCoordinates = [];
                                driver.paths.forEach(path => {
                                    driverPathCoordinates.push({
                                        lat: parseFloat(path.lat),
                                        lng: parseFloat(path.lng)
                                    });
                                });
                                driverPathCoordinates.push({
                                    lat: parseFloat(driver.lat),
                                    lng: parseFloat(driver.lng)
                                });

                                const driverPath = new google.maps.Polyline({
                                    path: driverPathCoordinates,
                                    geodesic: true,
                                    strokeColor: "#0000FF",
                                    strokeOpacity: 1.0,
                                    strokeWeight: 2,
                                });
                                driverPath.setMap(map);



                                /**
                                 *  Driver orders - if any
                                 * */
                                driver.driverorders.forEach(order => {


                                    //The restaurant
                                    var restaurantMarker = new google.maps.Marker({
                                        position: new google.maps.LatLng(parseFloat(order.restorant
                                            .lat), parseFloat(order.restorant.lng)),
                                        title: order.restorant.name,
                                        color: "red"
                                    });
                                    bounds.extend(restaurantMarker.position);

                                    //The Client
                                    var clientMarker = new google.maps.Marker({
                                        position: new google.maps.LatLng(parseFloat(order.address
                                            .lat), parseFloat(order.address.lng)),
                                        title: order.address.address,
                                        map,
                                        icon: "/custom/img/pin_client.svg",
                                        color: "red"
                                    });
                                    bounds.extend(clientMarker.position);
                                    clientsAndDriverMarkers.push(clientMarker);

                                    google.maps.event.addListener(clientMarker, 'click', (function(
                                        clientMarker, i) {
                                        var content = "Order <a href=\"/orders/" + order.id +
                                            "\">#" + order.id +
                                            "</a> <a href=\"/orders?restorant_id=" + order
                                            .restorant_id + "\"><strong>" + order.restorant
                                            .name + "</strong></a>";
                                        content +=
                                            "<br />Address <a href=\"/orders?client_id=" + order
                                            .client_id + "\"><strong>" + order.address.address +
                                            "</strong></a>";

                                        return function() {
                                            infowindow.setContent(content);
                                            infowindow.open(map, clientMarker);
                                        }
                                    })(clientMarker, i));


                                    var driverPathToClientCoordinates = [];

                                    //Create new paths, to indicate, from driver, to restaurant if order is not picked up
                                    if (order.laststatus[0].pivot.status_id < 6) {

                                        //Only if this order is not yet picked up
                                        var driverPathToRestaurantCoordinates = [];

                                        driverPathToRestaurantCoordinates.push({
                                            lat: parseFloat(driver.lat),
                                            lng: parseFloat(driver.lng)
                                        });
                                        driverPathToRestaurantCoordinates.push({
                                            lat: parseFloat(order.restorant.lat),
                                            lng: parseFloat(order.restorant.lng)
                                        });
                                        driverPathToClientCoordinates.push({
                                            lat: parseFloat(order.restorant.lat),
                                            lng: parseFloat(order.restorant.lng)
                                        });

                                        const driverPathToResto = new google.maps.Polyline({
                                            path: driverPathToRestaurantCoordinates,
                                            geodesic: true,
                                            strokeColor: "#FF6000",
                                            strokeOpacity: 1.0,
                                            strokeWeight: 2,
                                        });
                                        driverPathToResto.setMap(map);
                                    } else {
                                        driverPathToClientCoordinates.push({
                                            lat: parseFloat(driver.lat),
                                            lng: parseFloat(driver.lng)
                                        });
                                    }



                                    //Complete path to client
                                    driverPathToClientCoordinates.push({
                                        lat: parseFloat(order.address.lat),
                                        lng: parseFloat(order.address.lng)
                                    });

                                    const driverPathToClient = new google.maps.Polyline({
                                        path: driverPathToClientCoordinates,
                                        geodesic: true,
                                        strokeColor: "#FF6000",
                                        strokeOpacity: 1.0,
                                        strokeWeight: 2,
                                    });
                                    driverPathToClient.setMap(map);
                                });

                            }


                        });

                    })
                    .catch(function(error) {

                    });
            };
        </script>
    @endif
@endpush

@include('email_contact_form_popup')

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"></script>
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    function showOrderCountChart(chartData) {
        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: false,
            title: {
                text: "Order count"
            },
            axisX: {
                title: "Date",
            },
            axisY: {
                title: "Order",
                suffix: "",
                includeZero: true
            },
            data: [{
                type: "line",
                name: "CPU Utilization",
                connectNullData: true,
                //nullDataLineDashType: "solid",
                xValueType: "string",
                // xValueFormatString: "DD MMM hh:mm TT",
                // yValueFormatString: "#,##0.##\"%\"",
                // dataPoints: [{
                //         x: 1501048673000,
                //         y: 35.939
                //     },
                //     {
                //         x: 1501052273000,
                //         y: 40.896
                //     },
                //     {
                //         x: 1501055873000,
                //         y: 56.625
                //     },
                //     {
                //         x: 1501059473000,
                //         y: 26.003
                //     },
                //     {
                //         x: 1501063073000,
                //         y: 20.376
                //     },
                //     {
                //         x: 1501066673000,
                //         y: 19.774
                //     },
                //     {
                //         x: 1501070273000,
                //         y: 23.508
                //     },
                //     {
                //         x: 1501073873000,
                //         y: 18.577
                //     },
                //     {
                //         x: 1501077473000,
                //         y: 15.918
                //     },
                //     {
                //         x: 1501081073000,
                //         y: 16.32
                //     }, // Null Data
                //     {
                //         x: 1501084673000,
                //         y: 10.314
                //     },
                //     {
                //         x: 1501088273000,
                //         y: 10.574
                //     },
                //     {
                //         x: 1501091873000,
                //         y: 14.422
                //     },
                //     {
                //         x: 1501095473000,
                //         y: 18.576
                //     },
                //     {
                //         x: 1501099073000,
                //         y: 22.342
                //     },
                //     {
                //         x: 1501102673000,
                //         y: 22.836
                //     },
                //     {
                //         x: 1501106273000,
                //         y: 23.220
                //     },
                //     {
                //         x: 1501109873000,
                //         y: 23.594
                //     },
                //     {
                //         x: 1501113473000,
                //         y: 24.596
                //     },
                //     {
                //         x: 1501117073000,
                //         y: 31.947
                //     },
                //     {
                //         x: 1501120673000,
                //         y: 31.142
                //     }
                // ]
                dataPoints: chartData
            }]
        });
        chart.render();


    }

    function showOrderSalesChart(chartData) {
        var chart = new CanvasJS.Chart("chartContainerSales", {
            animationEnabled: false,
            title: {
                text: "Order sales $"
            },
            axisX: {
                title: "Date",
            },
            axisY: {
                title: "Sales",
                suffix: "",
                includeZero: true
            },
            data: [{
                type: "line",
                name: "CPU Utilization",
                connectNullData: true,
                //nullDataLineDashType: "solid",
                xValueType: "string",
                // xValueFormatString: "DD MMM hh:mm TT",
                // yValueFormatString: "#,##0.##\"%\"",
                // dataPoints: [{
                //         x: 1501048673000,
                //         y: 35.939
                //     },
                //     {
                //         x: 1501052273000,
                //         y: 40.896
                //     },
                //     {
                //         x: 1501055873000,
                //         y: 56.625
                //     },
                //     {
                //         x: 1501059473000,
                //         y: 26.003
                //     },
                //     {
                //         x: 1501063073000,
                //         y: 20.376
                //     },
                //     {
                //         x: 1501066673000,
                //         y: 19.774
                //     },
                //     {
                //         x: 1501070273000,
                //         y: 23.508
                //     },
                //     {
                //         x: 1501073873000,
                //         y: 18.577
                //     },
                //     {
                //         x: 1501077473000,
                //         y: 15.918
                //     },
                //     {
                //         x: 1501081073000,
                //         y: 16.32
                //     }, // Null Data
                //     {
                //         x: 1501084673000,
                //         y: 10.314
                //     },
                //     {
                //         x: 1501088273000,
                //         y: 10.574
                //     },
                //     {
                //         x: 1501091873000,
                //         y: 14.422
                //     },
                //     {
                //         x: 1501095473000,
                //         y: 18.576
                //     },
                //     {
                //         x: 1501099073000,
                //         y: 22.342
                //     },
                //     {
                //         x: 1501102673000,
                //         y: 22.836
                //     },
                //     {
                //         x: 1501106273000,
                //         y: 23.220
                //     },
                //     {
                //         x: 1501109873000,
                //         y: 23.594
                //     },
                //     {
                //         x: 1501113473000,
                //         y: 24.596
                //     },
                //     {
                //         x: 1501117073000,
                //         y: 31.947
                //     },
                //     {
                //         x: 1501120673000,
                //         y: 31.142
                //     }
                // ]
                dataPoints: chartData
            }]
        });
        chart.render();


    }

    // showChart(chartData);

    $(document).ready(function() {
        const getDataUpdateChart = () => {
            // console.log('clicked 2');
            $('#curve_chart').hide();
            $('#filter_loader').show();

            const post_data = {
                _token: "{{ csrf_token() }}",
                startDate: $('#start_time_picker').val(),
                endDate: $('#end_time_picker').val()
            }

            // console.log(post_data);

            $.ajax({
                method: 'POST',
                url: "{{ route('salesvalue') }}",
                data: post_data,
                success: function(response) {
                    console.log('Successfully loaded');
                    console.log(response);

                    // var dataArray = [];
                    var orderCountArray = [];
                    var orderSalesArray = [];

                    for (var i = 0; i < response.data.length; i++) {
                        var rowData = response.data[i];
                        // dataArray.push(rowData);
                        if (i > 0) {
                            // console.log(i);
                            orderCountArray.push({
                                x: new Date(rowData[0]),
                                y: rowData[1]
                            })
                            orderSalesArray.push({
                                x: new Date(rowData[0]),
                                y: rowData[2]
                            })
                        }

                    }

                    // console.log(dataArray);
                    showOrderCountChart(orderCountArray);
                    showOrderSalesChart(orderSalesArray);

                    $('#curve_chart').show();
                    $('#filter_loader').hide();
                },
                error: function(xhr, status, error) {
                    // Handle errors
                    console.error('Request failed with status:', status, 'Error:',
                        error);
                }
            })
        }

        getDataUpdateChart();

        $('#filter_btn').click(getDataUpdateChart);
    });
</script>
