<div class="dropdown">
    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-ellipsis-v"></i>
    </a>
    <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">

        @include('restorants.happyhours.inc.modal',['perodDiscount'=>$perodDiscount,'isEditButton'=>true,'id'=>'PDmodal'])

        <form action="{{ route('admin.restaurant.happyHours.delete', $perodDiscount) }}" method="post">
            @csrf
            @method('delete')

            <button type="button" class="dropdown-item" onclick="confirm('{{ __("Are you sure you want to delete this extras?") }}') ? this.parentElement.submit() : ''">
                {{ __('Delete') }}
            </button>
        </form>
    </div>
</div>
