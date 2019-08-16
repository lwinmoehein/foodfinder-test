<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShopCity extends Model
{
    function shopusers(){
        return $this->hasMany('App\Shopuser');
    }
}
