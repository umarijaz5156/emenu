<?php

namespace App\Http\Controllers;

use App\Models\Tenant;
use Illuminate\Http\Request;
use Stancl\Tenancy\Database\Models\Domain;


class DomainController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->adminOnly();
        $domains = Domain::all();
        return view('domains.index', compact('domains'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->adminOnly();
        return view('domains.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate(['domain'=>'required|max:255']);
        $input  = $request->all();
        $domain = $input['domain'];

        $newTenant = Tenant::create();
        $newTenant->save();
        $newDomain = Domain::create(['domain'=>$domain, 'tenant_id'=>$newTenant->id]);
        $newDomain->save();
        return redirect()->route('domains.index')->withStatus(__('Domain successfully created!'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Domain $domain)
    {
        $this->adminOnly();
        return view('domains.edit', ['domain' => $domain]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Domain $domain)
    {
        $request->validate(['domain'=>'required|max:255']);
        $input  = $request->all();
        $domain->domain = $input['domain'];

        $domain->update();

        return redirect()->route('domains.index')->withStatus(__('Domain successfully updated!'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Domain  $domain)
    {
        $domain->delete();

        return redirect()->route('domains.index')->withStatus(__('Domain successfully deleted!'));
    }
}
