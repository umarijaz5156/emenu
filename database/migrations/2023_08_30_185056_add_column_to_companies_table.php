<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnToCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('companies', function (Blueprint $table) {
              $table->integer('show_price')->default(1);
              $table->string('badge_1')->nullable();
              $table->string('badge_2')->nullable();
              $table->string('badge_3')->nullable();
              $table->string('badge_4')->nullable();
              $table->string('badge_5')->nullable();
              $table->string('GoogleReview')->nullable();
               $table->string('TripAdvisor')->nullable();
               $table->integer('qr_count')->nullable();
            $table->integer('staff_count')->nullable();
              
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('companies', function (Blueprint $table) {
            //
        });
    }
}
