<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;
use App\Models\User;
class UserRegistration extends Controller
{
    public function OnRegister(Request $req)
    {
        // <===============here general insert from POSTMAN Request =======================================>
        $name = $req->input('name');
        $email = $req->input('email');
        $pass = $req->input('password');
        $currDate = Carbon::now()->format('d-m-y');
        $insertSql = DB::table('users')->insert([
          'name'=>$name,
          'email'=>$email,
          'password'=>$pass ,
          'created_at'=>$currDate
        ]);
        $msg = "";
        if($insertSql)
        {
            $msg="Save Successfully Done";
        }else{
            $msg="Save Failed";
        }
        return response()->json(['status'=>$msg]);
    }
     //<===================== for login check  ================================>
    public function OnLogInCheck(Request $req)
    {
        $email = $req->input('email');
        $pass = $req->input('pass');
        $user = User::where('email',$email)->where('password',$pass)->first();
        if(!$user)
        {
            return response()->json(['status'=>'Email Or password Doesnot Match']);
        }
        $token = $user->createToken('my-app-token')->plainTextToken;
        $response = [
            'user'=>$user,
            'token'=>$token
        ];
        return response($response,201);
    }

    public function OnAllUser()
    {
        $allInfo = DB::table('users')->get();
        return response()->json($allInfo);
    }
}
