<style>
    .hero_container {
        position: relative;
        text-align: center;
        color: white;
    }


    .title {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: black;
        background-color: rgba(255, 255, 255, 0.7);
        /* opacity: 0.7; */
        /* text-shadow: -1px -1px 0 black, 1px -1px 0 black, -1px 1px 0 black, 1px 1px 0 black; */
        /* text-shadow: 4px 4px 8px #000000; */
        ;
        /* text-outline: 5px black; */
    }

    @media screen and (max-width: 768px) {
        .title {
            font-size: 16px;
        }
    }

    @media screen and (max-width: 480px) {
        .title {
            font-size: 10px;
        }
    }
</style>

<section class="mt-7 mt-md-6 pt-2 bg-soft">
    {{-- <div class="container"> --}}
    {{-- <div class="row justify-content-between align-items-center"> --}}
    {{-- <div class="col-12 col-md-6 order-2 order-lg-1"> --}}
    <div class="w-100 d-flex justify-content-center hero_container">
        <img class="img-fluid" src="{{ asset('impactfront') }}/img/hero 3 images.png" alt="">
        <div class="title h3 rounded p-3" >
            eMenu Solutions: Elevating Dining Experiences Through Innovative Technology
        </div>
    </div>
    {{-- </div> --}}

    {{-- </div> --}}
    {{-- </div> --}}
    {{-- <div class="pattern bottom"></div> --}}
</section>
