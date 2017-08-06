<?php
namespace app\admin\controller;
use \think\Controller;
use \think\File;

class Album extends Base{
    public function index(){
    	$albumres=\think\Db::name('album')->where('name','=',session('name'))->select();
    	$this->assign('albumres',$albumres);
        /*echo "<pre>";
        print_r($albumres);
        echo "</pre>";die;*/
        $personres=\think\Db::name('personal')->where('name','=',session('name'))->find();
        $bg=session('bg');
        //echo $bg;die;
        $this->assign('bg',$bg);
    	return $this->fetch();
    }
    public function show(){
        if (request()->isGET()) {
            $album=input('album');
            //选中相册后，将相册名称放入缓存
            \think\Session::set('album',$album);
            //echo $album;die;
        }else{
            $album=session('album');

        }
        //echo $album;die;
        $this->assign('album',$album);
        
        $picres=\think\Db::name('picture')->where('album','=',$album)->select();
        $piccount=\think\Db::name('picture')->where('album','=',$album)->count('id');
        $firstpic=\think\Db::name('picture')->where('album','=',$album)->order('id asc')->find();
        $first=$firstpic['id'];
        $personres=\think\Db::name('personal')->where('name','=',session('name'))->find();
        $bg=session('bg');        
        $this->assign('piccount',$piccount);
        $this->assign('picres',$picres);
        $this->assign('first',$first);
        $this->assign('bg',$bg);
        /*echo '<pre>';
        print_r($first);
        echo '</pre>';die;*/
        return $this->fetch('picture');
    }
    //添加照片
    public function addpic2(){
        //$title=input('album');
        //$name=session('name');
        $id=input('id');
        $albumres=\think\Db::name('album')->find($id);
        if ($albumres) {
            $pic=$albumres['pic'];
        }else{
            $pic='abc';
        }
        //$pic=$albumres['pic'];
        $pic_path=ROOT_PATH.'public'.DS.$pic;
        exit(json_encode(array('pic'=>$pic_path)));
    }
    public function addpic(){
        $bg=session('bg');
        $this->assign('bg',$bg);

        if (request()->isPOST()) {
            //获取要上传的相册名称和相册封面
            $title=input('post.album');//echo $title;die;
        }else{
            //如果是session接收，则传入缩略图的默认值
            $title=session('album');
            //根据传入的相册名称找到相册的资源
            $res=\think\Db::name('album')->where('title','=',$title)->find();
            //获取该相册的缩略图
            $thumbnail=$res['pic'];
            $this->assign('thumbnail',$thumbnail);//缩略图默认值  
        
            //获取要传入的地址相册的名称
            $album=$title;
            //获取该用户所有的相册资源，得到缩略图的资源
            $albumres=\think\Db::name('album')->where('name','=',session('name'))->select();
            $this->assign('albumres',$albumres);                      
        }
        //
        //如果上传了照片，就完成数据库的操作和文件上传的操作
        if (request()->isPOST()) {
            $data=[
                'name'=>session('name'),
                'album'=>$title,
                'time'=>time(),
            ];

            if ($_FILES['pic']['tmp_name']) {
                $files=request()->file('pic');
                foreach ($files as $file) {
                    // 移动到框架应用根目录/public/uploads/ 目录下
                    $file_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$title);
                    $info=$file->move($file_path);
                    //$info=$file->move(ROOT_PATH.'public'.DS.'/static/album/upload/'.$album);
                    if ($info) {
                        //成功上传，获取上传信息
                        $data['pic']='/static/album/upload/'.$title.'/'.date('Ymd').'/'.$info->getFilename();
                        $image_path=iconv('utf-8','gb2312',ROOT_PATH.'public'.DS.$data['pic']);
                        $image=\think\Image::open($image_path);
                        //对原始图片进行裁剪后生成缩略图，并另存
                        $thumb_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$title.'/'.date('Ymd').'/thumbnail_'.$info->getFilename());
                        $image->thumb(160,90,\think\Image::THUMB_CENTER)->save($thumb_path);
                        //重新获取缩略图，作为相册的封面
                        $data['thumbnail']='/static/album/upload/'.$title.'/'.date('Ymd').'/thumbnail_'.$info->getFilename();
                    }else{
                        return $this->error($file->getError());
                    }
                    //如果该相册为空，即该相册的封面为空，则将上传的第一张pic作为该相册的封面图片
                    $db_a=\think\Db::name('picture')->where('album','=',$title)->find();
                    if (!$db_a) {
                        $cover=$data['thumbnail'];
                       \think\Db::name('album')->where('title','=',$title)->update(['pic'=>$cover]);
                    } 
                    $db=\think\Db::name('picture')->insert($data);                  
                }
 
            }                   
            if($db){
                return $this->success('图片上传成功','index');
            }else{
                return $this->error('上传失败');
            }                   
        }
        return $this->fetch('addpic');
    }
    //创建相册
    public function add(){
        $bg=session('bg');
        $this->assign('bg',$bg);
        //echo $bg;die;
    	if (request()->isPOST()) {
            $title=input('title');
            $name=session('name');
            //相册
    		$data_a=[
                'name'=>$name,
    			'title'=>$title,
    			'intro'=>input('intro'),
    		];
            //图片
            $data=[
                'name'=>$name,
                'album'=>$title,
                'time'=>time(),
            ];
    		if ($_FILES['pic']['tmp_name']) {
    			$files=request()->file('pic');
                foreach ($files as $file) {
                    // 移动到框架应用根目录/public/uploads/ 目录下
                    $file_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$title);
                    $info=$file->move($file_path);
                    //$info=$file->move(ROOT_PATH.'public'.DS.'/static/album/upload/'.$album);
                    if ($info) {
                        //成功上传，获取上传信息，原图的路径
                        $data['pic']='/static/album/upload/'.$title.'/'.date('Ymd').'/'.$info->getFilename();
                        //生成缩略图
                        //echo $info->getFilename();
                        $image_path=iconv('utf-8','gb2312',ROOT_PATH.'public'.DS.$data['pic']);
                        //echo $image_path;die;
                        $image=\think\Image::open($image_path);
                        //对原始图片进行裁剪后生成缩略图，并另存
                        //echo "<br/>";echo $info->getFilename();die;
                        //缩略图路径
                        $thumb_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$title.'/'.date('Ymd').'/thumbnail_'.$info->getFilename());
                        $image->thumb(160,90,\think\Image::THUMB_CENTER)->save($thumb_path);
                        //重新获取缩略图，作为相册的封面
                        $data['thumbnail']='/static/album/upload/'.$title.'/'.date('Ymd').'/thumbnail_'.$info->getFilename();
                    }else{
                        return $this->error($file->getError());
                    }
                    \think\Db::name('picture')->insert($data);                  
                }
    		}
            //$data_a['pic']=$data['pic'];
            
            $pic=\think\Db::name('picture')->where('name','=',$name)->where('album','=',$title)->order('id asc')->limit(1)->field('thumbnail')->find();
            $data_a['pic']=$pic['thumbnail'];
            $db=\think\Db::name('album')->insert($data_a);			
			if($db){
				return $this->success('图片上传成功','index');
			}else{
				return $this->error('上传失败');
			}    				
    	}
    	return $this->fetch('add');
    }
    //删除相册
    public function delAlbum(){
		$id=input('id');
        $album=input('album');
        $pic_id_res=\think\Db::name('picture')->where('album','=',$album)->field('id')->select();
        foreach ($pic_id_res as $key => $value) {
            //获取相册中每张图片的路径
            $picres=\think\Db::name('picture')->where('id','=',$value['id'])->find();
            $time=$picres['time'];
            //echo $time;die;
            $file=ROOT_PATH.'public'.DS.$picres['pic'];
            //删除数据库中的pic文件
            $db_p=\think\Db::name('picture')->where('id','=',$value['id'])->delete();
            $file_p=unlink(iconv('utf-8','gb2312',$file));           
        };
        //删除数据库的album文件        
        $db_a=\think\Db::name('album')->delete($id);
        $file_album_path1=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$album.'/'.date('Ymd',$time));
        $file_album_path2=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$album);
        //删除创建日期子文件夹
        $file_a=rmdir($file_album_path1);
        //删除相册文件夹  
        $file_a=rmdir($file_album_path2);    
		if ($db_a && $file_a && $db_p && $file_p) {
			return $this->success('删除相册成功！','index');
		}else{
			return $this->error('删除相册失败！');
		}
    }
    //Ajax删除相册
    public function delA(){
        $id=input('id');
        //获取该相册的名称
        $albumres=\think\Db::name('album')->find($id);
        $album=$albumres['title'];
        //$album=input('album');
        $picres=\think\Db::name('picture')->where('album','=',$album)->select();
        
        foreach ($picres as $key => $value) {
            //获取相册中每张图片的路径
            $picres=\think\Db::name('picture')->where('id','=',$value['id'])->find();
            $time=$picres['time'];
            //原始图片路径
            $file=ROOT_PATH.'public'.DS.$picres['pic'];
            //缩略图路径
            $thumbnail=ROOT_PATH.'public'.DS.$picres['thumbnail'];
            //删除数据库中的pic文件
            $db_p=\think\Db::name('picture')->where('id','=',$value['id'])->delete();
            //删除上传的pic文件和缩略图文件
            $file_p=unlink(iconv('utf-8','gb2312',$file));        
            $file_p=unlink(iconv('utf-8','gb2312',$thumbnail));  
            //日期文件夹路径
            $file_album_path1=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$album.'/'.date('Ymd',$time));
            //判断该日期文件夹是否存在，并删除该文件夹 
            if (file_exists($file_album_path1)) {
                $file_a=rmdir($file_album_path1);                
            }     
        };
        //删除数据库的album文件        
        $db_a=\think\Db::name('album')->delete($id);
        //相册文件夹路径
        $file_album_path2=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$album);
        //删除相册文件夹  
        $file_a=rmdir($file_album_path2);    
        //if ($db_a && $file_a && $db_p && $file_p) {
            exit(json_encode($file_a));
        //}else{
            //return $this->error('删除相册失败！');
        //}
    }
    //Ajax修改相册名称
    public function editTitle(){
        $id=input('id');
        $title=input('title');
        $albumres=\think\Db::name('album')->find($id);
        if ($title!=$albumres['title']) {
            $db=\think\Db::name('album')->where('id','=',$id)->update(['title'=>$title]);
            exit(json_encode($db));
        }else{
            exit(json_encode($albumres));
        }         
    }   
    //Ajax修改相册intro
    public function editIntro(){
        $id=input('id');
        $intro=input('intro');
        $albumres=\think\Db::name('album')->find($id);
        if ($intro!=$albumres['intro']) {
            $db=\think\Db::name('album')->where('id','=',$id)->update(['intro'=>$intro]);
            exit(json_encode($db));
        }else{
            exit(json_encode($albumres));
        }         
    } 

    //删除照片
    public function delPicture(){
        $id=input('id');
        $name=session('name');
        $album=input('album');
        $picres=\think\Db::name('picture')->where('id','=',$id)->find();
        $file_path=ROOT_PATH.'public'.DS.$picres['pic'];
        //删除picture表中的数据
        $file=unlink(iconv('utf-8', 'gb2312', $file_path));
        $db=\think\Db::name('picture')->where('id','=',$id)->delete();
        if ($db && $file) {
            $pres=\think\Db::name('picture')->where('album','=',$album)->limit(1)->find();
            $pic=$pres['pic'];
            $data=['pic'=>$pic];
            $db_a=\think\Db::name('album')->where('name','=',$name)->where('title','=',$album)->update($data);
            //if ($db_a) {
                return $this->redirect('show',['album'=>$album]);
                //return $this->success('删除成功','show');
            //}
        }else{
            return $this->error('删除照片失败');
        }
    }
    //Ajax删除照片
    public function delPic(){
        $id=input('id');
        $name=session('name');
        //$album=input('album');
        $picres=\think\Db::name('picture')->where('id','=',$id)->find();
        $album=$picres['album'];
        $thumb=$picres['thumbnail'];
        $time=$picres['time'];
        //原始文件路径
        $file_path=ROOT_PATH.'public'.DS.$picres['pic'];
        //缩略图路径
        $thumbfile_path=ROOT_PATH.'public'.DS.$picres['thumbnail'];

        //删除picture文件
        $file=unlink(iconv('utf-8', 'gb2312', $file_path));
        $file=unlink(iconv('utf-8', 'gb2312', $thumbfile_path));

        //删除pic数据
        $db=\think\Db::name('picture')->where('id','=',$id)->delete();
        
        //如果数据库中不存在该日期的其他文件，则删除该日期文件夹,同时删除该相册对应的封面
        $time_path=iconv('utf-8', 'gb2312', ROOT_PATH.'public'.DS.'/static/album/upload/'.$album.'/'.date('Ymd',$time));

        if(rmdir($time_path)){
            \think\Db::name('album')->where('title','=',$album)->where('name','=',$name)->update(['pic'=>'']);
            exit(json_encode($db));                
        }else{
            //日期文件夹不为空，如果相册封面照片被删除，则更新相册封面
            $albumres=\think\Db::name('album')->where('title','=',$album)->find();
            //获取该相册的封面
            $thumbfile_path=ROOT_PATH.'public'.DS.$albumres['pic'];
            //如果封面照片不存在，则重新获取相册的封面 
            if(!is_file($thumbfile_path)) {
                $pres=\think\Db::name('picture')->where('album','=',$album)->order('id asc')->limit(1)->find();
                $pic=$pres['thumbnail'];
                $data=['pic'=>$pic];  
                //更新相册的封面
                $db_a=\think\Db::name('album')->where('name','=',$name)->where('title','=',$album)->update($data);     
            }
            exit(json_encode($db));       
        }
    }
    //修改相册的封面
    public function changeCover(){
        $id=input('id');
        $name=session('name');
        $album=input('album');
        //先获取这个pic的路径
        $picres=\think\Db::name('picture')->find($id);
        $thumb_url=$picres['thumbnail'];

        $db=\think\Db::name('album')->where('title','=',$album)->update(['pic'=>$thumb_url]);
        if ($db) {
            //$this->assign('album',$album);
            return $this->success('设置成功',"index");
        }else{
            return $this->error('设置封面失败');
        }
    }
    //修改主页背景
    public function changeBg(){
        $id=input('id');
        $name=session('name');
        $album=session('album');
        //echo $album;die;
        //先获取这个pic的路径
        $picres=\think\Db::name('picture')->find($id);
        $pic_url=$picres['pic'];
        \think\Session::set('bg',$pic_url);
        $bg=session('bg');
        //echo $pic_url;die;
        $db=\think\Db::name('personal')->where('name','=',$name)->update(['bg'=>$pic_url]);
        if ($db) {
            //$this->assign('album',$album);
            return $this->redirect('show',['album'=>$album]);
            //return $this->success('设置成功','album/show');
        }else{
            return $this->error('设置背景失败');
        }
    }

    //照片预览翻页功能
    //向后翻页
    public function nextPaginate(){
        $name=session('name');
        $id=input('id');
        $album=input('album');
        $picres=\think\Db::name('picture')->where('name','=',$name)->where('album','=',$album)->where('id','>',$id)->find();
        return json_encode($picres);
    }
    //向前翻页
    public function prevPaginate(){
        $name=session('name');
        $id=input('id');
        $album=input('album');
        $picres=\think\Db::name('picture')->where('name','=',$name)->where('album','=',$album)->where('id','<',$id)->order('id desc')->find();
        return json_encode($picres);
    }
}
