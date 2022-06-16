<?php

namespace Admin\Controller;

use Admin\Builder\AdminConfigBuilder;
use Admin\Builder\AdminListBuilder;
use Admin\Model\MemberModel;
use Dman\Model\AirdropDetailModel;
use Dman\Model\AirdropModel;
use Dman\Util\AirdropApiUtil;
use User\Model\UcenterMemberModel;

class NftunitController extends AdminController
{
    function index($page = 1, $pageSize = 100, $uid = 0, $username = '', $nftunit_id = '', $nickname = '')
    {
        $map['status'] = 1;
        if ($uid) {
            $map['id'] = $uid;
        }
        if ($username) {
            $map['username'] = $username;
        }
        if (strlen($nftunit_id) > 0) {
            $likemap = [];
            $likemap['nftunit_id'] = array('like', '%' . $nftunit_id . '%');
            $uids = D("Member")->field("uid")->where($likemap)->select();
            $uids = getSubByKey($uids, 'uid');
            $map['id'] = array('in', $uids);
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
            $val['nftunit_id'] = get_nftunit_id($val['id']);
            $val['auth'] = get_user_auth_name($val['id']);
            $val['total_brain'] = get_total_brain($val['id']);

        }
        $count = M("UcenterMember")->where($map)->count();
        $currentUid = is_admin_login();
        $groupId = M("AuthGroupAccess")->where(['uid' => $currentUid])->getField("group_id");

        $Builder = new AdminListBuilder();
        if ($groupId != 5) {
            $Builder->title("用户管理")->buttonNew(U("editUser"))->buttonDelete(U("deleteUser"));
            $Builder
                ->search('特工队编号', 'nftunit_id')
                ->search('地址', 'username')
                ->search('昵称', 'nickname');
            $Builder->keyId()->keyText('nftunit_id', "特工队编号")->keyText('username', '地址')->keyText('nickname', '名称')->keyText('auth', '用户类别')->keyText('total_brain', '已发放BRAIN')->keyCreateTime('reg_time')
                ->keyDoActionEdit('editUser?id=###', '编辑')->keyDoActionEdit("userAirdropDetails?uid=###", '空投发放记录')->data($lists)->pagination($count, $pageSize);
        } else {
            $Builder->title("用户管理");
            $Builder
                ->search('特工队编号', 'nftunit_id')
                ->search('地址', 'username')
                ->search('昵称', 'nickname');
            $Builder->keyId()->keyText('nftunit_id', "特工队编号")->keyText('username', '地址')->keyText('nickname', '名称')->keyText('auth', '用户类别')->keyText('total_brain', '已发放BRAIN')->keyCreateTime('reg_time')->keyDoActionEdit("userAirdropDetails?uid=###", '空投发放记录')->data($lists)->pagination($count, $pageSize);
        }

        $Builder->display();

    }

    function editUser($id = 0, $nftunit_id = '', $username = '', $nickname = '', $auth = 0, $brain_token = 0)
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
            if (strlen($nftunit_id) < 1) {
                $this->error("请输入特工队编号");
            }

