<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Shopuser; 
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\QueryException;
use Validator;
use Illuminate\Support\Facades\Hash;
class ShopUserController extends Controller 
{
public $successStatus = 200;
/** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(){ 
        $user = Shopuser::where('email', request()->email)->first();
        if(Hash::check(request()->password, $user->password)){ 
            $success['token'] =  $user->createToken('MyShopUser')-> accessToken; 
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
            'email' => 'required|email', 
            'password' => 'required', 
            'c_password' => 'required|same:password',
            'profile_url'=>'required|active_url',
            'address'=>'required',
            'latitude'=>'required|numeric',
            'longitude'=>'required|numeric',
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
            'shopcategory_id'=>'required|integer'
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $input = $request->all(); 
        $input['password'] = bcrypt($input['password']);
        try {
            $request->rank1=0;
            $request->rank2=0;
            $request->rank3=0;
            $request->rank4=0;
            $request->rank=0;
            $user = Shopuser::where('email', request()->email)->first();
            if(!$user){
            $user = Shopuser::create($input);
            $success['token'] =  $user->createToken('MyShopUser')-> accessToken; 
            $success['name'] =  $user->name;
            return response()->json(['success'=>$success], $this-> successStatus); 
            }
            return response()->json(['error'=>"email already exist"], $this-> successStatus); 
        } catch (QueryException $e) {
            return response()->json(['error'=>$e], 401); 
        }
        
        
    }
/** 
     * details api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function details() 
    { 
        $user = Auth::guard('shopuser-api')->user();
        $user->shopcategory;
        return response()->json(['success' => $user], $this-> successStatus); 
    } 
}