<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeriodDiscountForRestourantTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('period_discounts_for_restourants', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('restourant_id')->nullable();
            $table->foreign('restourant_id')->references('id')->on('companies');

            $table->time('start');
            $table->time('end');
            $table->string('discount_type')->default('percent');
            $table->float('amount',16,2);
            $table->integer('priority')->default(2);
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
        Schema::dropIfExists('period_discounts_for_restourants');
    }
}
