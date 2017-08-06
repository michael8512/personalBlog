<?php
namespace app\index\controller;
use \think\Controller;
use \think\Request;

class Index extends Base{
    public function index(){
    	$name=session('name');
        $personres=\think\Db::name('personal')->where('name','=',$name)->find();
        $this->assign('personres',$personres);
    	/*if (request()->isPOST()) {
    		$data=[
    			'name'	=>session('name'),
    			'diary' =>$_POST['diary'],
    			'time'	=>time(),
    			'good'	=>0,
    		];
    		$db=\think\Db::name('diary')->insert($data);
    	}*/

        $diaryres=\think\Db::name('diary')->order('id desc')->where('name','=',$name)->paginate(4);
    	$artres=\think\Db::name('article')->order('id desc')->where('name','=',$name)->paginate(4);
        $albumres=\think\Db::name('album')->order('id asc')->where('name','=',$name)->paginate(9);
        $this->assign('diaryres',$diaryres);
    	$this->assign('artres',$artres);
        $this->assign('albumres',$albumres);
		return $this->fetch();
	}
    //照片预览
    public function showPic(){
        $album=input('album');
        $picres=\think\Db::name('picture')->where('album','=',$album)->limit(1)->find();
        return json_encode($picres);        
    }
    //预览下一张照片
    public function nextPaginate(){
        $name=session('name');
        $id=input('id');
        $album=input('album');
        $picres=\think\Db::name('picture')->where('name','=',$name)->where('album','=',$album)->where('id','>',$id)->find();
        return json_encode($picres);
    }
    //预览上一张照片
    public function prevPaginate(){
        $name=session('name');
        $id=input('id');
        $album=input('album');
        $picres=\think\Db::name('picture')->where('name','=',$name)->where('album','=',$album)->where('id','<',$id)->order('id desc')->find();
        return json_encode($picres);
    }	

    //点赞
	public function addgood(){       
		$name=session('name');
        $id=input('post.id');

        $addgood=\think\Db::name('diary')->where('id','=',$id)->setInc('good');
		if ($addgood) {
            //return $this->success("点赞成功！",'index');
			exit(json_encode($addgood));
        }else{
			return $this->error('点赞失败!');
		}		
    }
    //删除
    public function del(){
		$id=input('id');
		$name=session('name');
		$db=\think\Db::name('diary')->delete($id);
        //获取下一条
		if ($db) {
			//return $this->success('删除成功','index');
            exit(json_encode($db));
		}else{
			return $this->error('失败');
		}
    }
    //发表
    public function submit(){
    	if (request()->isPOST()) {
    		$data=[
    			'name'	=>session('name'),
    			'diary' =>input('diary'),
    			'time'	=>time(),
    			'good'	=>0,
    		];
    		$db=\think\Db::name('diary')->insert($data);
    		if ($db) {
                
                //exit(json_encode($db));
    			return $this->success('说说发表成功','index');
    		}else{
    			$this->error('发布失败');
    		}
    		return;
    	}else{
    		return '没接收到';die;
    	}
    	return $this->fetch('index');
    }
    //ajax发表
    public function ajaxSubmit(){
        if (request()->isPOST()) {
            $data=[
                'name'  =>session('name'),
                'diary' =>input('diary'),
                'time'  =>time(),
                'good'  =>0,
            ];
            $db=\think\Db::name('diary')->insert($data);
            $diaryres=\think\Db::name('diary')->order('id desc')->find();
            if ($diaryres) {
                return json_encode($diaryres);
            }
        }
    }

    public function gotoadmin(){
    	return $this->redirect('http://localhost/lsh/public/index.php/admin/index');
    }


}
