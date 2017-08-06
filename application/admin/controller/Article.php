<?php
namespace app\admin\controller;
use \think\Controller;

class Article extends Base{
    public function index(){
    	$artres=\think\Db::name('article')->order('id desc')->paginate(5);
        $bg=session('bg');
        $this->assign('bg',$bg);
    	$this->assign('artres',$artres);
    	return $this->fetch();
    }

    public function add(){
        $bg=session('bg');
        $this->assign('bg',$bg);
    	if (request()->isPOST()) {
    		$data=[
                'name'=>session('name'),
    			'title'=>input('title'),
    			'keywords'=>input('keywords'),
    			'intro'=>input('intro'),
    			'content'=>input('content'),
    			'time'=>time(),
    		];
    		if ($_FILES['pic']['tmp_name']) {
    			$file=request()->file('pic');
    			$info=$file->move(ROOT_PATH.'public'.DS.'/static/upload');

    			if ($info) {
    				$data['pic']='/static/upload/'.date('Ymd').'/'.$info->getFilename();
    			}else{
    				return $this->error($file->getError());
    			}
    		}
    		$validate=\think\Loader::validate('Article');
			if ($validate->check($data)) {
    			$db=\think\Db::name('article')->insert($data);
    			if($db){
    				return $this->success('添加文章成功','index');
    			}else{
    				return $this->error('添加失败');
    			}    				
			}else{
				return $this->error($validate->getError());
			}
    		return;
    	}
    	return $this->fetch('add');
    }
    public function edit(){
        $bg=session('bg');
        $this->assign('bg',$bg);
    	if (request()->isPOST()) {
    		$data=[
    			'id'=>input('id'),
    			'title'=>input('title'),
    			'keywords'=>input('keywords'),
    			'intro'=>input('intro'),
    			'content'=>input('content'),
    		];
    		if ($_FILES['pic']['tmp_name']) {
    			$file=request()->file('pic');
    			$info=$file->move(ROOT_PATH.'public'.DS.'/static/upload');

    			if ($info) {
    				$data['pic']='/static/upload/'.date('Ymd').'/'.$info->getFilename();
    			}else{
    				return $this->error($file->getError());
    			}
    		}
    		$validate=\think\Loader::validate('Article');
			if ($validate->check($data)) {
    			$db=\think\Db::name('article')->update($data);
    			if($db){
    				return $this->success('修改文章成功','index');
    			}else{
    				return $this->error('修改失败');
    			}    				
			}else{
				return $this->error($validate->getError());
			}
    		return;
    	}
    	$id=input('id');
    	$arts=\think\Db::name('article')->find($id);
    	$this->assign('arts',$arts);
    	return $this->fetch('edit');
    }
    public function del(){
		$id=input('id');
		$db=\think\Db::name('article')->delete($id);
		if ($db) {
			return $this->success('删除成功！','index');
		}else{
			return $this->error('删除失败！');
		}
    }
}
