<?php

function get_address($uid)
{
    $user = query_user('wallet_address', $uid);
    if (!$user) {
        return null;
    } else {
        return $user['wallet_address'];
    }
}

function format_address($address)
{
    return substr($address, 0, 5) . "..." . substr($address, strlen($address) - 5, strlen($address));
}

function get_user_usdt_balance($uid)
{
    $WalletUtil = new \Dman\Utils\MemberWalletUtil();
    $ret = $WalletUtil->getWallet($uid);
    return $ret['coin_usdt'];
}

function get_user_basecoin_balance($uid)
{
    $WalletUtil = new \Dman\Utils\MemberWalletUtil();
    $ret = $WalletUtil->getWallet($uid);
    return $ret['coin_base'];
}

function eth_address_validate($address)
{
    if (!(preg_match('/^(0x)?[0-9a-fA-F]{40}$/', $address))) {
        return false; //满足if代表地址不合法
    }
    return true;

}


function airdrop_status($status)
{
    if ($status == 0) {
        return 'waiting';
    } else if ($status == 1) {
        return "processing";
    } else if ($status == 2) {
        return "finish";
    }
    return "unknown";
}

function wallet_get_username($uid)
{
    $data = S("username_{$uid}");
    if (!$data) {
        $data = D("UcenterMember")->where(['id' => $uid])->getField('username');
        S("username_{$uid}", $data);
    }
    return $data;
}

