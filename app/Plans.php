<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\HasConfig;
use Stancl\Tenancy\Database\Concerns\BelongsToTenant;
use Stancl\Tenancy\Database\Concerns\CentralConnection;
use Stancl\Tenancy\Database\Concerns\TenantConnection;

class Plans extends Model
{
    use SoftDeletes;
    use HasConfig;
    use BelongsToTenant;

    protected $modelName="App\Plans";
    protected $table = 'plan';
}
