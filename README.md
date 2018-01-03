# Rails_Communicate_Rails

The practice about the communication between Rails App

### Development environment:

+ Rails 5.1.4
+ Ruby 2.5.0

### Two Rails App:

1. jerry_app

listen: 127.0.0.1:9001

2. tom_app

listen: 127.0.0.1:9001

No `databases.yml` file, if you need it, create and config it by yourself.

It needs `redis` software environment.

### Three examples of communication between Rails app.

1. API

2. Sidekiq

3. gRPC

### Other

Yeah, you can replace Sidekiq with other message queue, and you can replace gRPC with other RPC, for example Thrift.



