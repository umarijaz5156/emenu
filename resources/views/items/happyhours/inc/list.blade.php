@if($item->happyHours->where('day',$day)->count() )
    <div id="{{ $day }}_wrapper">
        <h3>{{ __(ucfirst($day)) }}</h3>
        @foreach($item->happyHours->where('day',$day) as $key => $perodDiscount)
            @include('items.happyhours.inc.record',compact(['day','key','perodDiscount','item']))
        @endforeach
    </div>
@endif