            if ($id > 0) {
                $count = M("UcenterMember")->where("id != {$id} and username='{$username}'")->count();
                if ($count) {
                    $this->error("eth地址已存在");
                }
                M("UcenterMember")->where(['id' => $id])->setField("username", $username);
                $memberData = [
                    'nickname' => $nickname,
                    'nftunit_id' => $nftunit_id,
                    'brain_token' => $brain_token
                ];
                M("Member")->where(['uid' => $id])->save($memberData);
                M("AuthGroupAccess")->where(['uid' => $id])->setField("group_id", $auth);
                clean_query_user_cache($id, 'nickname');
                clean_query_user_cache($id, 'nftunit_id');
                $this->success("编辑成功", U("index"));
            } else {
                $UcenterMember = new UcenterMemberModel();
                $uid = $UcenterMember->register($username, $nickname, md5($username), null, null, 1);
                //注册方式统计
                if (0 < $uid) { //注册成功
                    $Member = new MemberModel();
                    $memberData = [
                        'nftunit_id' => $nftunit_id,
                        'brain_token' => $brain_token
                    ];
                    $Member->where(['uid' => $uid])->save($memberData);
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
                    'nftunit_id' => get_nftunit_id($id),
                    'brain_token' => get_brain_token($id),
                    'auth' => M("AuthGroupAccess")->where(['uid' => $id])->getField("group_id")
                ];
            }
            $authRadio = [];
            $authGroups = M("AuthGroup")->where(['status' => 1])->select();
            foreach ($authGroups as $val) {
                $authRadio[$val['id']] = $val['title'] . "(" . $val['description'] . ")";
            }
            $Builder = new AdminConfigBuilder();
            $Builder->title("编辑用户")->keyId()->keyText("nftunit_id", "特工队编号")->keyText('username', '地址')->keyText('nickname', '名称')->keyText("brain_token", '已空投Brain数量', '用于统计')
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

    function airdrops()
    {
        $AirdropModel = new AirdropModel();
        $lists = $AirdropModel->where("status>=0")->order("id DESC")->select();
        foreach ($lists as &$val) {
            $val['admin'] = get_nickname($val['admin_id']);
            $val['status'] = airdrop_status($val['status']);
        }
//        $Builder = new AdminListBuilder();
//        $Builder->title('空投管理')
//            ->buttonNew(U("editAirdrop"))
//            ->buttonDelete(U("deleteAirdrop"))
//            ->keyId()->keyText('title', '名称')->keyCreateTime()->keyText("admin", "添加管理员")
//            ->keyText("status", "status")->keyText("result_api", "空投API调用结果")
//            ->keyText("query_api", "空投API查询结果");
//        $Builder
//            ->keyDoActionEdit("editAirdrop?id=###", "编辑|")
//            ->keyDoActionEdit("airdropDetails?aid=###", "参与用户设置|")
//            ->keyDoActionEdit("startAirdrop?aid=###", "开始空投")
//            ->data($lists)->display();

        $this->meta_title = "空投列表";
        $this->assign("lists", $lists);
        $this->display("airdrops");

    }

    function batchAddAirdropDetails($aid, $amount, $ids = '')
    {
        $AirdropDetailModel = new AirdropDetailModel();
        if (IS_POST) {
            $ids = is_array($ids) ? $ids : explode(',', $ids);
            if (sizeof($ids) <= 0) {
                $this->error("请选择用户！");
            }
            $addLists = [];
            foreach ($ids as $id) {
                $item = [
                    'uid' => $id,
                    'address' => get_username($id),
                    'amount' => $amount,
                    'aid' => $aid,
                    'admin_id' => is_admin_login(),
                    'create_time' => time()
                ];

                if ($AirdropDetailModel->where(['aid' => $aid, 'uid' => $id])->count()) {
                    continue;
                } else {
                    $addLists[] = $item;
                }
            }
            $AirdropDetailModel->addAll($addLists);
            $this->success("添加成功", U("airdropDetails?aid={$aid}"));
        } else {
            $UcenterMemberModel = new UcenterMemberModel();
            $AirdropModel = new AirdropModel();

            $lists = $UcenterMemberModel->field("id,username,reg_time")->where(['status' => 1])->order("id desc")->select();
            foreach ($lists as &$val) {
                $val['nickname'] = get_nickname($val['id']);
            }
            $airdropTitle = $AirdropModel->where(['id' => $aid])->getField("title");
            $Builder = new AdminListBuilder();
            $Builder->title("选择参与[" . $airdropTitle . "]空投用户")
                ->buttonSetStatus(U("batchAddAirdropDetails?aid={$aid}&amount={$amount}"), 0, '确认选择', null)
                ->keyId()->keyText("username", "地址")->keyCreateTime("reg_time")->data($lists)
                ->display();
        }

    }

