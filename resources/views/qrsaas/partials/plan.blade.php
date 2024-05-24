<div class="col-12 col-lg-{{ $col }} mb-5 {{ $plan['period'] == 1 ? 'monthly_plan' : 'yearly_plan' }}"
    style="display: none;">
    <!-- Card -->
    <div class="card shadow-soft px-2 h-100">
        <div class="card-header border-light py-5 px-4">
            <!-- Price -->
            <div class="d-flex mb-3 text-primary">
                @if ($plan['price'])
                    <span class="h5 mb-0"> {{ config('settings.cashier_currency') }}</span>
                @endif

                <span class="price display-{{ $plan['price'] ? '2' : '3' }} mb-0 text-primary" data-annual="0"
                    data-monthly="0">
                    {{ $plan['price'] ? $plan['price'] : 'Ask for quote' }}
                </span>
                @if ($plan['price'])
                    <span
                        class="h6 font-weight-normal align-self-end">/{{ $plan['period'] == 1 ? __('qrlanding.month') : __('qrlanding.year') }}
                    </span>
                    {{-- @else
                    <span class="h6 font-weight-normal align-self-end">a</span> --}}
                @endif
            </div>

            @if ($plan['monthly_price'] != 0 && $plan['price'])
                {{-- @if ($plan['period'] == 1) --}}
                <div class="d-flex justify-content-between mb-3 font-weight-normal">
                    <div>
                        <s class="font-weight-norma">${{ $plan['monthly_price'] }} X 12 =
                            ${{ $plan['monthly_price'] * 12 }}</s>
                    </div>

                    <div class="text-danger">
                        Save
                        {{ round(100 - ($plan['price'] / (($plan['monthly_price'] == 0 ? 1 : $plan['monthly_price']) * 12)) * 100) }}%
                    </div>
                </div>
            @elseif ($plan['price'])
                <div class="d-flex justify-content-between my-3 font-weight-normal">
                    <span>&nbsp;</span>
                </div>
            @else
                <div class="d-flex justify-content-between my-4 font-weight-normal">
                    <span>&nbsp;</span>
                </div>
            @endif

            <h4 class="mb-3 text-black">{{ __($plan['name']) }}</h4>
            <p class="font-weight-normal mb-0" style="height: 150px">
                {{ __($plan['description']) }}
            </p>
        </div>
        <div class="card-body pt-5">
            <ul class="list-group simple-list">
                @foreach (explode(',', $plan['features']) as $feature)
                    <li class="list-group-item font-weight-normal"><span class="icon-primary"><i
                                class="fas fa-check"></i></span>{{ __($feature) }}</li>
                @endforeach
            </ul>
        </div>
        <div class="card-footer px-4 pb-4">
            <!-- Button -->
            <a href="{{ route('newrestaurant.register', ['plan' => $plan['id']]) }}"
                class="btn btn-block btn-outline-gray animate-up-2">
                {{ __('qrlanding.join_now') . ' ' }}<span class="icon icon-xs ml-3"><i
                        class="fas fa-arrow-right"></i></span>
            </a>
        </div>
    </div>
</div>
