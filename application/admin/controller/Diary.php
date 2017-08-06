<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Session;

class Diary extends Base{
    public function index(){
        $bg=session('bg');
        $this->assign('bg',$bg);
    	$diaryres=\think\Db::name('diary')->order('id desc')->paginate(5);
    	$this->assign('diaryres',$diaryres);
    	return $this->fetch();
    }

    public function add(){
        $bg=session('bg');
        $this->assign('bg',$bg);    
    	if (request()->isPOST()) {
    		$data=[
                'name'=>session('name'),
    			'diary'=>input('diary'),
    			'good'=>0,
    			'time'=>time(),
    		];

    		$validate=\think\Loader::validate('Diary');
			if ($validate->check($data)) {
    			$db=\think\Db::name('diary')->insert($data);
    			if($db){
    				return $this->success('发布说说成功','index');
    			}else{
    				return $this->error('发布失败');
    			}    				
			}else{
				return $this->error($validate->getError());
			}
    		return;
    	}
    	return $this->fetch('add');
    }

    public function del(){
		$id=input('id');
		$db=\think\Db::name('diary')->delete($id);
		if ($db) {
			return $this->success('删除成功！','index');
		}else{
			return $this->error('删除失败！');
		}
    }
}
