require 'gruf'
require 'app/proto/helloworld_services_pb'

Gruf.configure do |c|
  c.server_binding_url = '127.0.0.1:9003'
  c.interceptors.use(Gruf::Interceptors::Instrumentation::RequestLogging::Interceptor, formatter: :logstash)
  # basic auth
  c.interceptors.use(
    Gruf::Interceptors::Authentication::Basic,
    credentials: [{
      username: 'admin',
      password: 'admin',
    },{
      username: 'another-username',
      password: 'another-password',
    },{
      password: 'a-password-only'
    }]
  )
end