<?php

namespace App\Http\Controllers;

use App\Menurank;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Auth;

class MenurankController extends Controller
{
    public $successStatus = 200;
    public $errorStatus = 401;

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'menu_id' => 'required|integer', 
            'rank' => 'required|integer|max:5|regex:/[1-5]{1}/',
        ]);
        try {
            $menurank=new Menurank();
            $customer_id = Auth::guard('customer')->user()->id;
            $menurank->customer_id=$customer_id;
            $menurank->menu_id=$request->menu_id;
            $menurank->rank=$request->rank;
            $menurank->review=$request->review;
            $menurank->save();
        } catch (QueryException $e) {
            return response()->json(['error'=>$e], 401); 
        }
       
        if ($menurank) { 
            return response()->json(['success'=>$menurank], $this->successStatus);            
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
    public function update(Request $request, $id)
    {
        $request->validate([
            'review' => 'required'
        ]);
        $menurank=Menurank::where('customer_id',Auth::guard('customer')->id())->find($id);
        
        if ($menurank) {
            $menurank->review=$request->review;
            $menurank->save(); 
            return response()->json(['data'=>$menurank,'status'=>'update success'], $this->successStatus);            
        }
        return response()->json(['data'=>$menurank,'status'=>'update error'], $this->errorStatus);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $menurank=Menurank::where('customer_id',Auth::guard('customer')->id())->find($id);
        
        if ($menurank) {
            $menurank->delete(); 
            return response()->json(['data'=>$menurank,'status'=>'delete success'], $this->successStatus);            
        }
        return response()->json(['data'=>$menurank,'status'=>'delete error'], $this->errorStatus);            
    }
}
