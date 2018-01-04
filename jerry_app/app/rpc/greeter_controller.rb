class GreeterController < Gruf::Controllers::Base
  bind ::Greeter::Hello::Service

  def say_hello
    name = request.message.name
    result = "+++ Hello #{name}+++"
    puts result
    # You need return Greeter::HelloReply instance or it error: undefined method `encode' for class `#<Class:String>' (NameError)
    Greeter::HelloReply.new(message: result)
  end

end