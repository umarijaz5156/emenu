@extends('qrsaas.master')

@section('content')
    <section class="container my-7 bg-white">
        <h1>EmenuSolutions Documents</h1>

        <div>
            <p>
                Welcome to EmenuSolutions! Explore our comprehensive documentation for a detailed guide on
                leveraging
                the
                full potential
                of our platform. Whether you're a seasoned restaurant owner or just starting, our documentation
                provides
                step-by-step
                instructions on account setup, showcasing your culinary delights, and optimizing order management.
                Empower
                your
                restaurant journey with EmenuSolutions – your success starts here!
            </p>

            <p>Let’s start on https://emenusolutions.com/</p>
        </div>

        <div id="plans" class="my-5">
            <h2>Plans:</h2>

            <p>To see all the plans and prices, click the on Prices</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image11.png"></p>

            <p>It will take you to this page https://emenusolutions.com/pricing </p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image2.png"></p>

            <p>You can see all the plans from here. The Plans are shown at yearly price. To switch
                in monthly
                and yearly plans, click on this button.</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image27.png"></p>

            <p>Monthly plans</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image8.png"></p>

            <p>A person can join by clicking join now buttons</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image10.png"></p>

            <p>If plans are viewed monthly, then a monthly plan will be selected during
                registration. Otherwise it will be monthly.</p>

            <p>You can compare all the plans from below of this same page
                https://emenusolutions.com/pricing</p>

            <p><img alt="" class="img-fluid" src="{{ asset('images') }}/docs_12_01_23/image5.png"></p>
            <p>A person also can join with a monthly/yearly plan from here.</p>
        </div>

        <div id="singup">
            <h2>Sign up:</h2>
            <p>Click on this sign up button</p>
            <p><img alt="" class="img-fluid" src="{{ asset('images') }}/docs_12_01_23/image7.png"></p>

            <p>Feel the form here</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image15.png"></p>

            <p>Complete the processes of payment according to the plan that has been selected. You
                will get a verification link by an email from EmenuSolution. Click on the link, you will be
                verified. After
                that, you will be able to login.</p>
        </div>

        <div id="demo_restaurants">
            <h2>Demo Restaurants:</h2>
            <p>Some demo restaurants can be seen if demo option is clicked from the nav bar</p>
            <p><img alt="" class="img-fluid" src="{{ asset('images') }}/docs_12_01_23/image19.png"></p>
        </div>

        <div id="create_a_restaurants">
            <h2>Create a restaurants:</h2>
            <p>A restaurant will be created automatically during registration for the user.</p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image1.png"></p>
        </div>

        <div id="restaurants">
            <h2>Restaurant:</h2>
            <p>To edit details of restaurant, click on restaurant from left sidebar</p>
            <p><img alt="" class="img-fluid" src="{{ asset('images') }}/docs_12_01_23/image3.png"></p>

            <p>Every details of a restaurant can be changed from here</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image25.png"></p>
        </div>

        <div id="add_food">
            <h2>Add food to a restaurant:</h2>
            <p>To add food, click on Menu</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image6.png"></p>

            <p>First, create a category for food</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image16.png"></p>

            <p>Enter category name and click on save button</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image24.png"></p>

            <p>A category will be created. To add a food item, click on add item</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image4.png"></p>

            <p>A new pop up will appear. Feel the food information accordingly</p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image17.png" class="img-fluid"></p>

            <p>Then click on save. It will be added</p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image13.png" class="img-fluid"></p>

            <p>Click on the food item. It will take you to the details page.</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image14.png"></p>

            <p>Click on extra to add extra with the food</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image20.png"></p>


            <p>Now, feel name and price</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image21.png"></p>

            <p>A restaurant owner can view restaurant by clicking this link</p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image26.png" class="img-fluid"></p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image23.png" class="img-fluid"></p>
        </div>


        <div id="delete_food">
            <h2>Delete Food or Category:</h2>
            <p>To delete a food or category, click on menu from your restaurant dashboard</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image9.png"></p>

            <p>Click on delete button on category label</p>
            <p><img class="img-fluid" alt="" src="{{ asset('images') }}/docs_12_01_23/image18.png"></p>

            <p>Category will be deleted.</p>

            <p>Now, to delete food item, click on food item</p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image22.png" class="img-fluid"></p>

            <p>Now click on delete, food item will be deleted</p>
            <p><img alt="" src="{{ asset('images') }}/docs_12_01_23/image12.png" class="img-fluid"></p>
        </div>


        <div id="add_coupons">
            <h2>Add coupons:</h2>
            <p>A restaurant owner can create coupons for his restaurant. When a user uses that
                coupon, he will get some discount. To create coupons, go to your restaurant dashboard. Then click on
                the
                coupon.</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image3.png"></p>

            <p>Click on add coupon</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image11.png"></p>

            <p>Select a type</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image8.png"></p>

            <p>Fill the form and click the save button</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image7.png"></p>

            <p>Coupon will be added</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image2.png"></p>
        </div>

        <div id="use_coupons">
            <h2>How to use coupons:</h2>
            <p>Go to a restaurant, add food items to the cart and go to the checkout page. You will
                see a coupon option.</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image4.png"></p>

            <p>Insert a coupon and click on apply</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image9.png"></p>

            <p>Price will be decreased</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image12.png"></p>
        </div>


        <div id="add_driver">
            <h2>How to add a Driver to restaurant:</h2>
            <p>To add a driver to your restaurant, go to the restaurant dashboard and click on the
                driver menu. </p>
            <p>><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image5.png"></p>

            <p>Click on add driver</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image1.png"></p>

            <p>Fill the information of your driver and click the save button</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image10.png"></p>

            <p>A driver will be created</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/image6.png"></p>
        </div>

        @include('qrsaas.docs.variants')

        <div id="qr_code">
            <h2>How to create QR Code? :</h2>
            <p>To create QR code for your restaurant, go to your restaurant dashboard.</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/qr_code_menu.png"></p>

            <p>QR code page will be opened.</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/qrcodepage.png"></p>

            <p>You can customize the QR code by changing color, style etc.</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/qr_code.png"></p>

            <p>Download your qr code by clicking on download button</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/qr_code_download.png"></p>

            <p>Your qr code will be downloaded with your restaurant url</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/down_status.png"></p>

        </div>

        <div id="add_staff">
            <p>To add staff to your restaurant, go to your restaurant dashboard. Click on staff</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/staff_dashboard.png"></p>

            <p>Click on add new staff</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/add_new_staff.png"></p>

            <p>Fill the information of your staff and click the save button. These info will be account info.</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/staff_account.png"></p>

            <p>A staff will be created</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/created_staff.png"></p>
        </div>

        <div id="delete_staff">

            <p>To delete staff from your restaurant, go to your restaurant dashboard. Click on staff</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/staff_dashboard.png"></p>

            <p>Click on delete staff</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/delete_staff.png"></p>

            <p>Staff will be deleted</p>
            <p><img alt="" src=" {{ asset('images') }}/docs_18_01_23/delete_staff_2.png"></p>

        </div>

        @if(auth()->user() && auth()->user()->hasRole('admin'))
            @include('qrsaas.docs.multitenancy')
        @endif

    </section>
@endSection
