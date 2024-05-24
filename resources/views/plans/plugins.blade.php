<div class="row">
    <div class="col-md-6 mt-3" style="background-color: aliceblue;">
        <h6 class="heading-small text-muted mb-4">{{ __('Plugins') }}</h6>
        <label for="pluginsSelector">{{ __('Select available plugins or leave empty for all') }}</label><br />
            <?php
                $perviousPlans=isset($plan)?json_decode($plan->getConfig('plugins','[]'),false):[];

            ?>
        {{-- Libraries for toggle buttons --}}



            @foreach ($allplugins as $plugin)
                @if($plugin->alias == 'orderdatetime')
                    {{-- orderdatetime is hidden --}}
                {{--  <input class="hidden" name = "pluginsSelector[]" value="{{$plugin->alias}}"  id="plugin{{$plugin->alias}}" @if (is_array($perviousPlans)&&in_array($plugin->alias,$perviousPlans)) checked @endif
                 type="checkbox"  data-toggle="toggle" data-size="xs" checked><label>{{ strlen($plugin->name)>0?$plugin->name:ucfirst($plugin->alias) }}</label> <br/> --}}
             @else
                 <input name = "pluginsSelector[]" value="{{$plugin->alias}}"  id="plugin{{$plugin->alias}}" @if (is_array($perviousPlans)&&in_array($plugin->alias,$perviousPlans)) checked @endif
                 type="checkbox"  data-toggle="toggle" data-size="xs"><label>{{ strlen($plugin->name)>0?$plugin->name:ucfirst($plugin->alias) }}</label> <br/>
                 {{--   <option @if (is_array($perviousPlans)&&in_array($plugin->alias,$perviousPlans))
                        selected
                @endif id="plugin{{$plugin->alias}}" value="{{$plugin->alias}}">{{ strlen($plugin->name)>0?$plugin->name:ucfirst($plugin->alias) }}</option> --}}
                @endif
            @endforeach
    </div>

</div>
