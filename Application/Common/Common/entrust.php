<?php

use App\Util\YahooFinanceUtil;

function get_EVMCHAIN()
{
    $GlobalData = new \App\Config\GlobalData();
    return $GlobalData->EVMCHAIN;
}

/**
 *
 * 获取token 价格
 * @param $contract
 * @param string $network
 * @param int $change
 * @return mixed|void
 * @throws Exception
 */
function tokenPrice($contract, $network = '', &$change = 0)
{
    $UniswapUtil = new \App\Util\UniswapUtil();
    if ($network == '') $network = $UniswapUtil::NETWORK_ETH;

    if (in_array($network, get_EVMCHAIN())) {
        $data = $UniswapUtil->getTokenPrice(strtolower($contract), $network);
        $change = sprintf("%.4f", $data['change']);
        return $data['price'];
    } else if ($network == 'heco') {
        $HecoUtil = new \App\Util\HecoUtil();
        $pairToken = getTokenPair($contract, $network);
        $data = $HecoUtil->marketTicker($pairToken);
        $change = $data != null ? $data['price_quote'] : 0;
        $change = sprintf("%.4f", $change);
        return $data != null ? $data['token_price'] : 0;
    }
    return null;
}

/**
 * 获取交易对地址
 * @param $contract
 * @param string $network
 * @return array|mixed|null
 */
function getTokenPair($contract, $network = "heco")
{
    if ($network != 'heco') {
        return null;
    }

    $tokenPair = S("tokenpair_{$contract}_{$network}");
    if ($tokenPair == null) {
        $tokenPair = D("Coin")->where(['address' => $contract, 'network' => $network])->getField("pair_token");
        S("tokenpair_{$contract}_{$network}", $tokenPair);
    }
    return $tokenPair;
}


