<?php
namespace app\index\model;
use think\Model;

class Register extends Model{
	public function register($username,$name,$password,$confirmpassword,$checkcode,$agreement){
		//1.先判断某一项是否为空值
		if ((empty($username) || empty($name) || empty($password) || empty($confirmpassword))) {
			return 0;
		}
		//2.判断是否阅读注册协议
		if (empty($agreement)) {
			return 1;
		}
		//3.判断验证码
		session_start();
		if ($checkcode!=$_SESSION['checkcode']) {
			return 2;
		}		
		//4.判断用户名是否已经存在
		$usernameres=\think\Db::name('user')->where('username','=',$username)->select();
		if ($usernameres) {
			return 3;die;
		}else{
			//判断昵称是否已经存在
			$nameres=\think\Db::name('user')->where('name','=',$name)->select();
			if ($nameres) {
				return 4;
			}
		}
    }

}    