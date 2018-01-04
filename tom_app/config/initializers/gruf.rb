require 'gruf'
require 'app/proto/helloworld_services_pb'

Gruf.configure do |c|
  c.default_client_host = '127.0.0.1:9003'
end