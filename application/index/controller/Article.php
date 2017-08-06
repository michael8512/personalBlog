<?php
namespace app\index\controller;
use \think\Controller;
use \think\Request;

class Article extends Base{
    public function index(){
        $name=session('name');
        $artlist=\think\Db::name('article')->where('name','=',$name)->select();
        $this->assign('artlist',$artlist);

        return $this->fetch();
    }

    public function showarticle(){
        $name=session('name');    
        $id=input('id');
        //点击量自增
        \think\Db::name('article')->where('name','=',$name)->where('id','=',$id)->setInc('click');
        $artres=\think\Db::name('article')->where('name','=',$name)->find($id);
        //取出上一篇和下一篇的文章标题
        $nextartres=\think\Db::name('article')->where('name','=',$name)->where('id','>',$id)->limit(1)->find();
        $preartres=\think\Db::name('article')->where('name','=',$name)->where('id','<',$id)->limit(1)->find();
        $artlist=\think\Db::name('article')->where('name','=',$name)->select();
        /*echo "<pre>";
        print_r($nextartres);
        echo "</pre>";die;*/
        $this->assign('artres',$artres);
        $this->assign('artlist',$artlist);

        if ($nextartres) {
            $this->assign('nextartres',$nextartres);
        }else{
            $nextartres=[
                'id'=>0,
                'article'=>'',
            ];
            $this->assign('nextartres',$nextartres);
        }
        if ($preartres) {
            $this->assign('preartres',$preartres);
        }else{
            $preartres=[
                'id'=>0,
                'article'=>'',
            ];
            $this->assign('preartres',$preartres);
        }
        return $this->fetch('article');
    }
}
