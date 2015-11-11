# This code is an example of how you can measure and display
# how long is your computer taking to run each of the subroutines
# in your code. It helps you identify which task is taking longer and
# can use some optimization by changing the code

require 'profile'
class Calculator
	def self.count_to_large_number
		x=0
		100000.times {x+=1}
	end

	def self.count_to_small_number
		x=0
		1000.times {x+=1}
	end
end

Calculator.count_to_large_number
Calculator.count_to_small_number
