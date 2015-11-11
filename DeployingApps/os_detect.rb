#!/usr/bin/env ruby
# this script is good idea to include in all ruby code
# becuase it tells your program what operating system the user is using

if RUBY_PLATFORM =~ /win32/
	puts "We are in Windows!"
elsif RUBY_PLATFORM =~ /linux/
	puts "We are in Linux!"
elsif RUBY_PLATFORM =~ /darwin/
	puts "We are in Mac OS X!"
elsif RUBY_PLATFORM =~ /freebsd/
	puts "We are in FreeBSD!"
else
	puts "We are running under an unknown operating system."
end
