<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />


<style>
    html,
    body {
        position: relative;
        height: 100%;
    }

    body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
    }

    .swiper {
        width: 100%;
        /* height: 100%; */
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #eeeeee;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .swiper-wrapper {
        height: auto;
    }
</style>


<!-- Testimonials -->
<section id="testimonials" class="section section-lg">
    <div class="container">

        <div class="row justify-content-center mb-2 mb-lg-2">
            <div class="col-12 col-md-8 text-center">
                <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                <h1 class="h1 font-weight-bolder mb-4 ckedit" key="testimonials_title" id="testimonials_title">
                    {{ __('qrlanding.testimonials_title') }}</h1>
                <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                <p class="lead ckedit" key="testimonials_subtitle" id="testimonials_subtitle">
                    {{ __('qrlanding.testimonials_subtitle') }}</p>
            </div>
        </div>


        <!-- Swiper -->
        <div class="swiper mySwiper my-3">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/1.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">BrewTech Café</h5>
                            <p class="card-text">
                                "eMenuSolutions transformed our café! It's eco-friendly, and our customers love the
                                seamless browsing. Delighted with the dynamic pricing!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/2.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Flavor Fusion Restaurants</h5>
                            <p class="card-text">
                                "Flavor Fusion's efficiency soared with eMenuSolutions. Increased sales, multilingual
                                support – a game-changer for our business!".</p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/3.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Gourmet Gaze</h5>
                            <p class="card-text">
                                "The personalization options are a gem! Real-time updates have elevated our menu.
                                Thanks, eMenuSolutions, for an incredible tool!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/4.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Organic Oasis</h5>
                            <p class="card-text">
                                "Managing allergens became a breeze with eMenuSolutions. It's cost-effective and
                                eco-friendly – perfect for our restaurant!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/5.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Savory Solutions Inc.</h5>
                            <p class="card-text">
                                5 Savory Solutions Inc. "Effortless menu control, unbeatable support! eMenuSolutions is
                                a must for restaurants of any size."
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/6.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">StreetSide Bistros</h5>
                            <p class="card-text">
                                "StreetSide Bistros has thrived with eMenuSolutions' priority service. The QR-based menu
                                is a hit among our tech-savvy patrons!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/7.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Serenity Bakery</h5>
                            <p class="card-text">
                                "Customizable templates and great support! eMenuSolutions helped us establish our
                                bakery's brand online."
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/8.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Global Flavors Eatery</h5>
                            <p class="card-text">
                                "Insights galore! eMenuSolutions streamlined our processes and elevated our customers'
                                dining experience."
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/9.png" class="card-img-top" alt="">
                        <div class="card-body">
                            <h5 class="card-title">Hoppy Hangout</h5>
                            <p class="card-text">
                                "Real-time updates and cross-device access have simplified our operations.
                                eMenuSolutions is adaptable and efficient!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/10.png" class="card-img-top"
                            alt="">
                        <div class="card-body">
                            <h5 class="card-title">Culinary Concoctions</h5>
                            <p class="card-text">
                                "eMenuSolutions expanded our services effortlessly. The QR-code system is a hit among
                                our diverse clientele!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/11.png" class="card-img-top"
                            alt="">
                        <div class="card-body">
                            <h5 class="card-title">Tasty Treats Catering</h5>
                            <p class="card-text">
                                "The custom domain added flair to our brand! eMenuSolutions' support team is top-notch
                                and responsive."
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/12.png" class="card-img-top"
                            alt="">
                        <div class="card-body">
                            <h5 class="card-title">Social Sips</h5>
                            <p class="card-text">
                                "Social Sips gained traction online with eMenuSolutions. An eco-friendly approach and
                                ease of updates – highly recommended!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/13.png" class="card-img-top"
                            alt="">
                        <div class="card-body">
                            <h5 class="card-title">Foodie Fusions</h5>
                            <p class="card-text">
                                "A scalable solution! Thanks to eMenuSolutions' multi-language support, we've broadened
                                our customer base."
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/14.png" class="card-img-top"
                            alt="">
                        <div class="card-body">
                            <h5 class="card-title">GrillHouse Gourmet</h5>
                            <p class="card-text">
                                "Sizzle & Sip has seen unparalleled efficiency with eMenuSolutions. It's revolutionized
                                our restaurant operations!"
                            </p>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="card" style="background: #eee">
                        <img src=" {{ asset('images') }}/logo for feedback/15.png" class="card-img-top"
                            alt="">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Symphony Chocolatiers</h5>
                            <p class="card-text">
                                "Engaging customers online has never been easier! eMenuSolutions brought our chocolate
                                experience to the next level."
                            </p>
                        </div>
                    </div>
                </div>



                <!-- <div class="swiper-slide">Slide 2</div>
                <div class="swiper-slide">Slide 3</div>
                <div class="swiper-slide">Slide 4</div>
                <div class="swiper-slide">Slide 5</div>
                <div class="swiper-slide">Slide 6</div>
                <div class="swiper-slide">Slide 7</div>
                <div class="swiper-slide">Slide 8</div>
                <div class="swiper-slide">Slide 9</div> -->
            </div>
            <div class="swiper-pagination"></div>
        </div>


        {{-- 
        <div class="row mb-lg-5">
            <div class="col-12 col-lg-6">
                <div class="customer-testimonial d-flex mb-5">
                    <img src="https://randomuser.me/api/portraits/men/74.jpg"
                        class="image image-sm mr-3 rounded-circle shadow" alt="">
                    <div class="content bg-soft shadow-soft border border-light rounded position-relative p-4">
                        <div class="d-flex mb-4">
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                        </div>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="mt-2 ckedit" key="testimonial1" id="testimonial1">
                            {{ '"' . __('qrlanding.testimonial1') . '"' }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="h6 ckedit" key="testimonial1_author" id="testimonial1_author">
                            {{ '- ' . __('qrlanding.testimonial1_author') }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="ml-0 ml-md-2 ckedit" key="testimonial1_restaurant" id="testimonial1_restaurant">
                            <small>{{ __('qrlanding.testimonial1_restaurant') }}</small>
                        </p>
                    </div>
                </div>
                <div class="customer-testimonial d-flex mb-5">
                    <img src="https://randomuser.me/api/portraits/men/62.jpg"
                        class="image image-sm mr-3 rounded-circle shadow" alt="">
                    <div class="content bg-soft shadow-soft border border-light rounded position-relative p-4">
                        <div class="d-flex mb-4">
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                        </div>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="mt-2 ckedit" key="testimonial2" id="testimonial2">"{{ __('qrlanding.testimonial2') }}"
                        </p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="h6 ckedit" key="testimonial2_author" id="testimonial2_author">-
                            {{ __('qrlanding.testimonial2_author') }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="ml-0 ml-md-2 ckedit" key="testimonial2_restaurant" id="testimonial2_restaurant">
                            <small>{{ __('qrlanding.testimonial2_restaurant') }}</small>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-6 pt-lg-6">
                <div class="customer-testimonial d-flex mb-5">
                    <img src="https://randomuser.me/api/portraits/women/32.jpg"
                        class="image image-sm mr-3 rounded-circle shadow" alt="">
                    <div class="content bg-soft shadow-soft border border-light rounded position-relative p-4">
                        <div class="d-flex mb-4">
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                        </div>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="mt-2 ckedit" key="testimonial3" id="testimonial3">
                            {{ '"' . __('qrlanding.testimonial3') . '"' }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="h6 ckedit" key="testimonial3_author" id="testimonial3_author">
                            {{ '- ' . __('qrlanding.testimonial3_author') }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="ml-0 ml-md-2 ckedit" key="testimonial3_restaurant" id="testimonial3_restaurant">
                            <small>{{ __('qrlanding.testimonial3_restaurant') }}</small>
                        </p>
                    </div>
                </div>
                <div class="customer-testimonial d-flex mb-5">
                    <img src="https://randomuser.me/api/portraits/men/61.jpg"
                        class="image image-sm mr-3 rounded-circle shadow" alt="">
                    <div class="content bg-soft shadow-soft border border-light rounded position-relative p-4">
                        <div class="d-flex mb-4">
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                            <span class="text-warning mr-2"><i class="star fas fa-star"></i></span>
                        </div>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="mt-2 ckedit" key="testimonial4" id="testimonial4">
                            {{ '"' . __('qrlanding.testimonial4') . '"' }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="h6 ckedit" key="testimonial4_author" id="testimonial4_author">
                            {{ '- ' . __('qrlanding.testimonial4_author') }}</p>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <p class="ml-0 ml-md-2 ckedit" key="testimonial4_restaurant" id="testimonial4_restaurant">
                            <small>{{ __('qrlanding.testimonial4_restaurant') }}</small>
                        </p>
                    </div>
                </div>
            </div>
        </div> --}}

    </div>
</section>


<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 10,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        breakpoints: {
            640: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 40,
            },
            1024: {
                slidesPerView: 4,
                spaceBetween: 50,
            },
        },
    });
</script>
