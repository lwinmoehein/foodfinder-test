<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'menucategory_id', 'shopuser_id','photo_url','price','description'
    ];

    function menucategory(){
        return $this->belongsTo('App\Menucategory','menucategory_id');
    }
    function shopuser(){
        return $this->belongsTo('App\Shopuser','shopuser_id');
    }
}