    function airdropDetails($aid, $address = '')
    {
        $AirdropDetailModel = new AirdropDetailModel();
        $AirdropModel = new AirdropModel();
        $map = ['aid' => $aid];
        if (eth_address_validate($address)) {
            $map['address'] = $address;
        }
        $lists = $AirdropDetailModel->where($map)->order("id DESC")->select();
        foreach ($lists as &$val) {
            $val['admin'] = get_nickname($val['admin_id']);
            $val['process_admin'] = get_nickname($val['process_admin_id']);
            $val['status'] = $val['status'] == 1 ? '已发放' : '未发放';
            $val['title'] = get_airdrop_title($val['aid']);
        }
        $airdropTitle = $AirdropModel->where(['id' => $aid])->getField("title");
        $Builder = new AdminListBuilder();
        $Builder->title($airdropTitle . "- 空投参与用户列表")
            ->buttonNew(U("jsAddAirdropDetail?aid={$aid}"))
//            ->buttonNew(U("batchAddAirdropRedirect?aid={$aid}"), '批量新增')
            ->buttonDelete(U("deleteAirdropDetails"));
        $Builder->search('地址', 'address');
        $Builder->keyId()->keyUid()->keyText("address", "地址")->keyText("amount", "BRAIN数量")
            ->keyText("title", "空投名称")->keyText('reason', '空投原因')->keyText('status', '状态')->keyCreateTime()->keyText("admin", "添加管理员")->keyText("process_admin", '执行管理员')
            ->keyDoActionEdit("editAirdropDetails?id=###")
            ->data($lists)->display();
    }

    function userAirdropDetails($uid)
    {
        $AirdropDetailModel = new AirdropDetailModel();
        $map = ['uid' => $uid];

        $lists = $AirdropDetailModel->where($map)->order("id DESC")->select();
        foreach ($lists as &$val) {
            $val['admin'] = get_nickname($val['admin_id']);
            $val['process_admin'] = get_nickname($val['process_admin_id']);
            $val['status'] = $val['status'] == 1 ? '已发放' : '未发放';
            $val['title'] = get_airdrop_title($val['aid']);
            $val['txid'] = get_txid($val['aid']);


        }
        $Builder = new AdminListBuilder();
        $Builder->title("用户UID {$uid} 空投发放记录");
        $Builder->keyId()->keyText('txid', 'txHash')->keyUid()->keyText("address", "地址")->keyText("amount", "BRAIN数量")
            ->keyText("title", "title")->keyText('reason', '发放原因')->keyText('status', '状态')->keyCreateTime()->keyText("admin", "添加管理员")->keyText("process_admin", '执行管理员')
//            ->keyDoActionEdit("editAirdropDetails?id=###")
            ->data($lists)->display();
    }

    function restartAirdrop($aid)
    {
        $AirdropModel = new AirdropModel();
        $AirdropDetailModel = new AirdropDetailModel();
        $airdrop = $AirdropModel->find($aid);
        if ($airdrop['status'] == $AirdropModel::STATUS_PROCESSING) {
            $resultApi = $airdrop['result_api'];
            $res = json_decode(json_decode($resultApi,true),true);
            if (intval($res['code']) == 500) {
                $lists = $AirdropDetailModel->where(['aid' => $aid])->order("id DESC")->select();
                $AirdropUtil = new AirdropApiUtil();
                foreach ($lists as $val) {
                    $addressList[] = $val['address'];
                    $amountList[] = $val['amount'];
                }
                $result = $AirdropUtil->paySend($addressList, $amountList);
                $data = [
                    'status' => $AirdropModel::STATUS_PROCESSING,
                    'result_api' => $result,
                    'process_time' => time(),
                    'process_admin_id' => is_admin_login()
                ];
                $AirdropModel->where(['id' => $aid])->save($data);
                $AirdropDetailModel->where(['aid' => $aid])->setField("status", 1);
                $this->success("操作成功");
            } else {
                $this->error("error:" . json_encode($res));
            }
        }
        $this->error("状态无法进行此操作");
    }

