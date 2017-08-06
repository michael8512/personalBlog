<?php
namespace app\admin\controller;
use \think\Controller;
use \think\File;

class Index extends Base{
    public function index(){
        $name=session('name');
        $albumres=\think\Db::name('album')->where('name','=',$name)->select();
        $this->assign('albumres',$albumres);
        //先判断用户是否已经填写个人信息
        //如果用户修改了个人信息
        if (request()->isPOST()) {
            $data='';
            if (input('post.realname')) {
                $data['realname']=input('realname');
            }
            if (input('post.sex')) {
                $data['sex']=input('sex');
            }
            if (input('post.age')) {
                $data['age']=input('age');
            }
            if (input('post.email')) {
                $data['email']=input('email');
            }

            if ($_FILES['head']['tmp_name']) {

                $file=request()->file('head');
                $file_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/admin/images/head');
                $info=$file->move($file_path);
                //echo $info->getFilename();die;
                if ($info) {
                    $img='/static/admin/images/head/'.date('Ymd').'/'.$info->getFilename();
                    $image_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.$img);
                    $image=\think\Image::open($image_path);
                    //生成缩略图
                    $thumb_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/admin/images/head/'.date('Ymd').'/thumbnail_'.$info->getFilename());
                    $image->thumb(160,160,\think\Image::THUMB_CENTER)->save($thumb_path);
                    //获取缩略图作为用户头像
                    $data['head']='/static/admin/images/head/'.date('Ymd').'/thumbnail_'.$info->getFilename();
                }
            }elseif (input('post.localpic')) {
                $id=input('post.localpic');
                $picres=\think\Db::name('picture')->find($id);
                $head_path=$picres['pic'];
                $data['head']=$head_path;
            }

            if ($data) {
                \think\Db::name('personal')->where('name','=',$name)->update($data);
            }     
            $person=\think\Db::name('personal')->where('name','=',$name)->find();
            \think\Session::set('bg',$person['bg']);
            $bg=session('bg');

            //echo $bg;die;
            $this->assign('bg',$bg);
            $this->assign('person',$person);
            return $this->fetch();
        }else{
        //如果用户没有修改个人信息，则查找并返回用户信息
            //echo "string";die;
            $person=\think\Db::name('personal')->where('name','=',$name)->find();
            if ($person) {
                \think\Session::set('bg',$person['bg']);
                $bg=session('bg');
                $this->assign('bg',$bg);
                $this->assign('person',$person);
                return $this->fetch();
                    //echo "<pre>";
                    //print_r($person);
                    //echo "</pre>";die;
            }           
        }
    }
    public function info(){
        $name=input('post.name');
        $personres=\think\Db::name('personal')->where('name','=',$name)->find();
        //$name=json_encode($person['name']);
        exit(json_encode(array('name'=>$personres['name'],'sex'=>$personres['sex'],'age'=>$personres['age'],'email'=>$personres['email'],'head'=>$personres['head'])));
    }
    //修改座右铭
    public function editMotto(){
        $id=input('post.id');
        $motto=input('post.motto');
        $personres=\think\Db::name('personal')->find($id);
        if ($motto!=$personres['motto']) {
            $db=\think\Db::name('personal')->where('id','=',$id)->update(['motto'=>$motto]);
            exit(json_encode($db));
        }else{
            exit(json_encode($personres));
        }
    }

    public function index1(){
        $name=session('name');
        //先判断用户是否已经填写个人信息
        //如果用户修改了个人信息
        if (request()->file('head')) {
            /*echo "string";die;
            $file=request()->file('head');
            $file_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/admin/images/head');
            $info=$file->move($file_path);
            echo $info->getFilename();die;
            if ($info) {
                $img='/static/admin/images/head/'.date('Ymd').'/'.$info->getFilename();
                $image_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.$img);
                $image=\think\Image::open($image_path);
                //生成缩略图
                $thumb_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/admin/images/head/'.date('Ymd').'/thumbnail_'.$info->getFilename());
                $image->thumb(160,160,\think\Image::THUMB_CENTER)->save($thumb_path);
                //获取缩略图作为用户头像
                $data['pic']='/static/admin/images/head/'.date('Ymd').'/thumbnail_'.$info->getFilename();
            }*/
            
        }elseif (request()->isPOST()) {
        return $this->success('成功',"album/index");
            $data=[
                'realname'=>input('realname'),
                'sex'=>input('sex'),
                'age'=>input('age'),
                'email'=>input('email'),
            ];              
                    
            \think\Db::name('personal')->where('name','=',$name)->update($data);
            $person=\think\Db::name('personal')->where('name','=',$name)->find();
            \think\Session::set('bg',$person['bg']);
            $bg=session('bg');
            //echo $bg;die;
            $this->assign('bg',$bg);
            $this->assign('person',$person);
            return $this->fetch();
        }else{
        //如果用户没有修改个人信息，则查找并返回用户信息
            $person=\think\Db::name('personal')->where('name','=',$name)->find();
            if ($person) {
                \think\Session::set('bg',$person['bg']);
                $bg=session('bg');
                $this->assign('bg',$bg);
                $this->assign('person',$person);
                return $this->fetch();
                    //echo "<pre>";
                    //print_r($person);
                    //echo "</pre>";die;
            }           
        }
    }

    public function add(){
    	if (request()->isPOST()) {
    		$data=[
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

    public function show(){
        $title=input('post.title');
        $name=session('name');
        $picres=\think\Db::name('picture')->where('album','=',$title)->select();
        //$id=$picres['id'];
        //\think\Db::name('picture')->where('id','=',$id)->update(['click'=>999]);
        //$picres=json($picres);
        //$pic=$picres['pic'];
        //echo $pic;die;
        //$array=array('diary'=>'123','num'=>'456');
        //$array=$this->JSON($array);
        return json_encode($picres);
        //return json('array',$array);
        //$this->assign('picres',$picres);
        //exit(json_encode($picture));
    }
}
