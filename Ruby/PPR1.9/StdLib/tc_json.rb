#####################################################################
# File name: tc_json.rb
# Create date: 2013-9-22 10:03 AM
# Description: Cross write unit test to study json library
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"
require "json"

# JSON is a language-independent data interchange format based on 
# key/value pairs (hashes in Ruby) and sequences of values (arrays in
# Ruby). JSON is frequently used to exchange data between JavaScript
# running in browsers and server-based applications. JSON is not a 
# general-purpose object marshaling format. Although you can add 
# to_json methods to your own classes, you will lose interoperability.
class TC_Json < Test::Unit::TestCase

	# << From page Ruby document - ruby - Examples >>
	# ---------------------------------------------------------------
	# To create a JSON text from a ruby data structure, you can call
	# JSON.generate like that.
	def test_CreateAJson
		json = JSON.generate [1, 2, {"a"=>3.141}, false, true, nil, 4..10]
		assert "[1,2,{\"a\":3.141},false,true,null,\"4..10\"]", json
	end

	# << From page Ruby document - ruby - Examples >>
	# ---------------------------------------------------------------
	# To get back a ruby data structure from a JSON text, you have to
	# call JSON.parse on it:
	def test_ParseJson
		
		# Notice:
		# -----------------------------------------------------------
		# If parse "[1,2,{\"a\":3.141},false,true,null,\"4..10\"]" , 
		# you will get [1, 2, {"a"=>3.141}, false, true, nil, "4..10"]
		# So, you must process your input. 2013-9-22
		
		json = "[1,2,{\"a\":3.141},false,true,null]"
		result = JSON.parse json
		assert_equal([1, 2, {"a"=>3.141}, false, true, nil], result)
	end

end
