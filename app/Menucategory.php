<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menucategory extends Model
{
    function menus(){
        return $this->hasMany('App\Menu');
    }
}
