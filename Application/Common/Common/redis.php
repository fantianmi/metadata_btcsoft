<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/5/13
 * Time: 11:26
 */

/**
 * redis 方法
 * @param $key
 * @param string $value
 * @param int $exp_time
 * @return bool|int|string
 */
function redis($key, $value = '')
{
    $redis = new \Redis();
    $redis->connect(C('REDIS_HOST'), C("REDIS_PORT"));
    if ('' === $value) { // 获取缓存
        $value = $redis->get($key);
        return json_decode($value, true);
    } elseif (is_null($value)) { // 删除缓存
        return $redis->del($key);
    } else { // 缓存数据
        $value = json_encode($value);
        return $redis->set($key, $value);
    }
}