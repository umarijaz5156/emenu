<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLimitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('plan_limits', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('restourant_id')->nullable();
            $table->string('limit_name')->nullable();
            $table->string('value')->nullable();
            $table->timestamps();
            $table->foreign('restourant_id')->references('id')->on('companies');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('limits');
    }
}
