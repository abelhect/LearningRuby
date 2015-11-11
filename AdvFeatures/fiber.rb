sg=Fiber.new do
	s=0
	loop do
		square=s*s
		s += 1
		s=Fiber.yield(square)||s
	end
end

puts sg.resume
puts sg.resume
puts sg.resume
puts sg.resume
puts sg.resume 40	#passes a new number to start the square with
puts sg.resume
puts sg.resume
puts sg.resume 0	#passes a 0 to start the square with
puts sg.resume
puts sg.resume
