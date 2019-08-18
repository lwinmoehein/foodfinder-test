<?php

namespace App\Http\Controllers;

use App\Menu;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    private $errorstatus = 401;
    private $pagno=20;
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'=>'required', 
            'menucategory_id'=>'required|integer', 
            'photo_url'=>'required|url',
            'price'=>'required|numeric'
        ]);
        $menu=new Menu();
        $menu->name=$request->name;
        $menu->menucategory_id=$request->menucategory_id;
        $menu->shopuser_id=Auth::guard('shopuser-api')->id();
        $menu->photo_url=$request->photo_url;
        $menu->price=$request->price;
        if($request->description){
            $menu->description=$request->description;
        }
        try{
            $menu->save();
            return response()->json(['new menu'=>$menu,'status'=>1,'msg'=>'create new menu success']);
        }
        catch(QueryException $e){
            return response()->json(['sql error'=>$e],$this->errorstatus);
        }

        
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $request->validate([
            'name'=>'required', 
            'menucategory_id'=>'required|integer', 
            'photo_url'=>'required|url',
            'price'=>'required|numeric'
        ]);
        $menu=Menu::where('shopuser_id',Auth::guard('shopuser-api')->id())->find($id);
        if(!$menu){
            return response()->json(['error'=>"not exit menu"],$this->errorstatus);
        }
        $menu->name=$request->name;
        $menu->menucategory_id=$request->menucategory_id;
        $menu->photo_url=$request->photo_url;
        $menu->price=$request->price;
        if($menu->description){
            $menu->description=$request->description;
        }
        try{
            $menu->save();
            return response()->json(['new menu'=>$menu,'status'=>1,'msg'=>'create new menu success']);
        }
        catch(QueryException $e){
            return response()->json(['sql error'=>$e],$this->errorstatus);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $menu=Menu::where('shopuser_id',Auth::guard('shopuser-api')->id())->find($id);
        if(!$menu){
            return response()->json(['error'=>"not exit menu"],$this->errorstatus);
        }
        try{
            $menu->delete();
            return response()->json(['delete menu'=>$menu,'status'=>1,'msg'=>'delete menu success']);
        }
        catch(QueryException $e){
            return response()->json(['sql error'=>$e],$this->errorstatus);
        }
    }
}
