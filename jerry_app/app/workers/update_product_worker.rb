class UpdateProductWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  def perform(product_id)
    # do something for example:
    # product = Product.find(product_id)
    # product.update!(amount: 0)
    Sidekiq.logger.info("product_id: #{product_id}")
    Sidekiq.logger.info "UpdateProductWorker Success"
  end
end