<?php

namespace App;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
class Shopuser extends Authenticatable
{
    use HasApiTokens,Notifiable;
    protected $guard='shop';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','profile_url','address','latitude','longitude','phone_no','shopcategory_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','shop_cities_id','	shopcategory_id'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    function shopcategory(){
        return $this->belongsTo('App\Shopcategory');
    }
    function shopcity(){
        return $this->belongsTo('App\ShopCity','shop_cities_id');
    }
    function menus(){
        return $this->hasMany('App\Menu');
    }
    function shopranks(){
        return $this->hasMany('App\Shoprank');
    }
    
}