    function startAirdrop($aid)
    {

        $AirdropDetailModel = new AirdropDetailModel();
        $AirdropModel = new AirdropModel();
        $airdrop = $AirdropModel->find($aid);
        if (!$airdrop) {
            $this->error("空投不存在");
        }
        $lists = $AirdropDetailModel->where(['aid' => $aid])->order("id DESC")->select();
        if ($airdrop['status'] == $AirdropModel::STATUS_WAITING) {
            $AirdropUtil = new AirdropApiUtil();
            foreach ($lists as $val) {
                $addressList[] = $val['address'];
                $amountList[] = $val['amount'];
            }
            $result = $AirdropUtil->paySend($addressList, $amountList);
            $data = [
                'status' => $AirdropModel::STATUS_PROCESSING,
                'result_api' => $result,
                'process_time' => time(),
                'process_admin_id' => is_admin_login()
            ];
            $AirdropModel->where(['id' => $aid])->save($data);
            $AirdropDetailModel->where(['aid' => $aid])->setField("status", 1);

            $res = $result;
        } else {
            $res = $airdrop['result_api'];

        }


        $title = $airdrop['title'];
        $this->assign("title", "[" . $title . "] 空投结果");
        $this->meta_title = "[" . $title . "] 空投结果";
        $this->assign("result", $res);
        $this->assign("aid", $aid);
        $this->assign("list", $lists);
        $this->display("process_airdrop");
    }

    function batchAddAirdropRedirect($aid)
    {
        if (IS_POST) {
            $amount = I("amount", 0, 'floatval');
            if ($amount <= 0) {
                $this->error("BRAIN数量大于0");
            }
            $this->success("请选择用户", U("batchAddAirdropDetails?aid={$aid}&amount={$amount}"));
        } else {
            $AirdropModel = new AirdropModel();
            $status = $AirdropModel->where(['id' => $aid])->getField("status");
            if ($status != $AirdropModel::STATUS_WAITING) {
                $this->error("已经开始的空投无法添加");
            }
            $data['aid'] = $aid;
            $Builder = new AdminConfigBuilder();
            $Builder->title("添加空投用户")
                ->keyText("aid", "空投id")
                ->keyText("amount", "空投BRAIN数量")
                ->buttonSubmit(U("batchAddAirdropRedirect"), "下一步：选择参与用户")->buttonBack()->data($data)->display();
        }
    }

    function jsAddAirdropDetail($aid)
    {
        $AirdropDetailModel = new AirdropDetailModel();
        $AirdropModel = new AirdropModel();

        $status = $AirdropModel->where(['id' => $aid])->getField("status");
        if ($status != $AirdropModel::STATUS_WAITING) {
            $this->error("已经开始的空投无法添加");
        }
        $map = ['aid' => $aid];

        $lists = $AirdropDetailModel->where($map)->order("id DESC")->select();


        foreach ($lists as &$val) {
            $val['nftunit_id'] = get_nftunit_id($val['uid']);
            $val['nickname'] = get_nickname($val['uid']);
        }

        $this->meta_title = "添加参与用户";
        $this->assign("aid", $aid);
        $this->assign("list", $lists);
        $this->display("js_add_airdrop");
    }

    function jsUserData()
    {
        $users = M("UcenterMember")->where('status=1')->order("id ASC")->field("id,username")->select();

        $return = [];
        foreach ($users as $val) {
            $return[] = [
                'text' => "编号：" . get_nftunit_id($val['id']) . ";名称：" . get_nickname($val['id']) . ";地址：{$val['username']}",
                'value' => $val['id'],
                'keys' => ""
            ];
        }
        $this->success(json_encode($return));
//        echo json_encode($return);
    }

