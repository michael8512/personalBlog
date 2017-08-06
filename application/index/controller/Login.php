<?php
namespace app\index\controller;
use \think\Controller;
use \think\Session;
use \think\Cookie;
use app\index\model\Login as Log;

class Login extends Controller{
    public function index(){
    	if (request()->isPOST()) {
    		$login=new Log;
    		$status=$login->login(input('username'),input('password'),input('checkcode'),input('remember'));
    		//判断是否保存用户名
    		if (empty(input('remember'))) {
    			if (!empty(cookie('username'))) {
    				Cookie::set('username',input('username'),time()-100);
    			}
    		}else{
    			Cookie::set('username',input('username'),time()+7*24*3600);
    		}
    		//echo session('checkcode');die;
    		//die;
    		if ($status==1) {
    			return $this->success('登录成功，正在跳转!','index/index');
    		}elseif ($status==0) {
    			return $this->error('验证码错误！');
            }elseif ($status==2) {
    			return $this->error('账号或者密码错误！');
            }else{
                return $this->error('用户不存在！');
            }
    	}
    	return $this->fetch('login');
	}

	public function loginOut(){
		session(null);
		return $this->success('退出成功',url('index'));
	}
}
