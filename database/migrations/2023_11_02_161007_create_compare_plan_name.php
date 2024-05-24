<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComparePlanName extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('compare_plan_name', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->string('plan_name');

            $table->string('cost_saving_eco')->default('');
            $table->boolean('no_setup_cost')->defalt(false);
            $table->boolean('eco_friendly')->defalt(false);

            $table->string('boost_your_business')->default('');
            $table->boolean('cut_opt_cost')->defalt(false);
            $table->boolean('detailed_reports')->defalt(false);
            $table->boolean('increase_sales')->defalt(false);
            $table->boolean('savings_foh')->defalt(false);

            $table->string('order_limit')->default('');
            $table->boolean('unlimited_product')->defalt(false);
            $table->string('order_management')->default('');
            $table->boolean('delivery_pick_dine')->defalt(false);
            $table->boolean('payments_gateway')->defalt(false);
            $table->boolean('data_analytics')->defalt(false);

            $table->string('engage_delight')->default('');
            $table->boolean('connect_customers')->defalt(false);
            $table->boolean('control_presence')->defalt(false);
            $table->boolean('customer_supports')->defalt(false);
            $table->boolean('collect_reviews')->defalt(false);

            $table->string('elevate_dining')->default('');
            $table->integer('add_items')->default(0);
            $table->boolean('browse_menu')->defalt(false);
            $table->boolean('call_waiter')->defalt(false);
            $table->boolean('create_dining_experience')->defalt(false);
            $table->boolean('dynamic_pricing')->defalt(false);
            $table->boolean('qr_code_menu')->defalt(false);
            $table->boolean('quick_search')->defalt(false);
            $table->integer('unique_qr_code')->defalt(0);

            $table->string('expand_your_service')->default('');
            $table->boolean('expand_features')->defalt(false);

            $table->string('globalize_business')->default('');
            $table->boolean('custom_domain')->defalt(false);
            $table->boolean('menu_generator')->defalt(false);
            $table->integer('translation_languages')->defalt(0);

            $table->string('menu_control')->default('');
            $table->boolean('allergens')->defalt(false);
            $table->boolean('menu_management')->defalt(false);
            $table->boolean('operational_change')->defalt(false);

            $table->string('adaptable_support')->default('');
            $table->integer('multiple_accounts');
            $table->boolean('support_tickets')->defalt(false);
            $table->boolean('priority_support')->defalt(false);
            $table->integer('qr_scans')->defalt(0);

            $table->string('design')->default('');
            $table->boolean('suitable_business')->defalt(false);
            $table->boolean('add_images')->defalt(false);
            $table->boolean('add_logo')->defalt(false);
            $table->boolean('customizable_design')->defalt(false);
            $table->string('free_themes')->default('Default');
            $table->boolean('instants_updates')->defalt(false);
            $table->boolean('personalise_menu')->defalt(false);
            $table->boolean('view_from_device')->defalt(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('compare_plan_name');
    }
}
