<div data-aos="zoom-in" class="col-12 col-md-6 col-lg-4 mb-5">
    <div class="card shadow-soft border-light h-100">
        <div class="card-header p-0">
            <img src="{{ $image }}" class="card-img-top rounded-top" alt="image">
        </div>
        <div class="card-body pb-0 ">
            <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
            <h5 class="card-title mt-2 ckedit" <?php echo 'id=' . $title['key']; ?> <?php echo 'key=' . $title['key']; ?>>{{ $title['value'] }}</h3>
                {{-- <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
            <p class="card-text ckedit" <?php echo 'id=' . $subtitle['key']; ?> <?php echo 'key=' . $subtitle['key']; ?>>{{ $subtitle['value'] }}</p> --}}
                {{-- <ul class="list-group d-flex justify-content-center">
                @foreach ($features as $feature)
                    <li class="list-group-item d-flex pl-0 pb-1">
                        <span class="mr-2"><i class="fas fa-check-circle text-success"></i></span>
                        <i class="fas fa-edit mr-2 text-primary ckedit_btn" type="button" style="display: none"></i>
                        <div class="ckedit" <?php echo 'id=' . $feature['key']; ?> <?php echo 'key=' . $feature['key']; ?>>{{ $feature['value'] }}</div>
                    </li>
                @endforeach
            </ul> --}}
        </div>

        {{-- <div class="card-footer">
            <a href="{{ route('newrestaurant.register') }}" class="btn btn-primary w-100">{{ $button_name }}</a>
        </div> --}}
    </div>
</div>
