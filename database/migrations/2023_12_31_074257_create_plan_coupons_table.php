<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlanCouponsTable extends Migration
{
    public function up()
    {
        Schema::create('plan_coupons', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('code', 8);
            $table->unsignedBigInteger('plan_id')->nullable();
            $table->integer('type');
            $table->double('price');
            $table->date('active_from');
            $table->date('active_to');
            $table->integer('limit_to_num_uses');
            $table->integer('used_count');
            $table->timestamps();
            $table->string('stripe_id')->nullable();

            $table->index('plan_id');
            $table->foreign('plan_id')
                ->references('id')->on('plan');
              /*  ->onDelete('cascade')
                ->onUpdate('cascade');*/
        });
    }

    public function down()
    {
        Schema::dropIfExists('plan_coupons');
    }
}
