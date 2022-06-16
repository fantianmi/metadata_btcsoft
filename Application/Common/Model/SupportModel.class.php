<?php
/**
 * Created by PhpStorm.
 * User: Yixiao Chen
 * Date: 2015/4/30 0030
 * Time: 下午 3:39
 */

namespace Common\Model;


use Think\Model;

class SupportModel extends Model
{
    protected $tableName = 'support';

//    /**取得赞的数量
//     * @param $appname
//     * @param $table
//     * @param $row
//     * @return mixed
//     */
//    public function getSupportCount($appname, $table, $row)
//    {
//        return $this->where(array('appname' => $appname, 'table' => $table, 'row' => $row))->cache($this->getCacheTag($appname, $table, $row))->count();
//    }

    /**清除赞缓存
     * @param $appname
     * @param $table
     * @param $row
     */
    public function clearCache($appname, $table, $row)
    {
        S($this->getCacheTag($appname, $table, $row), null);
        if ($table == 'weibo' || $table == 'weibo_comment') {//点赞后清除微博html缓存
            D('Weibo/WeiboCache')->cleanCache($row);
        }
    }

    private function getCacheTag($appname, $table, $row)
    {
        return 'support_count_' . $appname . '_' . $table . '_' . $row;
    }

    public function getSupported($app, $table, $row, $user_fields = array('uid', 'space_url'), $num = 5)
    {
        $supported = $this->where(array('appname' => $app, 'table' => $table, 'row' => $row))->order('create_time desc')->limit($num)->select();
        foreach ($supported as &$v) {
            $v['user'] = query_user($user_fields, $v['uid']);
        }
        unset($v);
        return $supported;
    }

    public function isSupport($app, $table, $row, $uid)
    {
        $supportedUser = $this->getSupportedUser($app, $table, $row);
        $supportedUid = getSubByKey($supportedUser, 'uid');
        if (in_array($uid, $supportedUid)) {
            return true;
        } else {
            return false;
        }
    }

    public function support($app, $table, $row, $uid, &$errMsg = "")
    {
        $supportedUser = $this->getSupportedUser($app, $table, $row);
        $isSupport = $this->isSupport($app, $table, $row, $uid);
        if ($isSupport) {
            $errMsg = "您已点过赞";
            return false;
        } else {
            $data = [
                'appname' => $app,
                'row' => $row,
                'table' => $table,
                'uid' => $uid
            ];
            $data['id'] = M("Support")->add($data);
            $supportedUser[] = $data;
            S("support_user_{$app}_{$table}_{$row}", $supportedUser);
            return true;
        }
    }

    public function getSupportCount($app,$table,$row){
        $supportedUser = $this->getSupportedUser($app, $table, $row);
        return sizeof($supportedUser);
    }

    public function getSupportedUser($app, $table, $row)
    {
        $data = S("support_user_{$app}_{$table}_{$row}");
        if ($data === null) {
            $data = $this->where(array('appname' => $app, 'table' => $table, 'row' => $row))->order('create_time desc')->select();
            $data = $data == null ? [] : $data;
            S("support_user_{$app}_{$table}_{$row}", $data);
        }
        return $data;
    }
}