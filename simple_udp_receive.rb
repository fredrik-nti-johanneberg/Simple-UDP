require 'socket'

if ARGV.length < 2
    puts "Usage: simple_udp_receive [ip] [port]"
    exit
else
    ip_addr = ARGV[0]
    port = ARGV[1]
end

socket = UDPSocket.new
socket.bind( ip_addr, port )

Thread.new {        # receive data in dedicated thread
    while true
        begin
            message, sender = socket.recvfrom_nonblock(1024)
            puts "Message received from #{sender[3]}: #{message}"
        rescue IO::WaitReadable
            IO.select([socket])
            retry
        end
    end
}

while true
    # main thread will just idle here
end
