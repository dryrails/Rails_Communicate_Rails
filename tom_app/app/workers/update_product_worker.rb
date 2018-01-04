class UpdateProductWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default, :pool => JERRY_REDIS_POOL
end