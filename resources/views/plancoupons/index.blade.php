@extends('general.index', $setup)

@section('thead')
    <th>{{ __('Status') }}</th>
    <th>{{ __('Name') }}</th>
    <th>{{ __('Code') }}</th>
    <th>{{ __('Limit number') }}</th>
    <th>{{ __('Used from') }}</th>
    <th>{{ __('Stripe Id') }}</th>
    <th>{{ __('Value') }}</th>
    <th>{{ __('crud.actions') }}</th>
@endsection

@section('tbody')
    @foreach ($setup['items'] as $item)
        <tr>
            <td>
               @if ($item->limit_to_num_uses > 0 && $item->used_count >= $item->limit_to_num_uses)
                    <span class="badge badge-danger">Used</span>
               @else
                    <span class="badge badge-success">Active</span>
               @endif
            </td>

            <td>{{ $item->name }}</td>

            <td>{{ $item->code }}</td>
            <td>{{ $item->limit_to_num_uses }}</td>
            <td>{{ $item->used_count }}</td>
            <td>
                {{ $item->stripe_id }}
            </td>
            <td></td>
            <td>
                {{ $item->price }}
                @if($item->type == 1)
                    %
                @endif
            </td>
            @include('partials.tableactions',$setup)

        </tr>
    @endforeach
@endsection

@include('email_contact_form_popup')
