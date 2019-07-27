require "human.dll"

class Doctor < MyClass
	attr_accessor :first_name, :last_name

	def introduce
		say_hello
		puts "I'm Dr. #{last_name}"
	end

	def check_condition
		if get_internal_condition != "all good"
			puts "Call an amulance!"
		else
			puts "All is good!"
		end
	end
end

doctor = Doctor.new
doctor.first_name = "John"
doctor.last_name = "Doe"

doctor.introduce
doctor.check_condition

