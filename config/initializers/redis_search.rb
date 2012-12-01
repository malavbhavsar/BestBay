require "redis"
require "redis-namespace"
require "redis-search"
# don't forget change namespace
uri = URI.parse("redis://redistogo:86c2e66b375629280ab5732280e7656f@grouper.redistogo.com:9367/")
redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe=>true)
# We suggest you use a special db in Redis, when you need to clear all data, you can use flushdb command to clear them.
#redis.select(3)
# Give a special namespace as prefix for Redis key, when your have more than one project used redis-search, this config will make them work fine.
redis = Redis::Namespace.new( Rails.env + ":" + "bestbay:redis_search", :redis => redis)
Redis::Search.configure do |config|
  config.redis = redis
  config.complete_max_length = 100
  config.disable_rmmseg = true
end