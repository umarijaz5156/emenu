
@if($restorant->happyHours->where('day',$day)->count() )
    <br />
    <div id="{{ $day }}_wrapper">
        <h3>{{__(ucfirst($day))}}</h3>
        @foreach($restorant->happyHours->where('day',$day) as $key => $perodDiscount)
            @include('restorants.happyhours.inc.record',compact(['day','key','perodDiscount','restorant']))
        @endforeach
    </div>
@endif
