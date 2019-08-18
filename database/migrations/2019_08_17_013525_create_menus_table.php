<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->unsignedBigInteger('menucategory_id');
            $table->unsignedBigInteger('shopuser_id');
            $table->string('photo_url');
            $table->string('description');
            $table->foreign('menucategory_id')->references('id')->on('menucategories')->onDelete('cascade');
            $table->foreign('shopuser_id')->references('id')->on('shopusers')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('menus');
    }
}
