# this code includes a class that allows for dynamically adding
# attributes to other classes within you code

class Class
	def add_accessor(accessor_name)
		self.class_eval %Q{
			attr_accessor :#{accessor_name}
		}
	end
end

class Person
end

person=Person.new
Person.add_accessor :name
Person.add_accessor :gender
person.name="Peter Cooper"
person.gender="male"
puts "#{person.name} is #{person.gender}"

# or something like:
# class SomethingElse
#	add_accessor :whatever
# end
