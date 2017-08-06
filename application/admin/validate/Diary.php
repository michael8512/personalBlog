<?php
namespace app\admin\validate;
use think\Validate;

class Diary extends Validate{
    protected $rule = [
        'diary'  =>  'require|max:100',
    ];
    protected $message  =   [
        'diary.require' => '说说内容不能为空',
        'diary.max' => '说说字数不能超过100',
    ];
}
