class GreeterClient

  def self.say_hello(name)
    puts "say_hello: #{name}"

    options = {
      # hostname: '127.0.0.1:9003',
      username: 'admin',
      password: 'admin'
    }

    begin
      client = ::Gruf::Client.new(service: ::Greeter::Hello, options: options)

      response = client.call(:SayHello, name: name)
      puts "+"*30
      puts response.message.message # Greeter::HelloReply instance
    rescue Gruf::Client::Error => e
      puts e.error.inspect
    end
  end
end