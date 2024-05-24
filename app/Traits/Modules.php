<?php

namespace App\Traits;

use Akaunting\Module\Facade as Module;

trait Modules
{


    private function vendorFields($configs, $fieldsType = "vendor_fields")
    {
        $fields = [];

        $allowedPluginsPerPlan = auth()->user()->restorant ? auth()->user()->restorant->getPlanAttribute()['allowedPluginsPerPlan'] : null;
        if($allowedPluginsPerPlan != null && in_array('orderdatetime', $allowedPluginsPerPlan) == false){
            array_push($allowedPluginsPerPlan,'orderdatetime');
        }
        // dd($allowedPluginsPerPlan);

        // return $allowedPluginsPerPlan;

        // dd(Module::all());

        foreach (Module::all() as $key => $module) {

            // dump($module->get($fieldsType), $module->get('alias'));
            // dump(in_array($module->get('alias'), $allowedPluginsPerPlan));

            if (is_array($module->get($fieldsType)) && ($allowedPluginsPerPlan == null || in_array($module->get('alias'), $allowedPluginsPerPlan))) {

                $insertThisModuleVendorFields = true;
                //If Module is payment method, check if admin has approved usage
                if ($module->get('isPaymentModule')) {
                    //check if admin has approved usage
                    if (!config($module->get('alias') . ".useVendor")) {
                        $insertThisModuleVendorFields = false;
                    }

                }


                if ($insertThisModuleVendorFields) {
                    foreach ($module->get($fieldsType) as $key => $field) {
                        if ($field['key'] == "time_zone") {
                            $field['data'] = config('timezones');
                        }
                        if (!(isset($field['onlyin']) && $field['onlyin'] != config('settings.app_project_type'))) {

                            array_push($fields, $field);
                        }
                    }
                }
            }
        }

        // dd($key, $module->get($fieldsType));

        foreach ($fields as &$field) {
            // dump($field);
            if (isset($configs[$field['key']])) {
                $field['value'] = $configs[$field['key']];
            } else if (!isset($field['value'])) {
                $field['value'] = "";
            }
        }

        // dd($fields);
        return $fields;

    }

    public function setMultipleConfig($repo, $request, $fields)
    {
        if ($request->has('custom')) {
            //dd($fields);
            //$repo->setMultipleConfig($request->custom);

            //Now loop to find and upload image
            for ($i = 0; $i < count($fields); $i++) {
                if ($fields[$i]['ftype'] == "image") {
                    if (isset($request->custom[$fields[$i]['key']])) {
                        $image = $this->saveImageVersions(
                            'uploads/restorants/',
                            $request->custom[$fields[$i]['key']],
                            [
                                ['name' => 'large',]
                            ],
                            true
                        );
                        $repo->setConfig($fields[$i]['key'], $image);
                    }
                } else {
                    $repo->setConfig($fields[$i]['key'], $request->get('custom')[$fields[$i]['key']]);
                }
            }
        }

    }
}
