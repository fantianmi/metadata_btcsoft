<?php

namespace Dman\Util;

class AirdropApiUtil
{
    public $urlHost = "http://nftinfo.nftunit.site";

    function paySend($address = [], $amount = [])
    {
        $url = $this->urlHost . "/pay/send";
        $data = [
            'addrs' => $address,
            'amounts' => $amount
        ];
        myLog("airdrop api pay send: url:" . $url);
        myLog("airdrop api pay send: data:" . json_encode($data));
        $result = http_post_json($url, json_encode($data));

        myLog("airdrop api pay send result:" . json_encode($result));
        return json_encode($result);
    }

    function payQuery()
    {

    }
}