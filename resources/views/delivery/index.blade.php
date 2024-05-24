@extends('general.index', $setup)

@section('tbody')
    <div class="container">
        <div class="row">
            {{-- <div class="col-4">
                <h4>Delivery area Tax:</h4>
            </div> --}}
            <form action="{{ route('updateDeliveryAreaTax') }}" method="POST">
                @csrf
                <div class="col-4">
                    <div class="form-group">
                        <label for="deliveryAreaTax">{{__('Delivery area Tax (percentage)')}}</label>
                        <input type="text" class="form-control" id="deliveryAreaTax" placeholder="Tax %"
                            value="{{ $setup['delivery_area_tax'] }}" name="delivery_area_tax">
                        <input type="hidden" name="restuarent_id" value="{{ $setup['restaurant_id'] }}">
                        <button type="submit" class="btn btn-primary my-2">{{ __('Save') }}</button>
                    </div>
                </div>
            </form>
            {{-- <div class="col-4">
                <button type="button" class="btn btn-primary">{{ __('Save') }}</button>
            </div> --}}
        </div>
    </div>

    @foreach ($setup['items'] as $item)
        <tr>
            <td>{{ $item->name }}</td>
            <td>{{ $item->cost }}</td>
            <td>{{ $item->phone }}</td>
            @include('partials.tableactions', $setup)
        </tr>
    @endforeach
@endsection

@include('email_contact_form_popup')
