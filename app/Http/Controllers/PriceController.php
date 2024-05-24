<?php

namespace App\Http\Controllers;

use App\Models\ComparePlan;
use App\Models\Label;
use App\Plans;
use App\Pages;
use Illuminate\Support\Facades\Cookie;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Stancl\Tenancy\Facades\Tenancy;

class PriceController extends Controller
{
    public function index()
    {

        $locale = Cookie::get('lang') ? Cookie::get('lang') : config('settings.app_locale');
        // $route = Route::current();
        $name = Route::currentRouteName();
        $query = 'lang.';
        if (substr($name, 0, strlen($query)) === $query) {
            //this is language route
            $exploded = explode('.', $name);
            $lang = strtoupper($exploded[1]);
            $locale = $lang;
        }
        // App::setLocale(strtolower($locale));
        // session(['applocale_change' => strtolower($locale)]);


        $availableLanguagesENV = config('settings.front_languages');
        $exploded = explode(',', $availableLanguagesENV);
        $availableLanguages = [];
        for ($i = 0; $i < count($exploded); $i += 2) {
            $availableLanguages[$exploded[$i]] = $exploded[$i + 1];
        }


        $colCounter = [4, 12, 6, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4];
        $plans = config('settings.forceUserToPay', false) ? Plans::where('id', '!=', intval(config('settings.free_pricing_id')))->get()->toArray() : Plans::get()->toArray();
        $compare_plans = ComparePlan::all();
        $basic_plan = null;
        $premium_plan = null;
        $enterprise_plan = null;

        // dd($plans);

        //if we are on central domain
        $tenant = tenancy()->tenant;
        if ($tenant == null) {
            $plans = config('settings.forceUserToPay', false) ? Plans::where('id', '!=', intval(config('settings.free_pricing_id')))->where('tenant_id', null)->orWhere('tenant_id','=','')->get()->toArray() : Plans::where('tenant_id', null)->orWhere('tenant_id','=','')->get()->toArray();
        }
//
        foreach ($compare_plans as $plan) {
            if ($basic_plan == null && $plan->plan_name == 'basic_plan') {
                $basic_plan = $plan;
            } else if ($premium_plan == null && $plan->plan_name == 'premium_plan') {
                $premium_plan = $plan;
            } else if ($enterprise_plan == null && $plan->plan_name == 'enterprise_plan') {
                $enterprise_plan = $plan;
            }
        }

        $labels = Label::where('table_name', 'compare_plan_name')->get();

        // dd('asasa');
        // dd($plans);


        return view('qrsaas.pricing', [
            'availableLanguages' => $availableLanguages,
            'locale' => $locale,
            'col' => $colCounter[count($plans)],
            'plans' => $plans,
            'basic_plan' => $basic_plan,
            'premium_plan' => $premium_plan,
            'enterprise_plan' => $enterprise_plan,
            'pages' => Pages::where('showAsLink', 1)->get(),
            'labels' => $labels
        ]);
    }

