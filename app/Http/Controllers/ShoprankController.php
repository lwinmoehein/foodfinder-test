<?php

namespace App\Http\Controllers;

use Validator;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use App\Shoprank;
use Illuminate\Support\Facades\Auth;

class ShoprankController extends Controller
{
    public $successStatus = 200;
    public $errorStatus = 401;
    
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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'shopuser_id' => 'required|integer', 
            'rank' => 'required|integer|max:5|regex:/[1-5]{1}/',
        ]);
        try {
            $shoprank=new Shoprank();
            $customer_id = Auth::guard('customer')->user()->id;
            $shoprank->customer_id=$customer_id;
            $shoprank->shopuser_id=$request->shopuser_id;
            $shoprank->rank=$request->rank;
            $shoprank->review=$request->review;
            $shoprank->save();
        } catch (QueryException $e) {
            return response()->json(['error'=>$e], 401); 
        }
       
        if ($shoprank) { 
            return response()->json(['success'=>$shoprank], $this->successStatus);            
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
        $shoprank=Shoprank::where('customer_id',Auth::guard('customer')->id())->find($id);
        
        if ($shoprank) {
            $shoprank->review=$request->review;
            $shoprank->save(); 
            return response()->json(['data'=>$shoprank,'status'=>'update success'], $this->successStatus);            
        }
        return response()->json(['data'=>$shoprank,'status'=>'update error'], $this->errorStatus);            
    }

    
   
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $shoprank=Shoprank::where('customer_id',Auth::guard('customer')->id())->find($id);
        
        if ($shoprank) {
            $shoprank->delete(); 
            return response()->json(['data'=>$shoprank,'status'=>'delete success'], $this->successStatus);            
        }
        return response()->json(['data'=>$shoprank,'status'=>'delete error'], $this->errorStatus);            

    }
}
