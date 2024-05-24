@extends('general.index', $setup)

@section('thead')
    <th>{{ __('Status') }}</th>
    <th>{{ __('Name') }}</th>
    <th>{{ __('Code') }}</th>
    <th>{{ __('Used number') }}</th>
    <th>{{ __('Total uses') }}</th>
    <th>{{ __('Used from') }}</th>
    <th>{{ __('Used to') }}</th>
    <th>{{ __('crud.actions') }}</th>
    <th>{{ __('redeem') }}</th>
@endsection
@section('tbody')
    @foreach ($setup['items'] as $item)
        <tr>
            <td>
               @if ($item->limit_to_num_uses == 0 && $item->used_count >= $item->limit_to_num_uses)
                    <span class="badge badge-danger">Used</span>
               @else
                    <span class="badge badge-success">Active</span>
               @endif
            </td>
            <td>{{ $item->name }}</td>
            <td>{{ $item->code }}</td>
            <td>{!! $item->used_count !!}</td>
            <td>{!! $item->used_count+$item->limit_to_num_uses !!}</td>
            <td>{{ $item->active_from }}</td>
            <td>{{ $item->active_to }}</td>
            @include('partials.tableactions',$setup)
            <td>
                @if ($item->limit_to_num_uses == 1 && $item->used_count ==0)
                    <a href="{{ route('admin.restaurant.coupons.use',[$parameter_name]=$item->id) }}" class="btn btn-success btn-sm">{{ __('Client redeem the award') }}</a>
                @endif
            </td>


        </tr>
    @endforeach
@endsection

@include('email_contact_form_popup')
