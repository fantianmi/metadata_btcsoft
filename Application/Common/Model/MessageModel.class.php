<?php
/**
 * 所属项目 OnePlus.
 * 开发者: 想天
 * 创建日期: 3/13/14
 * 创建时间: 7:41 PM
 * 版权所有 想天工作室(www.ourstu.com)
 */

namespace Common\Model;

use Think\Model;

class MessageModel extends Model
{
    const TYPE_REPLY_POST = 'replyPost';
    const TYPE_REPLY_REPLY = "replyReply";
    const TYPE_SYSTEM_MESSAGE = "systemMessage";

    const STATUS_NORMAL = 1;
    const STATUS_DELETE = -1;

    public function sendMessage($to_uid, $content, $type, $uid = 0, $reply_to = "", $post_id = 0, $f_reply_id = 0,
                                $to_reply_id = 0)
    {
        if (!in_array($type, [self::TYPE_REPLY_POST, self::TYPE_REPLY_REPLY, self::TYPE_SYSTEM_MESSAGE])) {
            $this->error = 'type error';
            return false;
        }

        $data = [
            'to_uid' => $to_uid,
            'content' => op_h($content),
            'type' => $type,
            'uid' => $uid,
            'reply_to' => $reply_to,
            'post_id' => $post_id,
            'f_reply_id' => $f_reply_id,
            'to_reply_id' => $to_reply_id,
            'create_time' => time(),
            'status' => self::STATUS_NORMAL
        ];

        if (strlen($content) < 1) {
            $this->error = '请输入内容';
            return false;
        }

        if ($type == self::TYPE_REPLY_POST) {
            if (intval($to_uid) <= 0) {
                $this->error = "to_uid should not be null";
                return false;
            }
            if (intval($post_id) <= 0) {
                $this->error = "post_id should not be null";
                return false;
            }
        }

        if ($type == self::TYPE_REPLY_REPLY) {
            if (intval($to_uid) <= 0) {
                $this->error = "to_uid should not be null";
                return false;
            }
            if (intval($post_id) <= 0) {
                $this->error = "post_id should not be null";
                return false;
            }
            if (intval($f_reply_id) <= 0) {
                $this->error = "f_reply_id should not be null";
                return false;
            }
            if (strlen($reply_to) < 1) {
                $this->error = "reply_to should not be null";
                return false;
            }
        }
        $res = $this->add($data);

        $count = $this->incMessageCount($to_uid);
        return $res;
    }

    public function readMessage($uid,$messageId)
    {
        if ($messageId == -1) {
            $ret = M("Message")->where(['to_uid' => $uid])->setField('is_read', 1);
            S("MessageCount{$uid}", 0);
        }else{
            $ret = M("Message")->where(['to_uid' => $uid, 'id' => $messageId])->setField('is_read', 1);
            $this->decMessageCount($uid);
        }
    }

    public function getMessageCount($uid)
    {
        $key = "MessageCount{$uid}";
        $count = S($key);
        if (!is_numeric($count)) {
            $count = M("Message")->where(['to_uid' => $uid, 'is_read' => 0])->count();
            S($key, $count);
        }
        return $count;
    }

    public function incMessageCount($uid)
    {
        $count = $this->getMessageCount($uid);
        $count++;
        S("MessageCount{$uid}", $count);
        return $count;
    }

    public function decMessageCount($uid)
    {
        $count = $this->getMessageCount($uid);
        $count--;
        if ($count < 0) $count = 0;
        S("MessageCount{$uid}", $count);
        return $count;
    }

    public function messageList($uid, $type = "", $page = 1, $pageSize = 20)
    {
        $map = [
            'to_uid' => $uid,
            'status' => self::STATUS_NORMAL
        ];
        if (in_array($type, [self::TYPE_REPLY_POST, self::TYPE_REPLY_REPLY, self::TYPE_SYSTEM_MESSAGE])) {
            $map['type'] = $type;
        }
        $lists = $this->where($map)->page($page, $pageSize)->order("create_time DESC")->select();
        return $lists;
    }

    public function deleteMessage($id)
    {
        return $this->where(['id' => $id])->setField('status', self::STATUS_DELETE);
    }

    public function deleteMessageUser($id, $uid)
    {
        return $this->where(['id' => $id, 'uid' => $uid])->setField('status', self::STATUS_DELETE);
    }

}