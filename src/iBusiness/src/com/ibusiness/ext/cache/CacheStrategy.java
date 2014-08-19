package com.ibusiness.ext.cache;

public interface CacheStrategy {
    Cache getCache(String name);
}
