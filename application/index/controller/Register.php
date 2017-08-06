<?php
namespace app\index\controller;
use think\Controller;
use app\index\model\Register as Reg;
//use app\index\model\Register as Reg;

class Register extends Controller{
    public function index(){
    	if (request()->isPOST()) {
        //echo input('password');
        //echo input('confirmpassword');die;
    		$register=new Reg;
    		$status=$register->register(input('username'),input('name'),input('password'),input('confirmpassword'),input('checkcode'),input('agreement'));
    		if ($status==1) {
    			return $this->error('未阅读注册协议');
    			//return $this->redirect('register/index',['errno'=>1]);
    		}elseif ($status==2){
    			return $this->error('验证码错误');
    		}elseif ($status==3){
    			return $this->error('用户名已存在');
    		}elseif ($status==4){
    			return $this->error('昵称已存在');
    		}else{
                $data_u=[
                    'name'=>input('name'),
                    'username'=>input('username'),
                    'password'=>md5(input('password')),
                    'loginDate'=>time(),
                    'loginCount'=>1,
                    'grade'=>0,
                ];
                \think\Db::name('user')->insert($data_u);                
                $data_p=[
                    'name'=>input('name'),
                ];                
                \think\Db::name('personal')->insert($data_p);
    			return $this->success('注册成功，请重新登录','login/index');
    		}

    	}
    	
		return $this->fetch('register',array('error'=>3));
	}
}
