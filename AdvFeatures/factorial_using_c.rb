# calculating a factorial using C and RubyInline
require 'inline'

class CFactorial
	class << self
		inline :C do |builder|
			builder.c %q{
				long factorial(int value) {
					long result =1, i=1;
					for (i=1; i<= value; i++){
						result *=i;
					}
					return result;
				}
			}
		end
	end
end
