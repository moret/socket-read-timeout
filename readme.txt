SO_SNDTIMEO and SO_RCVTIMEO socket options currently do not behave as expected:
http://moret.pro.br/2014/09/03/socket-read-timeout/

server.rb is the slow server - 5s response - used on the tests.
client-io-select.rb is an example with IO.select of the expected behaviour.
client-socket-options.rb is the client used to test different Ruby versions.
client.c is the client used to test different OS's.

Ruby 1.8 timed out the socket as expected. 1.9 and 2.1 didn't.

OS X 10.9.4 timed out the socket as expected. Ubuntu 14.04 and CentOS 5.8 didn't.

===============================
Copyright (c) 2014 moret.pro.br
See license for details.
