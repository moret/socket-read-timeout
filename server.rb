require 'socket'

delay = 5

server = TCPServer.new 2000

loop do
  client = server.accept
  puts "#{Time.now} > Client arrived. Sleeping for #{delay}s."
  sleep delay
  puts "#{Time.now} > Done, replying."
  client.puts "Done. Bye!"
  client.close
end
