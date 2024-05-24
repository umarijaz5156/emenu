
<!-- allergen info -->
<div id="allergens" class='holder-left {{  !$canDoOrdering?"fullHolder":""  }} @if(isset($asTab)) content-tab @endif'>
    <div class='full-width'>
        <div class='box-info'>
            <div class='head align-center'>
                <h3>{{ __('Allergens') }}</h3>
            </div>
            <div class='content'>
                <!-- alergens legend -->
                @if (isset($allergens) && count($allergens)>0)
                    <div class='categories_title'>{{__('Allergens')}}</div>
                    <nav class="d-flex flex-wrap p-1 p-md-4 m-1 m-md-4">

                        @foreach ($allergens as $key => $allergen)

                            <div class='item m-1'>
                                <div class='allergen' >
                                    <img style="width: 25px" src="{{$allergen->image_link}}" />
                                </div>
                                    <?php echo " ".$allergen->title ?>
                            </div>

                        @endforeach


                    </nav>

                @endif
                <!-- alergens legend -->
            </div>
        </div>
    </div>
</div>
