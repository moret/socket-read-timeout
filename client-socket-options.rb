require 'socket'

host = '127.0.0.1'
port = 2000
timeout = 2

timeout_val = [ timeout, 0 ].pack("l_2")

s = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
s.setsockopt(::Socket::SOL_SOCKET, ::Socket::SO_RCVTIMEO, timeout_val)
s.setsockopt(::Socket::SOL_SOCKET, ::Socket::SO_SNDTIMEO, timeout_val)
s.connect(Socket.pack_sockaddr_in(port, host))

begin
  while data = s.read(1000)
    puts data
  end
rescue => e
  puts e
end

s.close
