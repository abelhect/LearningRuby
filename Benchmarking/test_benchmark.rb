# This code is an example of how you can measure the speed of your code
# and how long each of the methods you are using take the computer to 
# run


require 'benchmark'
iterations = 1000000

Benchmark.bmbm do |bm|
	bm.report("for:") do
		for i in 1..iterations do
			x=i
		end
	end
	bm.report("times:") do
		iterations.times do |i|
			x=i
		end
	end
end
