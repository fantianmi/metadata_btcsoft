<?php

namespace Admin\Controller;

use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminListBuilder;
use Admin\Model\MemberModel;
use User\Model\UcenterMemberModel;

/**
 * NFTCN NFT MINT 工具API
 */
class NftcnController extends AdminController
{
    /**
     * @param int $page
     * @param int $pageSize
     * @param int $uid
     * @param string $username
     * @param string $nftunit_id
     * @param string $nickname
     */
    function index($page = 1, $pageSize = 100, $uid = 0, $username = '', $nickname = '')
    {
        $map['status'] = 1;
        if ($uid) {
            $map['id'] = $uid;
        }
        if ($username) {
            $map['username'] = $username;
        }
        if (strlen($nickname) > 0) {
            $likemap = [];
            $likemap['nickname'] = array('like', '%' . $nickname . '%');
            $uids = D("Member")->field("uid")->where($likemap)->select();
            $uids = getSubByKey($uids, 'uid');
            $map['id'] = array('in', $uids);
        }
        $lists = M("UcenterMember")->where($map)->order("id ASC")->page($page, $pageSize)->field("id,username,reg_time")->select();
        foreach ($lists as &$val) {
            $val['nickname'] = get_nickname($val['id']);
            $val['auth'] = get_user_auth_name($val['id']);
        }
        $count = M("UcenterMember")->where($map)->count();
        $currentUid = is_admin_login();
        $groupId = M("AuthGroupAccess")->where(['uid' => $currentUid])->getField("group_id");

        $Builder = new AdminListBuilder();

        $Builder->title("用户管理");
        $Builder
            ->search('地址', 'username')
            ->search('昵称', 'nickname');
        $Builder->keyId()->keyText('username', '地址')->keyText('nickname', '名称')->keyText('auth', '用户类别')->keyCreateTime('reg_time')->data($lists)->pagination($count, $pageSize);
        $Builder->display();

    }

    function editUser($id = 0, $username = '', $nickname = '', $auth = 0)
    {
        $username = strtolower($username);
        if (IS_POST) {
            if ($auth <= 0) {
                $this->error("请选择用户类别");
            }
            if (!eth_address_validate($username)) {
                $this->error("eth地址不合法");
            }
            if (strlen($nickname) < 1) {
                $this->error("请输入名称");
            }

            if ($id > 0) {
                $count = M("UcenterMember")->where("id != {$id} and username='{$username}'")->count();
                if ($count) {
                    $this->error("eth地址已存在");
                }
                M("UcenterMember")->where(['id' => $id])->setField("username", $username);
                $memberData = [
                    'nickname' => $nickname,
                ];
                M("Member")->where(['uid' => $id])->save($memberData);
                M("AuthGroupAccess")->where(['uid' => $id])->setField("group_id", $auth);
                clean_query_user_cache($id, 'nickname');
                $this->success("编辑成功", U("index"));
            } else {
                $UcenterMember = new UcenterMemberModel();
                $uid = $UcenterMember->register($username, $nickname, md5($username), null, null, 1);
                //注册方式统计
                if (0 < $uid) { //注册成功
                    M("AuthGroupAccess")->add(['uid' => $uid, 'group_id' => $auth]);
                    $this->success("新增成功", U("index"));
                } else { //注册失败，显示错误信息
                    $this->error($this->showRegError($uid));
                }
            }
        } else {
            $data = [];
            if ($id) {
                $data = [
                    'id' => $id,
                    'username' => M("UcenterMember")->where(['id' => $id])->getField("username"),
                    'nickname' => get_nickname($id),
                    'auth' => M("AuthGroupAccess")->where(['uid' => $id])->getField("group_id")
                ];
            }
            $authRadio = [];
            $authGroups = M("AuthGroup")->where(['status' => 1])->select();
            foreach ($authGroups as $val) {
                $authRadio[$val['id']] = $val['title'] . "(" . $val['description'] . ")";
            }
            $Builder = new AdminConfigBuilder();
            $Builder->title("编辑用户")->keyId()->keyText('username', '地址')->keyText('nickname', '名称')
                ->keyRadio('auth', '用户类别', '', $authRadio)->data($data)->buttonSubmit()->buttonBack()->display();
        }
    }

    function deleteUser($ids = '')
    {
        $ids = is_array($ids) ? $ids : explode(',', $ids);
        $map = array('id' => array('in', $ids));
        $map2 = array('uid' => array('in', $ids));
        M("UcenterMember")->where($map)->setField('status', -1);
        M("Member")->where($map2)->setField("status", -1);
        $this->success("已删除");
    }

    //TODO NFT 管理

    //TODO NFT mint

    //TODO NFT 列表


    public function showRegError($code = 0)
    {
        switch ($code) {
            case -1:
                $error = L('') . modC('USERNAME_MIN_LENGTH', 2, 'USERCONFIG') . '-' . modC('USERNAME_MAX_LENGTH', 32, 'USERCONFIG') . L('_ERROR_LENGTH_2_') . L('_EXCLAMATION_');
                break;
            case -2:
                $error = L('_ERROR_USERNAME_FORBIDDEN_') . L('_EXCLAMATION_');
                break;
            case -3:
                $error = L('_ERROR_USERNAME_USED_') . L('_EXCLAMATION_');
                break;
            case -4:
                $error = L('_ERROR_LENGTH_PASSWORD_') . L('_EXCLAMATION_');
                break;
            case -5:
                $error = L('_ERROR_EMAIL_FORMAT_2_') . L('_EXCLAMATION_');
                break;
            case -6:
                $error = L('_ERROR_EMAIL_LENGTH_') . L('_EXCLAMATION_');
                break;
            case -7:
                $error = L('_ERROR_EMAIL_FORBIDDEN_') . L('_EXCLAMATION_');
                break;
            case -8:
                $error = L('_ERROR_EMAIL_USED_2_') . L('_EXCLAMATION_');
                break;
            case -9:
                $error = L('_ERROR_PHONE_FORMAT_2_') . L('_EXCLAMATION_');
                break;
            case -10:
                $error = L('_ERROR_FORBIDDEN_') . L('_EXCLAMATION_');
                break;
            case -11:
                $error = L('_ERROR_PHONE_USED_') . L('_EXCLAMATION_');
                break;
            case -20:
                $error = L('_ERROR_USERNAME_FORM_') . L('_EXCLAMATION_');
                break;
            case -30:
                $error = L('_ERROR_NICKNAME_USED_') . L('_EXCLAMATION_');
                break;
            case -31:
                $error = L('_ERROR_NICKNAME_FORBIDDEN_2_') . L('_EXCLAMATION_');
                break;
            case -32:
                $error = L('_ERROR_NICKNAME_FORM_') . L('_EXCLAMATION_');
                break;
            case -33:
                $error = L('_ERROR_LENGTH_NICKNAME_1_') . modC('NICKNAME_MIN_LENGTH', 2, 'USERCONFIG') . '-' . modC('NICKNAME_MAX_LENGTH', 32, 'USERCONFIG') . L('_ERROR_LENGTH_2_') . L('_EXCLAMATION_');;
                break;
            default:
                $error = L('_ERROR_UNKNOWN_');
        }
        return $error;
    }

}