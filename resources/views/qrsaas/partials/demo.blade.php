 <!-- DEMO -->
 <section id="demo" class="section section-lg pb-5 bg-soft">
     <div class="container">
         <div class="row">
             <div class="col-12 text-center mb-5">
                 <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                 <h2 class="mb-4 ckedit" key="demo_title" id="demo_title">{{ __('qrlanding.demo_title') }}</h2>
                 <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                 <p class="lead mb-5 ckedit" key="demo_subtitle" id="demo_subtitle">
                     {{ __('qrlanding.demo_subtitle') . ' ' }}<span
                         class="font-weight-bolder">{{ __('qrlanding.qr_code') }}</span> {{ __('qrlanding.below') }}!
                 </p>

                 <div class="row">
                     <div class="col-12 my-2">
                         <div class="row">
                             <div data-aos="fade-right" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 p-2 rounded" style="background: #4472c4;">
                                     <img class="img-fluid w-25" src="{{ asset('images') }}/demo qr/demo 1.jpg" />
                                 </div>
                             </div>
                             <div data-aos="fade-left"  class="col-12 col-md-6">
                                 <div class="h-100 mx-0 p-2 pt-5 rounded" style="background: #4472c4;">
                                     <p class="demo_text text-white">
                                         Discover chicken bliss at Poultry Delight. Savor the best in every bite, from
                                         tender grilled favorites to crispy delights. Your taste buds, our priority!
                                     </p>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="col-12 my-2">
                         <div class="row">
                             <div data-aos="fade-right" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 px-2 py-3 rounded" style="background: #cfd5ea;">
                                     <p class="demo_text">
                                         Welcome to Gastronomic Pleasures, where culinary excellence meets your palate's
                                         desires. Immerse yourself in a world of delectable delights, crafted with
                                         passion
                                         and precision. From savory starters to mouthwatering mains, our menu is a
                                         symphony
                                         of flavors, curated to elevate your dining experiece.
                                     </p>
                                 </div>
                             </div>
                             <div data-aos="fade-left" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 p-2 rounded" style="background: #cfd5ea;">
                                     <img class="img-fluid w-25" src="{{ asset('images') }}/demo qr/demo 2.jpg" />
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="col-12 my-2">
                         <div class="row">
                             <div data-aos="fade-right" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 p-2 rounded" style="background: #e9ebf5;">
                                     <img class="img-fluid w-25" src="{{ asset('images') }}/demo qr/demo 3.jpg" />
                                 </div>
                             </div>
                             <div data-aos="fade-left" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 px-2 pt-1 rounded" style="background: #e9ebf5;">
                                     <p class="demo_text">
                                         Dive into our world of pasta delights! Each dish is a flavorful tale, blending
                                         tradition and authenticity. Here, pasta becomes an unforgettable culinary
                                         experience, offering freshness, flavors, and perfect textures in every bite.
                                         Welcome to our universe where quality and passion converge to dazzle your taste
                                         buds.
                                     </p>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="col-12 my-2">
                         <div class="row">
                             <div data-aos="fade-right" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 p-2 rounded pt-4" style="background: #cfd5ea;">
                                     <p class="demo_text">
                                         Discover a world of elegance and flavors in our bar. Each
                                         drink is a complete
                                         experience, a unique blend that awakens the senses. Join us to explore creative
                                         cocktails and carefully selected spirits. Welcome to a universe where every sip
                                         is
                                         an invitation to the extraordinary.
                                     </p>
                                 </div>
                             </div>
                             <div data-aos="fade-left" class="col-12 col-md-6">
                                 <div class="h-100 mx-0 p-2 rounded" style="background: #cfd5ea;">
                                     <img class="img-fluid w-25" src="{{ asset('images') }}/demo qr/demo 4.jpg" />
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 {{-- <div class="col-12 text-center">
                <!-- Button Modal -->
                <a href="{{ route('newrestaurant.register') }}" class="btn btn-secondary animate-up-2"><span class="mr-2"><i class="fas fa-hand-pointer"></i></span>{{ __('qrlanding.demo_button') }}</a>
            </div> --}}
             </div>
         </div>
 </section>


 <style>
     @import url('https://fonts.googleapis.com/css2?family=Source+Serif+4:ital,opsz,wght@1,8..60,400&display=swap');

     .demo_text {
         font-family: 'Source Serif 4', serif;
         /* font-weight: 800; */
         color: #333333;
         /* text-shadow: ; */
     }
 </style>
