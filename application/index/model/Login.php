<?php
namespace app\index\model;
use think\Model;
use think\Session;

class Login extends Model{
	public function login($username,$password,$checkcode){
		//先验证验证码
		session_start();
		if ($checkcode!=$_SESSION['checkcode']) {
			return 0;
		}
		//若验证码正确则验证用户名和密码
		$user=\think\Db::name('user')->where('username','=',$username)->find();
		if($user){
			if ($user['password']==md5($password)) {
				\think\Session::set('username',$user['username']);
				\think\Session::set('name',$user['name']);
				\think\Session::set('password',$user['password']);
				\think\Session::set('loginCount',$user['loginCount']);
				\think\Session::set('grade',$user['grade']);
				return 1;
			}else{
    			return 2;
    		}
    	}else{
    		return 3;
    	}
    }

}    