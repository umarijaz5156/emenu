<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeriodDiscountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('period_discounts', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('item_id')->nullable();
            $table->foreign('item_id')->references('id')->on('items');

            $table->time('start');
            $table->time('end');
            $table->string('discount_type');
            $table->float('amount',16,2);
            $table->integer('priority')->default(1);
            $table->enum('day', ['monday', 'tuesday','wednesday','thursday','friday','saturday','sunday']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('period_discounts');
    }
}
