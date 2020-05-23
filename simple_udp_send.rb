require 'socket'

if ARGV.length < 2
    puts "Usage: simple_udp_send [ip] [port]"
    exit
else
    ip_addr = ARGV[0]
    port = ARGV[1]
end

socket = UDPSocket.new
socket.connect( ip_addr, port )

while true
    print "Enter message to send: "
    message = STDIN.gets.chomp
    socket.send( message, 0 )
end