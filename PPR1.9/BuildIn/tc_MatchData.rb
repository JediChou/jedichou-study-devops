#####################################################################
# File name: tc_MatchData.rb
# Create date: 2013-10-8 17:01 PM
# Update date: 2013-10-9 08:42 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_MatchData < Test::Unit::TestCase
	
	# From the page 559
	# ------------------------------------------------------------------
	#             match[i] -> string
	#          match[name] -> string
	# match[start, length] -> array
	#         match[range] -> array
	# ------------------------------------------------------------------
	# Match Reference - MatchData acts as an array and/or hash and may be
	# accessed using the normal indexing techniques. Numberic indices
	# return the captures at the corresponding position in the regular
	# expression (starting at 1), and symbol indices return the corresponding
	# named capture.match[0] is equivalent to the special variable $&
	# and returns the entire matched string. See also MatchData#values_at.
	def test_MatchData_InstanceMethods_MatchReference
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal("HX1138", m[0])
		assert_equal(["H","X"], m[1,2])
		assert_equal(["H","X","113"], m[1..3])
		assert_equal(["X","113"], m[-3,2])

		m = /..(?<digit_prefix>\d+)\d/.match("THX1138")
		assert_equal("113", m[:digit_prefix])
	end

	# From the page 559
	# ------------------------------------------------------------------
	#    match.begin(n) -> int
	# match.begin(name) -> int
	# ------------------------------------------------------------------
	# Returns the offset in the original string of the start of the nth
	# capture or the named capture.
	def test_MatchData_InstanceMethod_begin
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal(1, m.begin(0))
		assert_equal(2, m.begin(2))

		m = /..(?<digit_prefix>\d+)\d/.match("THX1138")
		assert_equal(3, m.begin(:digit_prefix))
	end

	# From the page 559
	# ------------------------------------------------------------------
	# match.captures -> array
	# ------------------------------------------------------------------
	# Returns the array of all the matching groups. Compare to MatchData#
	# to_a, which returns both the complete matched string and all the
	# matching groups.
	def test_MatchData_InstanceMethods_captures
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal(["H","X","113","8"], m.captures)

		f1, f2, f3 = /(.)(.)(\d+)(\d)/.match("THX1138.").captures
		assert_equal("H", f1)
		assert_equal("X", f2)
		assert_equal("113", f3)
	end

	# From the page 560
	# ------------------------------------------------------------------
	# match.length -> int
	# ------------------------------------------------------------------
	# Returns the number of elements in the match array.
	def test_MatchData_InstanceMethods_length
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal(5, m.length)
		assert_equal(5, m.size)
	end

	# From the page 560
	# ------------------------------------------------------------------
	# match.names -> array
	# ------------------------------------------------------------------
	# Returns the list of named captures in the regular expression that
	# created match.
	def test_MatchData_InstanceMethods_names
		m = /(?<prefix>[A-Z]+)(?<hyphen>-?)(?<digits>\d+)/.match("THX1138.")
		assert_equal(['prefix','hyphen','digits'], m.names)
		assert_equal(['THX','','1138'], m.captures)
		assert_equal('THX', m[:prefix])
	end

	# From the page 560
	# ------------------------------------------------------------------
	#    match.offset(n) -> array
	# match.offset(name) -> array
	# ------------------------------------------------------------------
	# Returns an array containing the begining and ending offsets of the
	# nth or named capture.
	def test_MatchData_InstanceMethod_offset
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal([1,7], m.offset(0))
		assert_equal([6,7], m.offset(4))

		m = /..(?<digit_prefix>\d+)\d/.match("THX1138")
		assert_equal([3,6], m.offset(:digit_prefix))
	end

	# From the page 560
	# ------------------------------------------------------------------
	# match.post_match -> string
	# ------------------------------------------------------------------
	# Returns the portion of the original string after the current match.
	# (Same as the special variable $'.)
	def test_MatchData_InstanceMethod_post_match
		m = /(.)(.)(\d+)(\d)/.match("THX1138: The Movie")
		assert_equal(": The Movie", m.post_match)
	end

	# From the page 560
	# ------------------------------------------------------------------
	# match.pre_match -> string
	# ------------------------------------------------------------------
	# Returns the portion of the original string before the current
	# match. (Same as $`.)
	def test_MatchData_InstanceMethod_pre_match
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal("T", m.pre_match)
	end

	# From the page 561
	# ------------------------------------------------------------------
	# match.regexp -> a_regexp
	# ------------------------------------------------------------------
	# Returns the regexp object for the regular expression that created
	# match.
	def test_MatchData_InstanceMethod_regexp
		m = /(.)(.)(\d+)(\d)/.match("THX1138: The Movie")
		assert_equal(/(.)(.)(\d+)(\d)/, m.regexp)
	end

	# From the page 561
	# ------------------------------------------------------------------
	# match.size -> int
	# ------------------------------------------------------------------
	# A synonym for MatchData#length.
	def test_MatchData_InstanceMethod_size
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal(5, m.length)
		assert_equal(5, m.size)
	end

	# From the page 561
	# ------------------------------------------------------------------
	# match.string -> string
	# ------------------------------------------------------------------
	# Returns a frozen copy of the string passed in to match.
	def test_MatchData_InstanceMethod_string
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal("THX1138.", m.string)
	end

	# From the page 561
	# ------------------------------------------------------------------
	# match.to_a -> array
	# ------------------------------------------------------------------
	# Returns the array of matches. Unlike MatchData#captures, returns
	# the full string matched.
	def test_MatchData_InstanceMethod_to_a
		m = /(.)(.)(\d+)(\d)/.match("THX1138.")
		assert_equal(["HX1138","H","X","113","8"], m.to_a)
	end

	# From the page 561
	# ------------------------------------------------------------------
	# match.to_s -> string
	# ------------------------------------------------------------------
	# Returns the entire matched string.
	def test_MatchData_InstanceMethod_to_s
		m = /(.)(.)(\d+)(\d)/.match("THX1138")
		assert_equal("HX1138", m.to_s)
	end

	# From the page 561
	# ------------------------------------------------------------------
	# match.values_at(<index>*) -> array
	# ------------------------------------------------------------------
	# Returns the matches corresponding to the given indices.
	def test_MatchData_InstanceMethod_values_at
		m = /(.)(.)(\d+)(\d)/.match("THX1138")
		assert_equal(["113","H","X"], m.values_at(3,1,2))
		assert_equal(["HX1138","8"], m.values_at(0,4))
	end

end
