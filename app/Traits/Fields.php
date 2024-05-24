<?php

namespace App\Traits;

trait Fields
{
    public function convertJSONToFields($fields)
    {

        // dd($fields);
        // dd($fields[35], isset($fields[35]['type']) ? $fields[35]['type'] : 'text');

        $fieldsToRender = [];
        if ($fields) {
            foreach ($fields as $key => $field) {
                // dd($field);
                array_push($fieldsToRender, [
                    'ftype' => isset($field['ftype']) ? $field['ftype'] : 'input',
                    'type' => isset($field['type']) ? $field['type'] : 'text',
                    'id' => 'custom[' . $field['key'] . ']',
                    'name' => isset($field['title']) && $field['title'] != '' ? $field['title'] : $field['key'],
                    'placeholder' => isset($field['placeholder']) ? $field['placeholder'] : '',
                    'separator' => isset($field['separator']) ? $field['separator'] : null,
                    'value' => isset($field['value']) ? $field['value'] : "",
                    'required' => false,
                    'data' => isset($field['data']) ? $field['data'] : [],
                ]);

                // dd('$fieldsToRender[0]');
            }
        }
        return $fieldsToRender;
    }
}
