<?php
namespace app\index\model;
use think\Model;
//use think\Session;

class Index extends Model{
	public function addgood($time){
		$good=\think\Db::name('diary')->where('time','=',$time)->field('good')->find();
		if ($good) {
			$good++;
			$addgood=\think\Db::name('diary')->update(['good'=>$good]);
			if ($addgood) {
				return $this->fetch();
			}
		}
		
    }
}    

