# creating an array to hold objects and keep track of them
# then you create 10 threads sending a block of code to execute on each
# then adding the generate thread to the array
threads = []
#10.times do
#	thread=Thread.new do
#		10.times{|i| print i; $stdout.flush; sleep rand(2)}
#	end

#	threads << thread
#end

#threads.each {|thread| thread.join}
10.times {Thread.new {10.times {|i| print i; $stdout.flush; sleep rand(2)}}}
Thread.list.each{|thread| thread.join unless thread==Thread.main}

