<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropColumnFromPlanCouponsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('plan_coupons', function (Blueprint $table) {
            if (Schema::hasColumn('plan_coupons', 'coupon_type'))
            {
                Schema::table('plan_coupons', function (Blueprint $table)
                {
                    $table->dropColumn('coupon_type');
                });
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('plan_coupons', function (Blueprint $table) {
            //
        });
    }
}
