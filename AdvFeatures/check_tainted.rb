# This code checks if the line of code contains a backtick, semicolon
# asterisk or hyphen and deems the code unsafe if it does. Just an 
# illustration. Dont use in real apps. If it doesnt have the above
# then it executes what ever you pass to it until you stop it with
# control c

def code_is_safe?(code)
	code =~ /[`;*-]/? false:true
end

while x=gets
	x.untaint if code_is_safe?(x)
	next if x.tainted?
	puts "=> #{eval(x)}"
end

