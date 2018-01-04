class ProductService

  class << self
    def get_products
      timestamp = Time.now.to_i
      str = APP_ID + timestamp.to_s
      token = OpenSSL::HMAC.hexdigest("SHA1", APP_KEY, str)

      params = "token=#{token}&timestamp=#{timestamp}"
      url = "127.0.0.1:9001/products?#{params}" # jerry_app listens 9001

      resp = Typhoeus.get(url, timeout: 3)
      body = resp.body
      puts "Products result: #{body}"
    end

    def update_product_worker
      UpdateProductWorker.perform_async(1)
    end

  end

end