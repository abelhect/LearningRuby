#!usr/bin/env ruby
# Using the WEBrick library that builds an HTTP server
# it creates a generic WEBrick server on the local machine on port 1234
# it shuts the server down if the process is interrupted with Ctrl+C
# open the website by typing http://127.0.0.1:1234 on your browser
# the website should show the current time if the server is initiated
require 'webrick'
server=WEBrick::GenericServer.new( :Port => 1234)
trap("INT"){server.shutdown}
server.start do |socket|
	socket.puts Time.now
end