    public function compare_price(Request $request)
    {
        $basic_plan = ComparePlan::where('plan_name', 'basic_plan')->first();
        $premium_plan = ComparePlan::where('plan_name', 'premium_plan')->first();
        $enterprise_plan = ComparePlan::where('plan_name', 'enterprise_plan')->first();

        $db_labels = Label::where('table_name', 'compare_plan_name')->get();
        foreach ($db_labels as $label) {

            // if ($label->slug === 'compare_plan_name_features') {
            //     $label->name = $request->all_labels['compare_plan_name_features'];
            //     $label->save();
            // }
            if ($label->slug === 'compare_plan_name_cost_saving_eco') {
                $label->name = $request->all_labels['compare_plan_name_cost_saving_eco'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_no_setup_cost') {
                $label->name = $request->all_labels['compare_plan_name_no_setup_cost'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_eco_friendly') {
                $label->name = $request->all_labels['compare_plan_name_eco_friendly'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_boost_your_business') {
                $label->name = $request->all_labels['compare_plan_name_boost_your_business'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_cut_opt_cost') {
                $label->name = $request->all_labels['compare_plan_name_cut_opt_cost'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_detailed_reports') {
                $label->name = $request->all_labels['compare_plan_name_detailed_reports'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_increase_sales') {
                $label->name = $request->all_labels['compare_plan_name_increase_sales'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_saving_foh') {
                $label->name = $request->all_labels['compare_plan_name_saving_foh'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_order_limit') {
                $label->name = $request->all_labels['compare_plan_name_order_limit'];
                $label->save();
            }
            // if ($label->slug === 'compare_plan_name_unlimited_product') {
            //     $label->name = $request->all_labels['compare_plan_name_unlimited_product'];
            //     $label->save();
            // }
            if ($label->slug === 'compare_plan_name_order_management') {
                $label->name = $request->all_labels['compare_plan_name_order_management'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_delivery_pick_dine') {
                $label->name = $request->all_labels['compare_plan_name_delivery_pick_dine'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_payments_gateway') {
                $label->name = $request->all_labels['compare_plan_name_payments_gateway'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_engage') {
                $label->name = $request->all_labels['compare_plan_name_engage'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_connect_customers') {
                $label->name = $request->all_labels['compare_plan_name_connect_customers'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_control_presence') {
                $label->name = $request->all_labels['compare_plan_name_control_presence'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_customer_support') {
                $label->name = $request->all_labels['compare_plan_name_customer_support'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_collect_reviews') {
                $label->name = $request->all_labels['compare_plan_name_collect_reviews'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_elevate_dining_experience') {
                $label->name = $request->all_labels['compare_plan_name_elevate_dining_experience'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_add_items') {
                $label->name = $request->all_labels['compare_plan_name_add_items'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_browse_menu') {
                $label->name = $request->all_labels['compare_plan_name_browse_menu'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_call_waiter') {
                $label->name = $request->all_labels['compare_plan_name_call_waiter'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_create_dining_experience') {
                $label->name = $request->all_labels['compare_plan_name_create_dining_experience'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_dynamic_pricing') {
                $label->name = $request->all_labels['compare_plan_name_dynamic_pricing'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_qr_code_menu') {
                $label->name = $request->all_labels['compare_plan_name_qr_code_menu'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_quick_search') {
                $label->name = $request->all_labels['compare_plan_name_quick_search'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_unique_qr_code') {
                $label->name = $request->all_labels['compare_plan_name_unique_qr_code'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_expand') {
                $label->name = $request->all_labels['compare_plan_name_expand'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_expand_features') {
                $label->name = $request->all_labels['compare_plan_name_expand_features'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_globalize') {
                $label->name = $request->all_labels['compare_plan_name_globalize'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_custom_domain') {
                $label->name = $request->all_labels['compare_plan_name_custom_domain'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_menu_generator') {
                $label->name = $request->all_labels['compare_plan_name_menu_generator'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_translation') {
                $label->name = $request->all_labels['compare_plan_name_translation'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_effortless_menu_control') {
                $label->name = $request->all_labels['compare_plan_name_effortless_menu_control'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_allergens') {
                $label->name = $request->all_labels['compare_plan_name_allergens'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_menu_management') {
                $label->name = $request->all_labels['compare_plan_name_menu_management'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_optional_change') {
                $label->name = $request->all_labels['compare_plan_name_optional_change'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_support') {
                $label->name = $request->all_labels['compare_plan_name_support'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_multiple_accounts') {
                $label->name = $request->all_labels['compare_plan_name_multiple_accounts'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_support_tickets') {
                $label->name = $request->all_labels['compare_plan_name_support_tickets'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_priority_support') {
                $label->name = $request->all_labels['compare_plan_name_priority_support'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_qr_scans') {
                $label->name = $request->all_labels['compare_plan_name_qr_scans'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_design_it_your_way') {
                $label->name = $request->all_labels['compare_plan_name_design_it_your_way'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_suitable_business') {
                $label->name = $request->all_labels['compare_plan_name_suitable_business'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_add_images') {
                $label->name = $request->all_labels['compare_plan_name_add_images'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_add_logo') {
                $label->name = $request->all_labels['compare_plan_name_add_logo'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_customizable_design') {
                $label->name = $request->all_labels['compare_plan_name_customizable_design'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_free_themes') {
                $label->name = $request->all_labels['compare_plan_name_free_themes'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_instant_updates') {
                $label->name = $request->all_labels['compare_plan_name_instant_updates'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_personalise_menu') {
                $label->name = $request->all_labels['compare_plan_name_personalise_menu'];
                $label->save();
            }
            if ($label->slug === 'compare_plan_name_view_from_device') {
                $label->name = $request->all_labels['compare_plan_name_view_from_device'];
                $label->save();
            }


        }

        $basic_plan->no_setup_cost = $request->basic_plan_no_setup_cost;
        $premium_plan->no_setup_cost = $request->premium_plan_no_setup_cost;
        $enterprise_plan->no_setup_cost = $request->enterprise_plan_no_setup_cost;

        $basic_plan->eco_friendly = $request->basic_plan_eco_friendly;
        $premium_plan->eco_friendly = $request->premium_plan_eco_friendly;
        $enterprise_plan->eco_friendly = $request->enterprise_plan_eco_friendly;

        $basic_plan->cut_opt_cost = $request->basic_plan_cut_opt_cost;
        $premium_plan->cut_opt_cost = $request->premium_plan_cut_opt_cost;
        $enterprise_plan->cut_opt_cost = $request->enterprise_plan_cut_opt_cost;

        $basic_plan->detailed_reports = $request->basic_plan_detailed_reports;
        $premium_plan->detailed_reports = $request->premium_plan_detailed_reports;
        $enterprise_plan->detailed_reports = $request->enterprise_plan_detailed_reports;

        $basic_plan->increase_sales = $request->basic_plan_increase_sales;
        $premium_plan->increase_sales = $request->premium_plan_increase_sales;
        $enterprise_plan->increase_sales = $request->enterprise_plan_increase_sales;

        $basic_plan->savings_foh = $request->basic_plan_saving_foh;
        $premium_plan->savings_foh = $request->premium_plan_saving_foh;
        $enterprise_plan->savings_foh = $request->enterprise_plan_saving_foh;

        $basic_plan->order_limit = $request->basic_plan_order_limit;
        $premium_plan->order_limit = $request->premium_plan_order_limit;
        $enterprise_plan->order_limit = $request->enterprise_plan_order_limit;

        // $basic_plan->unlimited_product = $request->basic_plan_unlimited_product;
        // $premium_plan->unlimited_product = $request->premium_plan_unlimited_product;
        // $enterprise_plan->unlimited_product = $request->enterprise_plan_unlimited_product;

        $basic_plan->delivery_pick_dine = $request->basic_plan_delivery_pick_dine;
        $premium_plan->delivery_pick_dine = $request->premium_plan_delivery_pick_dine;
        $enterprise_plan->delivery_pick_dine = $request->enterprise_plan_delivery_pick_dine;

        $basic_plan->payments_gateway = $request->basic_plan_payments_gateway;
        $premium_plan->payments_gateway = $request->premium_plan_payments_gateway;
        $enterprise_plan->payments_gateway = $request->enterprise_plan_payments_gateway;

        $basic_plan->data_analytics = $request->basic_plan_data_analytics;
        $premium_plan->data_analytics = $request->premium_plan_data_analytics;
        $enterprise_plan->data_analytics = $request->enterprise_plan_data_analytics;

        $basic_plan->connect_customers = $request->basic_plan_connect_customers;
        $premium_plan->connect_customers = $request->premium_plan_connect_customers;
        $enterprise_plan->connect_customers = $request->enterprise_plan_connect_customers;

        $basic_plan->control_presence = $request->basic_plan_control_presence;
        $premium_plan->control_presence = $request->premium_plan_control_presence;
        $enterprise_plan->control_presence = $request->enterprise_plan_control_presence;

        $basic_plan->customer_supports = $request->basic_plan_customer_supports;
        $premium_plan->customer_supports = $request->premium_plan_customer_supports;
        $enterprise_plan->customer_supports = $request->enterprise_plan_customer_supports;

        $basic_plan->collect_reviews = $request->basic_plan_collect_reviews;
        $premium_plan->collect_reviews = $request->premium_plan_collect_reviews;
        $enterprise_plan->collect_reviews = $request->enterprise_plan_collect_reviews;

        $basic_plan->add_items = $request->basic_plan_add_items;
        $premium_plan->add_items = $request->premium_plan_add_items;
        $enterprise_plan->add_items = $request->enterprise_plan_add_items;

        $basic_plan->browse_menu = $request->basic_plan_browse_menu;
        $premium_plan->browse_menu = $request->premium_plan_browse_menu;
        $enterprise_plan->browse_menu = $request->enterprise_plan_browse_menu;

        $basic_plan->call_waiter = $request->basic_plan_call_waiter;
        $premium_plan->call_waiter = $request->premium_plan_call_waiter;
        $enterprise_plan->call_waiter = $request->enterprise_plan_call_waiter;

        $basic_plan->create_dining_experience = $request->basic_plan_create_dining_experience;
        $premium_plan->create_dining_experience = $request->premium_plan_create_dining_experience;
        $enterprise_plan->create_dining_experience = $request->enterprise_plan_create_dining_experience;

        $basic_plan->dynamic_pricing = $request->basic_plan_dynamic_pricing;
        $premium_plan->dynamic_pricing = $request->premium_plan_dynamic_pricing;
        $enterprise_plan->dynamic_pricing = $request->enterprise_plan_dynamic_pricing;

        $basic_plan->qr_code_menu = $request->basic_plan_qr_code_menu;
        $premium_plan->qr_code_menu = $request->premium_plan_qr_code_menu;
        $enterprise_plan->qr_code_menu = $request->enterprise_plan_qr_code_menu;

        $basic_plan->quick_search = $request->basic_plan_quick_search;
        $premium_plan->quick_search = $request->premium_plan_quick_search;
        $enterprise_plan->quick_search = $request->enterprise_plan_quick_search;

        $basic_plan->unique_qr_code = $request->basic_plan_unique_qr_code;
        $premium_plan->unique_qr_code = $request->premium_plan_unique_qr_code;
        $enterprise_plan->unique_qr_code = $request->enterprise_plan_unique_qr_code;

        $basic_plan->expand_features = $request->basic_plan_expand_features;
        $premium_plan->expand_features = $request->premium_plan_expand_features;
        $enterprise_plan->expand_features = $request->enterprise_plan_expand_features;

        $basic_plan->custom_domain = $request->basic_plan_custom_domain;
        $premium_plan->custom_domain = $request->premium_plan_custom_domain;
        $enterprise_plan->custom_domain = $request->enterprise_plan_custom_domain;

        $basic_plan->menu_generator = $request->basic_plan_menu_generator;
        $premium_plan->menu_generator = $request->premium_plan_menu_generator;
        $enterprise_plan->menu_generator = $request->enterprise_plan_menu_generator;

        $basic_plan->translation_languages = $request->basic_plan_translation_languages;
        $premium_plan->translation_languages = $request->premium_plan_translation_languages;
        $enterprise_plan->translation_languages = $request->enterprise_plan_translation_languages;

        $basic_plan->allergens = $request->basic_plan_allergens;
        $premium_plan->allergens = $request->premium_plan_allergens;
        $enterprise_plan->allergens = $request->enterprise_plan_allergens;

        $basic_plan->menu_management = $request->basic_plan_menu_management;
        $premium_plan->menu_management = $request->premium_plan_menu_management;
        $enterprise_plan->menu_management = $request->enterprise_plan_menu_management;

        $basic_plan->operational_change = $request->basic_plan_optional_change;
        $premium_plan->operational_change = $request->premium_plan_optional_change;
        $enterprise_plan->operational_change = $request->enterprise_plan_optional_change;

        $basic_plan->multiple_accounts = $request->basic_plan_multiple_accounts;
        $premium_plan->multiple_accounts = $request->premium_plan_multiple_accounts;
        $enterprise_plan->multiple_accounts = $request->enterprise_plan_multiple_accounts;

        $basic_plan->support_tickets = $request->basic_plan_support_tickets;
        $premium_plan->support_tickets = $request->premium_plan_support_tickets;
        $enterprise_plan->support_tickets = $request->enterprise_plan_support_tickets;

        $basic_plan->priority_support = $request->basic_plan_priority_support;
        $premium_plan->priority_support = $request->premium_plan_priority_support;
        $enterprise_plan->priority_support = $request->enterprise_plan_priority_support;

        $basic_plan->qr_scans = $request->basic_plan_qr_scans;
        $premium_plan->qr_scans = $request->premium_plan_qr_scans;
        $enterprise_plan->qr_scans = $request->enterprise_plan_qr_scans;

        $basic_plan->suitable_business = $request->basic_plan_suitable_business;
        $premium_plan->suitable_business = $request->premium_plan_suitable_business;
        $enterprise_plan->suitable_business = $request->enterprise_plan_suitable_business;

        $basic_plan->add_images = $request->basic_plan_add_images;
        $premium_plan->add_images = $request->premium_plan_add_images;
        $enterprise_plan->add_images = $request->enterprise_plan_add_images;

        $basic_plan->add_logo = $request->basic_plan_add_logo;
        $premium_plan->add_logo = $request->premium_plan_add_logo;
        $enterprise_plan->add_logo = $request->enterprise_plan_add_logo;

        $basic_plan->customizable_design = $request->basic_plan_customizable_design;
        $premium_plan->customizable_design = $request->premium_plan_customizable_design;
        $enterprise_plan->customizable_design = $request->enterprise_plan_customizable_design;

        $basic_plan->free_themes = $request->basic_plan_free_themes;
        $premium_plan->free_themes = $request->premium_plan_free_themes;
        $enterprise_plan->free_themes = $request->enterprise_plan_free_themes;

        $basic_plan->instants_updates = $request->basic_plan_instants_updates;
        $premium_plan->instants_updates = $request->premium_plan_instants_updates;
        $enterprise_plan->instants_updates = $request->enterprise_plan_instants_updates;

        $basic_plan->personalise_menu = $request->basic_plan_personalise_menu;
        $premium_plan->personalise_menu = $request->premium_plan_personalise_menu;
        $enterprise_plan->personalise_menu = $request->enterprise_plan_personalise_menu;

        $basic_plan->view_from_device = $request->basic_plan_view_from_device;
        $premium_plan->view_from_device = $request->premium_plan_view_from_device;
        $enterprise_plan->view_from_device = $request->enterprise_plan_view_from_device;

        $basic_plan->save();
        $premium_plan->save();
        $enterprise_plan->save();

        return response()->json([
            'message' => 'success',
            // 'data' => $label->slug,
        ], 200);

    }
}
