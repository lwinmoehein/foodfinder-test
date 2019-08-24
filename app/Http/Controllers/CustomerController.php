<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Customer;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class CustomerController extends Controller
{
    private $error_auth_status=401;
    private $customerTokenName='customer';
    private $scope='customer';

    /** 
     * login api 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(Request $request){ 
        $request->validate([
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
            'password' => 'required|min:8',
        ]);

        $customer = Customer::where('phone_no', $request->phone_no)->first();
        if($customer && Hash::check(request()->password, $customer->password)){
            $success['token'] =  $customer->createToken($this->customerTokenName,[$this->scope])-> accessToken;
            $success['customer'] =  $customer;
            return response()->json(['data' => $success]); 
        } 
        else{ 
            return response()->json(['error'=>'Wrong Password !! Unauthorised'], $this->error_auth_status); 
        } 
    }
    /** 
     * Register api 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    { 
        $request->validate([
            'name' => 'required|max:100', 
            'password' => 'required', 
            'c_password' => 'required|same:password',
            'profile_url'=>'required|active_url',
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
        ]);
        $customer = Customer::where('phone_no', $request->phone_no)->first();
        if(!$customer){
            $customer=new Customer();
            $customer->name=$request->name;
            $customer->password = bcrypt($request->password);
            $customer->profile_url=$request->profile_url;
            $customer->phone_no=$request->phone_no;
            $customer->save();
            $success['token'] =  $customer->createToken($this->customerTokenName,[$this->scope])-> accessToken; 
            $success['customer'] =  $customer;
            return response()->json(['data'=>$success]); 
        }
        return response()->json(['error'=>'phone no already exists'],$this->error_auth_status); 
    }

    /** 
     * details api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function details() 
    { 
        $customer = Auth::guard('customer')->user();
        return response()->json(['data' => $customer]); 
    }

        /**
     * Update the specified resource in storage.
     * Shop customer's Information Change
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function infoupdate(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100', 
            'profile_url'=>'required|active_url',
        ]);
        $customer = Customer::find(Auth::guard('customer')->id());
        $customer->name=$request->name;
        $customer->profile_url=$request->profile_url;
        if($customer){
            try {
                $customer->save();
                $success['customer'] =  $customer;
                $success['status']=1;
                $success['msg']='update success';
                return response()->json(['data'=>$success]);
            } catch (QueryException $e) {
                return response()->json(['error'=>$e], 401); 
            }
          
        }
    }

    /**
     * Update the specified resource in storage.
     * Shop customer password change
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function passupdate(Request $request)
    {
        $request->validate([
            'old_password'=>'required|min:8',
            'new_password' => 'required|min:8',
            'c_password' => 'required|same:new_password',
        ]);
        $customer = Customer::find(Auth::guard('customer')->id());
        if($customer && Hash::check($request->old_password, $customer->password)){
            try {
                $customer->password=bcrypt($request->new_password);
                $customer->save();
                $success['customer'] =  $customer;
                $success['status']=1;
                $success['msg']='password change success';
                return response()->json(['data'=>$success]);
            } catch (QueryException $e) {
                return response()->json(['error'=>$e], $this->error_auth_status); 
            }
        }
        return response()->json(['error'=>'Wrong Password'], $this->error_auth_status); 
    }
}
