require 'gruf'

module Client
  class ProductClient
    def get_product(id)
      begin
        client = ::Gruf::Client.new(service: ::Demo::ThingService)
        response = client.call(::GetMy, id: id)
        puts response.message.inspect
      rescue Gruf::Client::Error => e
        puts e.error.inspect
      end
    end
  end
end