<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com>
//<http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE' => 'Admin',
    'MODULE_DENY_LIST' => array('Common', 'User'),
//'MODULE_ALLOW_LIST'  => array('Home','Admin'),

    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'xVDCW4UlOqSocBsvb3NeP0HFnzuAwGgTEtpQ26hy', //默认数据加密KEY

    /* 调试配置 */
    'SHOW_PAGE_TRACE' => false,

    /* 用户相关设置 */
    'USER_MAX_CACHE' => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL' => 3, //URL模式  默认关闭伪静态
    'VAR_URL_PARAMS' => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR' => '/', //PATHINFO URL分割符
    'URL_HTML_SUFFIX' => 'html',  // URL伪静态后缀设置

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数

    /* 数据库配置 */
    'DB_TYPE' => 'mysqli', // 数据库类型
    'DB_HOST' => '127.0.0.1', // 服务器地址
    'DB_NAME' => 'nftunit', // 数据库名
    'DB_USER' => 'nftunit', // 用户名
    'DB_PWD' => 'rTE3PHhnwaekfDyW',  // 密码
    'DB_PORT' => '3306', // 端口
    'DB_PREFIX' => 'ocenter_', // 数据库表前缀

    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),
    'LOAD_EXT_CONFIG' => 'router',
//为防止漏洞在ThinkPHP/Library/Think/Upload.class.php 一起更改
    /* 文件上传相关配置 */
    'DOWNLOAD_UPLOAD' => array(
        'mimes' => '', //允许上传的文件MiMe类型
        'maxSize' => 5 * 1024 * 1024, //上传的文件大小限制 (0-不做限制)
        'exts' => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
        'autoSub' => true, //自动子目录保存文件
        'subName' => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Download/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt' => '', //文件保存后缀，空则使用原后缀
        'replace' => false, //存在同名是否覆盖
        'hash' => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //下载模型上传配置（文件上传类配置）


    /* 图片上传相关配置 */
    'PICTURE_UPLOAD' => array(
        'mimes' => '', //允许上传的文件MiMe类型
        'maxSize' => 2 * 1024 * 1024, //上传的文件大小限制 (0-不做限制)
        'exts' => 'jpg,gif,png,jpeg', //允许上传的文件后缀
        'autoSub' => true, //自动子目录保存文件
        'subName' => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Picture/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt' => '', //文件保存后缀，空则使用原后缀
        'replace' => true, //存在同名是否覆盖
        'hash' => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //图片上传相关配置（文件上传类配置）

    'PICTURE_UPLOAD_DRIVER' => 'local',
    'DOWNLOAD_UPLOAD_DRIVER' => 'local',
//本地上传文件驱动配置
    'UPLOAD_LOCAL_CONFIG' => array(),

    /* 编辑器图片上传相关配置 */
    'EDITOR_UPLOAD' => array(
        'mimes' => '', //允许上传的文件MiMe类型
        'maxSize' => 2 * 1024 * 1024, //上传的文件大小限制 (0-不做限制)
        'exts' => 'jpg,gif,png,jpeg', //允许上传的文件后缀
        'autoSub' => true, //自动子目录保存文件
        'subName' => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Editor/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt' => '', //文件保存后缀，空则使用原后缀
        'replace' => false, //存在同名是否覆盖
        'hash' => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ),
    'DEFAULT_THEME' => 'default', // 默认模板主题名称
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__ZUI__' => __ROOT__ . '/Public/zui'

    ),
//Session配置——存入数据库（实现用户在线统计）
//    'SESSION_TYPE' => 'db',            //数据库存储session
    'SESSION_EXPIRE' => 86400,                //session过期时间
//'SESSION_TABLE'         => 'ocenter_session',    //存session的表，系统默认使用DB_PREFIX.'session'。该条应被注释掉


//    'DATA_CACHE_PREFIX' => 'Redis_',//缓存前缀
//    //'DATA_CACHE_TYPE' => 'Redis',//默认动态缓存为Redis
//    'REDIS_RW_SEPARATE' => true, //Redis读写分离 true 开启
//    'REDIS_HOST' => '127.0.0.1', //redis服务器ip，多台用逗号隔开；读写分离开启时，第一台负责写，其它[随机]负责读；
//    'REDIS_PORT' => '6379',//端口号
//    'REDIS_TIMEOUT' => '300',//超时时间
//    'REDIS_PERSISTENT' => false,//是否长连接 false=短连接
//    'REDIS_AUTH' => 'dmanswap',//AUTH认证密码

    //接口配置
    'API_KEY' => "d19cabf1dade2e32d530adc339770029",//用于签名的key
//    //检测更新
//    'APP_VERSION' => array(
//        'android' => [
//            'downloadUrl' => "https://download.dman.app",
//            'versionName' => '5.0.3',
//            'versionBuild' => 503,
//            'forceUpdate' => false,
//            'note' => "5.0.3 加入文字分享功能，优化app"
//        ],
//        'ios' => [
//            'downloadUrl' => "https://download.dman.app",
//            'versionName' => '5.0.3',
//            'versionBuild' => 503,
//            'forceUpdate' => false,
//            'note' => "5.0.3 加入文字分享功能，优化app"
//        ]
//    ),
    'URL_CONFIG' => [
        'shareUrl' => 'https://api.dman.app',
        'apiUrl' => 'https://api.dman.app',
        'imageUrl' => "https://image.dman.app/",
        'walletRpc'=>"http://localhost:12555"
    ],
    'WALLET_ADDRESS' => [
        'withdraw' => '0xBBE5aE7fd6946F87801009d7Bf0A255974059851',
        'zero' => "0x0000000000000000000000000000000000000000",
    ]
);
