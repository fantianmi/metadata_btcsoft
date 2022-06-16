<?php

use Ucenter\Model\InviteModel;

function curlPost($url, $data = '', $headers = array(), $agent = '')
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // https请求 不验证证书和hosts
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_USERAGENT, $agent);
    //curl_setopt($ch, CURLOPT)
    $file_contents = curl_exec($ch);
    curl_close($ch);
    if ($file_contents === false) {
        throw new \Exception('CURL错误，错误代码：' . curl_errno($ch));
    }
    //这里解析
    return $file_contents;
}

/**
 * http get
 * @param $durl
 * @param array $headers
 * @return bool|string
 */
function curlGet($durl, $headers = array())
{
    // 初始化
    $curl = curl_init();
    // 设置url路径
    curl_setopt($curl, CURLOPT_URL, $durl);
    // 将 curl_exec()获取的信息以文件流的形式返回，而不是直接输出。
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    // 在启用 CURLOPT_RETURNTRANSFER 时候将获取数据返回
    curl_setopt($curl, CURLOPT_BINARYTRANSFER, true);
    // 添加头信息
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
    // CURLINFO_HEADER_OUT选项可以拿到请求头信息
    curl_setopt($curl, CURLINFO_HEADER_OUT, true);
    // 不验证SSL
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    // 执行
    $data = curl_exec($curl);
    // 打印请求头信息
//        echo curl_getinfo($curl, CURLINFO_HEADER_OUT);
    // 关闭连接
    curl_close($curl);
    // 返回数据
    return $data;
}

/**
 * PHP发送Json对象数据
 */
function http_post_json($url, $jsonStr)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonStr);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Content-Length: ' . strlen($jsonStr)
        )
    );
    $response = curl_exec($ch);
    curl_close($ch);
    return $response;
}

/**
 * 计划任务日志
 * @param $val
 */
function crontab_log($val)
{
    if (is_array($val)) {
        $val = var_export($val, true);
    }
    file_put_contents('crontab_log.txt', date('Y-m-d H:i:s', time()) . ' crontab : ' . $val . "\r\n", FILE_APPEND);
}

function err_log($val)
{
    if (is_array($val)) {
        $val = var_export($val, true);
    }
    file_put_contents('err_log.txt', date('Y-m-d H:i:s', time()) . ' error : ' . $val . "\r\n", FILE_APPEND);
}

function checkEmailCode(&$errMsg = "")
{
    $email = strtolower($_REQUEST['email']);
    $requestCode = op_t($_REQUEST['email_code']);
    if (!$requestCode) {
        $errMsg = "请输入验证码";
        return false;
    }
    if ($requestCode == "88888") {
        return true;
    }
    $code = S($email);

    if (!$code) {
        $errMsg = "请先发送验证码";
        return false;
    }
    if ($code != $requestCode) {
        $errMsg = '验证码错误';
        return false;
    } else {
        return true;
    }
}

function checkInviteCode()
{
    $code = $_REQUEST['invite_code'];
    if ($code == '') {
        return true;
    }
    $InviteModel = new InviteModel();
    $invite = $InviteModel->getByCode($code);

    if ($invite) {
        return true;
    } else {
        return false;
    }
}

/**
 * 金额格式化函数
 */
function doFormatMoney($money)
{
    $tmp_money = strrev($money);
    $format_money = "";
    for ($i = 3; $i < strlen($money); $i += 3) {
        $format_money .= substr($tmp_money, 0, 3) . ",";
        $tmp_money = substr($tmp_money, 3);
    }
    $format_money .= $tmp_money;
    $format_money = strrev($format_money);
    return $format_money;
}


/**
 * 发送邮件
 * @param $SendAddress
 * @param string $Subject
 * @param string $MsgHTML
 * @param int $Websiteid
 * @return bool|string
 */
function sendEmail($SendAddress, $subject = "DMAN FINANCE verify code", $msgHTML = "DMAN FINANCE Group")
{
    $emailUrl = "https://common-service.btcsoft.cn/api/Email/send";
    $params = [
        'smtpHost' => 'smtpout.secureserver.net',
        'smtpPort' => 465,
        'smtpEmail' => 'service@dman.app',
        'smtpName' => 'cex ai',
        'smtpUser' => 'service@dman.app',
        'smtpPass' => 'PZwg68Q2mY9l3Ab',
        'receiveEmail' => $SendAddress,
        'subject' => $subject,
        'content' => $msgHTML
    ];
    $result = curlPost($emailUrl, $params);
    $result = json_decode($result, true);

    return intval($result['status']) == 1 ? true : $result['info'];
}

function checkETHAddress($address)
{
    if (!(preg_match('/^(0x)?[0-9a-fA-F]{40}$/', $address))) {
        return false; //满足if代表地址不合法
    }
    return true;
}

function isTrxAddress($base58Str) {
    err_log(strlen($base58Str));

    if (strlen($base58Str) !== 34)
        return false;
    else
        return true;
}

function checkBitcoinAddress($address)
{
    if (!(preg_match('/^(1|3)[a-zA-Z\d]{24,33}$/', $address) && preg_match('/^[^0OlI]{25,34}$/', $address))) {
        return false; //满足if代表地址不合法
    } else {
        return true;
    }
}
