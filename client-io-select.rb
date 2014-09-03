require 'socket'

host = '127.0.0.1'
port = 2000
timeout = 2

s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
s.connect(Socket.pack_sockaddr_in(port, host))

rs, = IO.select([s], [], [], timeout)
if rs
  puts rs[0].read(1000)
else
  puts 'Timeout'
end

s.close
