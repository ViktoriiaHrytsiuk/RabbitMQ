require 'bunny'

connection = Bunny.new(automatically_recover: false)
connection.start

chanel = connection.create_channel
queue = chanel.queue('task_queue', durable: true)

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

queue.publish(message, persistent: true)
puts " [x] Sent #{message}"

connection.close
