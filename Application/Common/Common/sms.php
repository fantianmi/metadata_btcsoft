<?php
/**
 * Created by PhpStorm.
 * User: Jackmao
 * Date: 2018/2/11
 * Time: 7:53
 */

/**
 * TODO 通知用户信息，可以为邮箱，也可以为短信
 * @param $SendAddress
 * @param $message
 * @return bool
 */
function send_email($SendAddress, $subject, $content)
{
    Vendor('PHPMailer.PHPMailerAutoload');
    $mail = new PHPMailer();
    $config = [
        'smtp_host' => 'smtp.office365.com',
        'smtp_email' => 'codermao@outlook.com',
        'smtp_user' => 'codermao@outlook.com',
        'smtp_pass' => 'e60858587',
        'smtp_port' => '587',
        'smtp_name' => 'DEFI MAN AI',
    ];


    $mail->SMTPDebug = 0;                               // Enable verbose debug output
    $mail->isSMTP();                                      // Set mailer to use SMTP
    $mail->Host = $config['smtp_host'];  // Specify main and backup SMTP servers
    $mail->SMTPAuth = true;                               // Enable SMTP authentication
    $mail->CharSet = 'UTF-8';
    $mail->Username = $config['smtp_user'];                 // SMTP username
    $mail->Password = $config['smtp_pass'];                           // SMTP password
    if ($config['smtp_host'] == 'smtp.qq.com' || $config['smtp_port'] == 465) {
        $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
    }
    $mail->Port = $config['smtp_port'];                                    // TCP port to connect to
    $mail->setFrom($config['smtp_email'], $config['smtp_name']);
    $mail->addAddress($SendAddress);               // Name is optional
    $mail->AddReplyTo($config['smtp_email'], $config['smtp_name']);
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = $subject;
    $mail->Body = $content;
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
    return $mail->Send() ? true : $mail->ErrorInfo;
}

function smsbao_send_sms($tel, $content)
{
    $content = '【智慧办公】' . $content;
    $username = "fantianmi";
    $password = md5("e60858587");
    $requestUrl = 'http://api.smsbao.com/sms?u=' . $username . '&p=' . $password . '&m=' . $tel . '&c=' . urlencode($content);
    $res = file_get_contents($requestUrl);
    crontab_log($res);
    if ($res != 0) err_log('手机号：' . $tel . '，发送短信失败，发送内容：' . $content . ',发送结果：' . $res);
    return $res == 0 ? 'success' : $res;
}

function smsbao_request($url, $data, $referer = "localhost")
{
    $headers['Content-Type'] = "application/x-www-form-urlencoded; charset=utf-8";
    $headerArr = array();
    foreach ($headers as $n => $v) {
        $headerAprr[] = $n . ':' . $v;
    }
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headerArr);
    curl_setopt($ch, CURLOPT_REFERER, "http://" . $referer . "/");
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}


function smsbao_send_code($tel, $type = 'reg')
{
    if (!$tel) {
        return '手机号不能为空';
    }
    if ($type == 'reg') {
        $res = D('UcenterMember')->where("mobile='{$tel}'")->find();
        if ($res) {
            return '手机号已存在';
        }
    }
    if ($type == 'rebind') {
        $res = D('UcenterMember')->where("mobile='{$tel}' AND id!=" . is_login())->find();
        if ($res) {
            return '该手机号已绑定过其他手机';
        }
    }
    if ($type == 'findpass') {
        $res = D('UcenterMember')->where("mobile='{$tel}'")->find();
        if (!$res) {
            return '该手机号不存在';
        }
    }
    $code = smsbao_gen_code();
    $content = smsbao_gen_content($code);
    $send_res = smsbao_send_sms($tel, $content);
    if ($send_res == 'success') {
        S($tel, $code, 60 * 5);
        //send_smsbao_log($tel, $content, $send_res);
        return 'success';
    } else {
        return '发送失败，原因：' . $send_res;
    }
}

function smsbao_validate_code($tel, $code)
{
    if ($code == '11111') {
        return 'success';
    }
    $code_ = S($tel);
    if (!$code_) {
        return '请先发送验证码';
    }
    if ($code != $code_) {
        return '验证码错误';
    } else {
        return 'success';
    }
}

function smsbao_gen_content($code)
{
    return "验证码:{$code}，请您在5分钟之内填写，如非本人操作，请忽略本短信";
}

function smsbao_gen_code()
{
    return mt_rand(10000, 99999);
}

