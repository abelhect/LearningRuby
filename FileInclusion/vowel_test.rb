#require './string_extensions'	# "./" will look at local files, if not it will look in a predefined $LOAD_PATH directories
load 'string_extensions.rb'
puts "This is a test".vowels.join('-')