    function jsAddAirdropDetailAjax()
    {
        $uid = I("user", 0, 'intval');
        $amount = I("amount", 0, 'floatval');
        $reason = I("reason", '', 'op_t');
        $aid = I("aid", 0, 'intval');
        if ($uid <= 0 || $amount <= 0 || $aid <= 0) {
            $this->error("参数错误");
        }
        $AirdropDetailModel = new AirdropDetailModel();
        $item = [
            'uid' => $uid,
            'address' => get_username($uid),
            'amount' => $amount,
            'reason' => $reason,
            'aid' => $aid,
            'admin_id' => is_admin_login(),
            'create_time' => time()
        ];

        if ($AirdropDetailModel->where(['aid' => $aid, 'uid' => $uid])->count()) {
            $this->error("该用户已添加");
        } else {
            $AirdropDetailModel->add($item);
            $this->success("操作成功");
        }
    }

    function editAirdrop($id = 0, $title = '')
    {
        $AirdropModel = new AirdropModel();
        if (IS_POST) {
            if ($id) {
                $data = $AirdropModel->find($id);
                if ($data['status'] != $AirdropModel::STATUS_WAITING) {
                    $this->error("只有未开始空投可以修改");
                }
                $AirdropModel->where(['id' => $id])->setField('title', $title);
                $this->success("操作成功", U("airdrops"));
            } else {
                $data = [
                    'title' => $title,
                    'create_time' => time(),
                    'amount' => 0,
                    'admin_id' => is_admin_login(),
                    'status' => $AirdropModel::STATUS_WAITING
                ];
                $AirdropModel->add($data);
                $this->success("操作成功", U("airdrops"));
            }
        } else {
            $data = [];
            if ($id) {
                $data = $AirdropModel->find($id);
            }
            $Builder = new AdminConfigBuilder();
            $Builder->title("编辑空投")
                ->keyText("title", "名称")
                ->buttonSubmit()->buttonBack()->data($data)->display();
        }
    }

    function deleteAirdrop($ids = '')
    {
        $AirdropModel = new AirdropModel();
        $ids = is_array($ids) ? $ids : explode(',', $ids);
        $map = array('id' => array('in', $ids));
        $map['status'] = 0;
        $ids = $AirdropModel->where($map)->select();
        foreach ($ids as $id) {
            $id = $id['id'];
            D("AirdropDetail")->where(['aid' => $id])->delete();
        }
        $AirdropModel->where($map)->setField('status', -1);
        $this->success("已删除");
    }

    function editAirdropDetails($id, $amount = 0)
    {
        $AirdropDetailModel = new AirdropDetailModel();
        if (IS_POST) {
            $airdropDetail = $AirdropDetailModel->find($id);
            if ($airdropDetail && $airdropDetail['status'] == 1) {
                $this->error("已发放的空投没有权限更改");
            }
            if (floatval($amount) <= 0) {
                $this->error("BRAIN数量大于0");
            }
            $AirdropDetailModel->where(['id' => $id])->setField("amount", $amount);
            $this->success("操作成功", U("airdropDetails?aid=" . $airdropDetail['aid']));
        } else {
            $data = $AirdropDetailModel->where(['id' => $id])->find();
            $Builder = new AdminConfigBuilder();
            $Builder->title("编辑参与用户")
                ->keyId()->keyUid('uid', 'uid')
                ->keyText("address", "地址")
                ->keyText("amount", "空投BRAIN数量")
                ->buttonSubmit()->buttonBack()
                ->data($data)
                ->display();
        }
    }

    function deleteAirdropDetails($ids = '')
    {
        $ids = is_array($ids) ? $ids : explode(',', $ids);
        $AirdropDetailModel = new AirdropDetailModel();
        $map['id'] = array('in', $ids);
        $map['status'] = array('neq', 1);
        $AirdropDetailModel->where($map)->delete();
        $this->success("操作成功");
    }

    function airdropLog()
    {
        $list = $this->lists('Airdrop', ['status' => 1], "id DESC");
        foreach ($list as &$val) {
            $resultApi = $val['result_api'];
            $resultJson = json_decode(json_decode($resultApi, true), true);
            $txHash = $resultJson['data'];

            $val['txHash'] = $txHash;
        }

        $this->assign("title", "空投公示");
        $this->meta_title = "空投公示";
        $this->assign("_list", $list);
        $this->display("airdrop_log");
    }

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