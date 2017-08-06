<?php
namespace app\index\controller;
use \think\Controller;
use \think\Request;

class Diary extends Base{
    public function index(){
        $name=session('name');
        $diaryres=\think\Db::name('diary')->where('name','=',$name)->select();
        $this->assign('diaryres',$diaryres);

        return $this->fetch();
    }

}
