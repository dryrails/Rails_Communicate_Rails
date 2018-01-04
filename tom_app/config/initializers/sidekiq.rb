
def sidekiq_redis_config
  server = '127.0.0.1'
  port   = '6379'
  db     = 0

  namespace = 'tom_app'

  config = {}
  config[:url]       = "redis://#{server}:#{port}/#{db}"
  config[:namespace] = namespace
  config
end

Sidekiq.configure_server do |config|
  config.redis = sidekiq_redis_config
  config.average_scheduled_poll_interval = 1
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_redis_config
end
