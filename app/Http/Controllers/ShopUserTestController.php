<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Shopcategory;
use App\Shopuser;

class ShopUserTestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function filter($searchkey)
    {
        
        $list=DB::table('shopusers')
        ->select('shopusers.name','email','profile_url','address','latitude','longitude','phone_no','shopusers.rank1','shopusers.rank2','shopusers.rank3','shopusers.rank4','shopusers.rank'
        ,'shopcategories.id as shopcategory_id','shopcategories.name as shopcategory_name'
        ,'shop_cities.id as shopcity_id','shop_cities.township as shopcity_township')
        ->join('shopcategories', 'shopcategories.id', '=', 'shopusers.shopcategory_id')
        ->join('shop_cities', 'shop_cities.id', '=', 'shopusers.shop_cities_id')
        ->whereRaw('MATCH (shopcategories.name) AGAINST (?   IN BOOLEAN MODE)',$searchkey)
        ->paginate(20);
        // $list=Shopuser::all();
        // $list->shopcategory;
        return response()->json($list);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
