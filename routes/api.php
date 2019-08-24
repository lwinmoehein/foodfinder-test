<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', 'UserController@login')->middleware('client');
Route::post('register', 'UserController@register')->middleware('client');
Route::group(['middleware' => 'auth:api'], function(){
Route::post('details', 'UserController@details');
});

Route::group(['middleware' => ['auth:shop','scope:shop']], function(){
    Route::post('shopuser/details', 'ShopUserController@details');
    Route::put('shopuser/passupdate', 'ShopUserController@passupdate');
    Route::put('shopuser/infoupdate', 'ShopUserController@infoupdate');
    Route::resource('shopuser/menu','MenuController');
});

Route::group(['middleware' => 'client'], function(){
    Route::post('shopuser/search', 'ShopUserController@filter');
    Route::post('shopuser/register', 'ShopUserController@register');
    Route::post('shopuser/login', 'ShopUserController@login');
    Route::get('shopuser/{id}', 'ShopUserController@show');
    Route::post('shopuser/ranklist', 'ShopUserController@showranklist');
});

// Customer role
Route::group(['middleware' => 'client'], function(){

    /** 
     * login api
     * Request parameter (phone_no,password)
     */ 
    Route::post('customer/login', 'CustomerController@login');

    /** 
     * register api
     * Request parameter (name,password,c_password,profile_url,phone_no)
     */ 
    Route::post('customer/register', 'CustomerController@register');
});
Route::group(['middleware' =>['auth:customer','scope:customer']], function(){

    /** 
     * passupdate api
     * Request parameter (old_password,new_password,c_password)
     */ 
    Route::put('customer/passupdate', 'CustomerController@passupdate');

    /** 
     * infoupdate api
     * Request parameter (name,profile_url)
     */ 
    Route::put('customer/infoupdate', 'CustomerController@infoupdate');

    /** 
     * details api
     * Request parameter (name,profile_url)
     */ 
    Route::post('customer/details', 'CustomerController@details');
    /** 
     * shop rank api
     * store or create api (post)
     * Request parameter (shopuser_id,rank,review(optional))
     * update review api (put)
     * Request parameter (review)
     * delete rank api  (delete)
     * Request parameter (review)
     */ 
    Route::resource('customer/shoprank','ShoprankController');

    /** 
     * menu rank api
     * store or create api (post)
     * Request parameter (shopuser_id,rank,review(optional))
     * update review api (put)
     * Request parameter (review)
     * delete rank api  (delete)
     * Request parameter (review)
     */ 
    Route::resource('customer/menurank','MenurankController');
});