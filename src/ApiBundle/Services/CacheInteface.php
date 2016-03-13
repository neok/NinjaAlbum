<?php
namespace ApiBundle\Services;

/**
 * Interface CacheInterface
 */
interface CacheInterface
{
    public function set($key, $value, $ttl);

    public function get($key);

}