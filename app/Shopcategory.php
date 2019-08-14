<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shopcategory extends Model
{
    function shopusers(){
        return $this->hasMany('App\Shopuser');
    }
}
