<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request; 
use App\Http\Controllers\Controller;
use App\Shoprank;
use App\Shopuser; 
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\QueryException;
use Validator;
use Illuminate\Support\Facades\Hash;
class ShopUserController extends Controller 
{
    public $successStatus = 200;
    private $pagno=20;
    /** 
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function login(Request $request){ 
        $request->validate([
            'email' => 'required|email', 
            'password' => 'required|min:8',
        ]);
        $user = Shopuser::where('email', $request->email)->first();
        if(!$user){
            return response()->json(['error'=>'email does not exit'], 401); 
        }
        if(Hash::check($request->password, $user->password)){ 
            $success['token'] =  $user->createToken('My306695ShopUser725')-> accessToken; 
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
        $request->validate([
            'name' => 'required|max:100', 
            'email' => 'required|email', 
            'password' => 'required|min:8', 
            'c_password' => 'required|same:password',
            'profile_url'=>'required|active_url',
            'address'=>'required',
            'latitude'=>'required|numeric',
            'longitude'=>'required|numeric',
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
            'shopcategory_id'=>'required|integer',
            'shop_cities_id'=>'required|integer'
        ]);
        $request->password = bcrypt($request->password);
        try {
            $user = Shopuser::where('email', request()->email)->first();
            if(!$user){
            $user = new ShopUser();
            $user->name=$request->name;
            $user->email=$request->email;
            $user->password=$request->password;
            $user->profile_url=$request->profile_url;
            $user->address=$request->address;
            $user->latitude=$request->latitude;
            $user->longitude=$request->longitude;
            $user->phone_no=$request->phone_no;
            $user->shopcategory_id=$request->shopcategory_id;
            $user->shop_cities_id=$request->shop_cities_id;
            $user->save();
            $success['token'] =  $user->createToken('My306695ShopUser725')-> accessToken; 
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
        $user->shopcity;
        return response()->json(['data' => $user], $this-> successStatus); 
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
            'address'=>'required',
            'latitude'=>'required|numeric',
            'longitude'=>'required|numeric',
            'phone_no' =>'required|regex:/(09)[0-9]{9}/',
            'shopcategory_id'=>'required|integer'
        ]);
        $shopuser = Shopuser::find(Auth::guard('shopuser-api')->id());
        $shopuser->name=$request->name;
        $shopuser->profile_url=$request->profile_url;
        $shopuser->address=$request->address;
        $shopuser->latitude=$request->latitude;
        $shopuser->longitude=$request->longitude;
        $shopuser->phone_no=$request->phone_no;
        $shopuser->shopcategory_id=$request->shopcategory_id;
        if($shopuser){
            try {
                $shopuser->save();
                return response()->json(['shop'=>$shopuser,"status"=>1,"status msg"=>"update success"]);
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
        $shopuser = Shopuser::find(Auth::guard('shopuser-api')->id());
        $shopuser->password=bcrypt($request->password);
        if($shopuser){
            try {
                $shopuser->save();
                return response()->json(['shop'=>$shopuser,"status"=>1,"status msg"=>"password change success"]);
            } catch (QueryException $e) {
                return response()->json(['error'=>$e], 401); 
            }
          
        }
    }

    /**
     * Display the specified resource.
     * get show detail
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user =Shopuser::find($id);
        $user->shopcategory;
        $user->shopcity;
        $user->shopranks;
        return response()->json(['data' => $user], $this-> successStatus); 
    }

    /**
     * Display the specified resource.
     * get shop rank list paginate 
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showranklist(Request $request)
    {
        $request->validate([
            'shopuser_id' => 'required|integer'
        ]);
        //get client paginate default patiante=20
        if($request->paginate){
            $request->validate([
                'paginate' => 'required|integer'
            ]);
            $this->pagno=$request->paginate;
        }
        $shoprank=Shoprank::where('shopuser_id',$request->shopuser_id)->whereNotNull('review')->paginate($this->pagno);
        return response()->json($shoprank);
    }


    /** 
     * search api 
     * city_id index search api
     * city name full text search api
     * only shop category name search api
     * @return \Illuminate\Http\Response 
     */ 
    public function filter(Request $request)
    {
        //check request searchkey
        $validator = Validator::make($request->all(), [ 
            'searchkey' => 'required', 
        ]);

        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }

