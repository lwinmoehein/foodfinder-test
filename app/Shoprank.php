<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shoprank extends Model
{
    function shopuser(){
        return $this->belongsTo('App\Shopuser','shopuser_id');
    }
}
