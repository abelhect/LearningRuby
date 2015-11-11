#!/usr/bin/env ruby
# Object oriented fashion of storing and manipulating data
# using PStore

class Person
	attr_accessor :name, :age
end

fred=Person.new
fred.name="Fred Bloggs"
fred.age=45

laura=Person.new
laura.name="Laura Smith"
laura.age=23

require 'pstore'
store=PStore.new("storagefile")	#create a new PStore in a file called storagefile
store.transaction do	#start a transation to read and update while avoiding corruption
	store[:people] ||=Array.new	#people element gets assigned to an array
	store[:people] << fred	#push fred and laura to the people element of the store
	store[:people] << laura
end	#created an arrain within store called people and pushed two Person objects to it

# to retrieve the data from the PStore database
require 'pstore'
store=PStore.new("storagefile")
people=[]
store.transaction do
	people = store[:people]
end

#At this point the person objects inside people can be treated as totally local objects
people.each do |person|
	puts person.name
end
