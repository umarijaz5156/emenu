<section id="product" class="section section-lg">
    <div class="container">
        <div class="row justify-content-center mb-5 mb-md-7">
            <div class="col-12 col-md-8 text-center">
                <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                <h2 class="h1 font-weight-bolder mb-4 ckedit" key="product_title" id="product_title">
                    {{ __('qrlanding.product_title') }}</h2>
                <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                <p class="lead ckedit" key="product_description" id="product_description">
                    {{ __('qrlanding.product_description') }}</p>
                <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                <p class="lead ckedit" key="product_subtitle" id="product_subtitle">
                    <strong>{{ __('qrlanding.product_subtitle') }}.</strong>
                </p>
            </div>
        </div>
        <div class="row">
            @foreach ($features as $feature)
                @include('qrsaas.partials.product_items', $feature)
            @endforeach

            {{-- <div class="col-12 col-md-6 col-lg-4">
                <div class="card">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                            the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div> --}}
        </div>
    </div>
</section>
