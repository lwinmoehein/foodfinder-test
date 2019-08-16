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
        $user->shopcity;
        return response()->json(['data' => $user], $this-> successStatus); 
    }

    /**
     * Display the specified resource.
     *
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
     *
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