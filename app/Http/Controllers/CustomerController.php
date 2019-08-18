<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Customer; 
use Illuminate\Support\Facades\Auth; 
use Validator;
use Illuminate\Support\Facades\Hash;
class CustomerController extends Controller
{
    public $successStatus = 200;
/** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(Request $request){ 
        $validator = Validator::make($request->all(), [ 
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
            'password' => 'required|min:8',
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $user = Customer::where('phone_no', request()->phone_no)->first();
        if($user && Hash::check(request()->password, $user->password)){ 
            $success['token'] =  $user->createToken('MyCustomer')-> accessToken; 
            return response()->json(['success' => $success], $this-> successStatus); 
        } 
        else{ 
            return response()->json(['error'=>'Unauthorised'], 401); 
        } 
    }
/** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            'name' => 'required|max:100', 
            'password' => 'required', 
            'c_password' => 'required|same:password',
            'profile_url'=>'required|active_url',
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
$input = $request->all(); 
        $input['password'] = bcrypt($input['password']);
        $user = Customer::where('phone_no', request()->phone_no)->first();
        if(!$user){
        $user = Customer::create($input);
        $success['token'] =  $user->createToken('MyCustomer')-> accessToken; 
        $success['name'] =  $user->name;
return response()->json(['success'=>$success], $this-> successStatus); 
        }
        return response()->json(['error'=>'phone no already exists'], 401); 
    }
/** 
     * details api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function details() 
    { 
        $user = Auth::guard('customer')->user();
        $user->shopcategory;
        return response()->json(['success' => $user], $this-> successStatus); 
    }

        /**
     * Update the specified resource in storage.
     * Shop User's Information Change
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
                return response()->json(['shop'=>$customer,"status"=>1,"status msg"=>"update success"]);
            } catch (QueryException $e) {
                return response()->json(['error'=>$e], 401); 
            }
          
        }
    }

    /**
     * Update the specified resource in storage.
     * Shop user password change
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function passupdate(Request $request)
    {
        $request->validate([
            'password' => 'required|min:8', 
            'c_password' => 'required|same:password',
        ]);
        $customer = Customer::find(Auth::guard('customer')->id());
        $customer->password=bcrypt($request->password);
        if($customer){
            try {
                $customer->save();
                return response()->json(['shop'=>$customer,"status"=>1,"status msg"=>"password change success"]);
            } catch (QueryException $e) {
                return response()->json(['error'=>$e], 401); 
            }
          
        }
    }
}
