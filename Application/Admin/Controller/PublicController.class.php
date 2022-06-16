<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

use User\Api\UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class PublicController extends \Think\Controller
{

    public function walletLogin($address, $post)
    {
        if ($post) {
            $address = strtolower($address);
            $uid = UCenterMember()->loginWithAddress($address);
            if (0 < $uid) { //UC登录成功
                /* 登录用户 */
                $Member = D('Member');
                if ($Member->login($uid)) { //登录用户
                    //TODO:跳转到登录前页面
//                    $groupId = M("AuthGroupAccess")->where(['uid' => $uid])->getField("group_id");
                    $url = U("Nftunit/index"); // homepage
                    $this->success(L('_LOGIN_SUCCESS_'), $url);
                } else {
                    $this->error($Member->getError());
                }
            } else { //登录失败
                switch ($uid) {
                    case -1:
                        $error = L('_USERS_DO_NOT_EXIST_OR_ARE_DISABLED_');
                        break; //系统级别禁用
                    case -2:
                        $error = L('_PASSWORD_ERROR_');
                        break;
                    default:
                        $error = L('_UNKNOWN_ERROR_');
                        break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }
        } else {
            if (is_admin_login()) {
                $this->redirect('Index/index');
            } else {
                /* 读取数据库中的配置 */
                $config = S('DB_CONFIG_DATA');
                if (!$config) {
                    $config = D('Config')->lists();
                    S('DB_CONFIG_DATA', $config);
                }
                C($config); //添加配置

                $this->display();
            }
        }
    }

    /**
     * 后台用户登录
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function login($username = null)
    {
        $this->walletLogin($username, IS_POST);
    }

    /* 退出登录 */
    public function logout()
    {
        if (is_admin_login()) {
            D('Member')->logout();
            session('[destroy]');
            session("user_auth", null);
            session("user_auth_sign", null);
            $this->success(L('_EXIT_SUCCESS_'), U('login'));
        } else {
            $this->redirect('login');
        }
    }

    public function verify()
    {
        verify("admin");
        // $verify = new \Think\Verify();
        // $verify->entry(1);
    }

}