APP_ID = 'eeed7a6ed9600734ef3e2361127725ac'
APP_KEY = 'a1a51ff72c3683dbfba0cef96890b338'


jerry_redis_config = {
  host: '127.0.0.1',
  port: 6379,
  db: 0
}

jerry_redis = Redis.new(jerry_redis_config)

jerry_sidekiq_redis = Redis::Namespace.new(:jerry_app, redis: jerry_redis)

JERRY_REDIS_POOL = ConnectionPool.new(timeout: 1) {jerry_sidekiq_redis}