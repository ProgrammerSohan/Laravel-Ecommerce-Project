<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function login(){
      /*  echo Hash::make('admin@123');
         exit();*/
        return view('admin.login');
    }

    public function makeLogin(Request $request){

        $data = array(
                'email' => $request->email,
                'password'=> $request->password,
                'role'=>'admin'

        );
        if (Auth::attempt($data)) {
            //echo "Login Success";
           // return view('admin.dashboard');
           return redirect()->route('admin.dashboard');

        }else{
           return back()->withErrors(['message'=>'Invalid email or password']);

        }
    }

    public function dashboard(){
        return view('admin.dashboard');
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('admin.login');


    }

}