        //clean searchkey
        $searchkey=$this->clean($request->searchkey);

        //get client paginate default patiante=20
        if($request->paginate){
            Validator::make($request->all(),[
                'searchkey' => 'required', 
                'paginate' => 'required|integer'
            ]);
            if ($validator->fails()) { 
                return response()->json(['error'=>$validator->errors()], 401);            
            }
            $this->pagno=$request->paginate;
        }

        //city_id index and shop category name search api
        if($request->city_id){
            $request->validate([
                'city_id' => 'required|integer'
            ]);
        $city_id=$request->city_id;
        $list=DB::table('shopusers')
        ->select('shopusers.name','email','profile_url','address','latitude','longitude','phone_no','shopusers.rank1','shopusers.rank2','shopusers.rank3','shopusers.rank4','shopusers.rank'
        ,'shopcategories.id as shopcategory_id','shopcategories.name as shopcategory_name'
        ,'shop_cities.id as shopcity_id','shop_cities.township as shopcity_township')
        ->join('shopcategories', 'shopcategories.id', '=', 'shopusers.shopcategory_id')
        ->join('shop_cities', 'shop_cities.id', '=',  'shopusers.shop_cities_id')
        ->where('shop_cities.id','=',$city_id)
        ->whereRaw('MATCH (shopcategories.name) AGAINST (?   IN BOOLEAN MODE)',$searchkey)
        ->orderBy('shopusers.rank', 'desc')
        ->paginate($this->pagno);
        return response()->json($list);
        }

        //city name fulltext index and shop category name search api
        if($request->city){
            $city=$this->clean($request->city);
        $list=DB::table('shopusers')
        ->select('shopusers.name','email','profile_url','address','latitude','longitude','phone_no','shopusers.rank1','shopusers.rank2','shopusers.rank3','shopusers.rank4','shopusers.rank'
        ,'shopcategories.id as shopcategory_id','shopcategories.name as shopcategory_name'
        ,'shop_cities.id as shopcity_id','shop_cities.township as shopcity_township')
        ->join('shopcategories', 'shopcategories.id', '=', 'shopusers.shopcategory_id')
        ->join('shop_cities', 'shop_cities.id', '=', 'shopusers.shop_cities_id')
        ->whereRaw('MATCH (shopcategories.name) AGAINST (?   IN BOOLEAN MODE)',$searchkey)
        ->whereRaw('MATCH (shop_cities.township) AGAINST (?   IN BOOLEAN MODE)',$city)
        ->orderBy('shopusers.rank', 'desc')
        ->paginate($this->pagno);
        return response()->json($list);
        }
       
         //only shop category name fulltext index search api
        $list=DB::table('shopusers')
        ->select('shopusers.name','email','profile_url','address','latitude','longitude','phone_no','shopusers.rank1','shopusers.rank2','shopusers.rank3','shopusers.rank4','shopusers.rank'
        ,'shopcategories.id as shopcategory_id','shopcategories.name as shopcategory_name'
        ,'shop_cities.id as shopcity_id','shop_cities.township as shopcity_township')
        ->join('shopcategories', 'shopcategories.id', '=', 'shopusers.shopcategory_id')
        ->join('shop_cities', 'shop_cities.id', '=', 'shopusers.shop_cities_id')
        ->whereRaw('MATCH (shopcategories.name) AGAINST (?   IN BOOLEAN MODE)',$searchkey)
        ->orderBy('shopusers.rank', 'desc')
        ->paginate($this->pagno);
        return response()->json($list);
    }

    /** 
     * '@' and '+' character error handle
     * @return clean string without '@' and '+'
     */ 
    private function clean($string) {
        $patterns = array();
        $patterns[0] = '@';
        $patterns[1] = '+';
        $string = str_replace($patterns, '', $string); // Replaces all spaces with hyphens.
        return  $string; // Removes special chars.
     } 
}