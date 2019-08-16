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

Route::group(['middleware' => 'auth:shopuser-api'], function(){
Route::post('shopuser/details', 'ShopUserController@details');
});
Route::group(['middleware' => 'client'], function(){
    Route::post('shopuser/search', 'ShopUserController@filter');
    Route::post('shopuser/register', 'ShopUserController@register');
    Route::post('shopuser/login', 'ShopUserController@login');
    Route::get('shopuser/{id}', 'ShopUserController@show');
    Route::post('shopuser/ranklist', 'ShopUserController@showranklist');
    

});

Route::post('customer/login', 'CustomerController@login')->middleware('client');
Route::post('customer/register', 'CustomerController@register')->middleware('client');
Route::group(['middleware' => 'auth:customer'], function(){
Route::post('customer/details', 'CustomerController@details');
Route::resource('customer/rank','ShoprankController');
});