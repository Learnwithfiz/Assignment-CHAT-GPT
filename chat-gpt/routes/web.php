<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| 
|This is the user interface, not related to this page assignment. My project is full api.php and using postman and 2 controllers, please skip this page.
*/

Route::get('/', function () {
    return view('welcome');
});
