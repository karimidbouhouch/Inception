#! /bin/bash

# echo "maxmemory 256mb" >> /etc/redis/redis.conf
# echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/redis/redis.conf

redis-server --protected-mode no