#####################################################################
# File name: tc_String.rb
# Create date: 2013-9-23 11:26 AM
# Update date: 2013-9-25 17:18 PM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require "test/unit"

class TC_String < Test::Unit::TestCase
	
	# From the page 666
	# ---------------------------------------------------------------
	# String.new(val="") -> str
	# ---------------------------------------------------------------
	# Returns a new string object containing a copy of val (which should
	# be a String or implement to_str). Note that the new string object
	# is created only when one of the string is modified.
	def test_String_ClassMethods_new
		str1 = "wibble"
		str2 = String.new(str1)
		assert_not_nil(str1.object_id)
		assert_not_nil(str2.object_id)
		assert_equal(true, str1 == str2)
		assert_equal("wibble", str2)
		assert_equal("i", str1[1])
	end

	# From the page 666
	# ---------------------------------------------------------------
	# String.try_convert(obj) -> a_string or nil
	# ---------------------------------------------------------------
	# If obj is not already a string, attempts to convert it to one
	# by calling its to_str method. Returns nil if no conversion could
	# be made.
	def test_String_ClassMethods_TryConvert
		assert_equal('cat', String.try_convert('cat'))
		assert_equal(nil, String.try_convert(0xbee))
	end

	# From the page 666
	# ---------------------------------------------------------------
	# str%arg -> string
	# ---------------------------------------------------------------
	# Format - Uses str as a format specification and returns the 
	# result of applying it to arg. If the format specification contains
	# more than one substitution, then arg must be an Array containing
	# the values to be substituted. See (Object#sprintf on page 626)
	# for details of the format string.
	def test_String_InstanceMethods_PercentSign
		assert_equal("00123", "%05d" % 123)
	end

	# From the page 667
	# ---------------------------------------------------------------
	# str * int -> string
	# ---------------------------------------------------------------
	# Copies - Returns a new String containing int copies of the
	# receiver.
	def test_String_InstanceMethods_Copies
		assert_equal("Ho! Ho! ", "Ho! "*2)
	end

	# From the page 667
	# ---------------------------------------------------------------
	# str + string -> string
	# ---------------------------------------------------------------
	# Concatenation - Returns a new String containing string concatenated
	# to str. If both strings contain non-7-bit characters, their
	# encodings must be compatible.
	def test_String_InstanceMethods_Concatenation
		assert_equal("Jedi, Sith", "Jedi"+", "+"Sith")
	end

	# From the page 667
	# ---------------------------------------------------------------
	# Append - Concatenates the given object to str. If the object is
	# a Fixnum, it is considered to be codepoint in the encoding of
	# str and converted to the appropriate character before being
	# appended.
	def test_String_InstanceMethods_Append
		a = "hello world"
		a.force_encoding("utf-8")
		assert_equal("hello world!", a<<33)
		assert_equal("hello world! Says the ", a<<" Says the ")
		assert_equal("hello world! Says the og", a<<"og")
	end

	# From the page 667
	# ---------------------------------------------------------------
	# str <=> other_string -> -1, 0, +1, or nil
	# ---------------------------------------------------------------
	# Comparison - Returns -1 if str is less than, 0 if str is equal
	# to, and +1 if str is greater than other_string. If the strings
	# are of different lengths and the strings are equal when compared
	# to the shortest length, then the longer string is considered
	# greater than shorter one. In older versions of Ruby, setting $=
	# allowed case-insensitive comparisons; you must now use
	# String#casecmp.
	#
	# <=> is the basis for the methods, <, <=, >, >=, and between?,
	# included from module Comparable. The method String#== does not
	# use Comparable#== .
	def test_String_InstanceMethods_Comparison
		assert_equal(1, 'abcdef' <=> 'abcde')
		assert_equal(0, 'abcdef' <=> 'abcdef')
		assert_equal(-1, 'abcdef' <=> 'abcdefg')
		assert_equal(1, 'abcdef' <=> 'ABCDEF')
	end

	# From the page 668
	# ---------------------------------------------------------------
	# str == obj -> true or false
	# ---------------------------------------------------------------
	# Equality - If obj is a String, returns true if str has the same
	# encoding, length, and content as obj; returns false otherwise.
	# If obj is not a String but responds to to_str, return obj == str;
	# otherwise, return false .
	def test_String_InstanceMethods_Equality
		assert_equal(false, 'abcdef' == 'abcde' )
		assert_equal(true , 'abcdef' == 'abcdef')
	end

	# From the page 668
	# ---------------------------------------------------------------
	# str =~ regexp -> int or nil
	# ---------------------------------------------------------------
	# Match - Equivalent to regexp =~ str. Prior versions of Ruby
	# permitted an arbitrary operand to =~; this is now deprecated.
	# Returns the position where the match starts or returns nil if
	# there is no match or regexp is not a regular expression.
	def test_String_InstanceMethods_Match
		assert_equal(7, "cat o' 9 tails" =~ /\d/)
		assert_equal(nil, "cat o' 9 tails" =~ 9 )
	end

	# From the page 668
	# ---------------------------------------------------------------
	#          str[int] -> string or nil
	#     str[int, int] -> string or nil
	#        str[range] -> string or nil
	#       str[regexp] -> string or nil
	#  str[regexp, int] -> string or nil
	# str[regexp, name] -> string or nil
	#       str[string] -> string or nil
	# ---------------------------------------------------------------
	# Element Reference - If passed a single int, returns the character
	# at that position. (Prior to Ruby 1.9, an integer character code
	# was returned.) If passed two ints, returns a substring starting
	# at the offset given by the first, and a length given by the second.
	# If given a range, a substring containing characters at offsets
	# given by the range is returned. In all three cases, if an offset
	# is negative, it is counted from the end of str. Returns nil if
	# the initial offset falls outside the string and the length is not
	# given, the length is negative, or the beginning of the range is
	# greater than the end.
	#
	# If regexp is supplied, the matching portion of str is returned.
	# If a numeric parameter follows the regular expression, that
	# component of the MatchData is returned instead. If a String given,
	# that string is returned if it occurs in str. If a name follows
	# the follows the expression, the corresponding named match is
	# returned. In all cases, nil is returned if there is no match.
	def test_String_InstanceMethods_ElementReference
		a = 'hello there'
		assert_equal('e',   a[1])
		assert_equal('ell', a[1,3])
		assert_equal('ell', a[1..3])
		assert_equal('el',  a[1...3])
		assert_equal('er',  a[-3, 2])
		assert_equal('her', a[-4..-2])
		# TODO, assert_euqal('', a[-2..-4])
		assert_equal('ell', a[/[aeiou](.)\1/])
		assert_equal('ell', a[/[aeiou](.)\1/, 0])
		assert_equal('l',   a[/[aeiou](.)\1/, 1])
		assert_equal(nil,   a[/[aeiou](.)\1/, 2])
		assert_equal('the', a[/(..)e/])
		assert_equal('th',  a[/(..)e/, 1])
		# TODO, assert_equal('e',   a[/(?<vowel>[aeiou])/, :vowel])
		assert_equal("lo", a["lo"])
		assert_equal(nil, a["bye"])
	end

	# From the page 669
	# ---------------------------------------------------------------
	#         str[int] = string
	#    str[int, int] = string
	#       str[range] = string
	#      str[regexp] = string
	# str[regexp, int] = string
	#      str[string] = string}
	# ---------------------------------------------------------------
	# Element Assignment - Replaces some or all of the content of str.
	# The portion of the string affected is determined using the same
	# criteria as String#[]. If the replacement string is not the same
	# length as the text it is replacing, the string will be adjusted
	# accordingly. If the regular expression form is used, the optional
	# second int allows you to specify which portion of the match to
	# replace (effectively using the MatchData indexing rules). The
	# forms that take a Fixnum will raise an IndexError if the value
	# is out of range; the Range form will raise a RangeError, and
	# the Regexp and string forms will silently ignore the assignment.
	def test_String_InstanceMethods_ElementAssignment
		a = 'hello'
		assert('heulo', a[2]='u')
		assert('hexyz', a[2,4]='xyz')
		assert('hxyzz',a[-4,2]='xyz')
		# TODO, will add other tests.
	end

	# From the page 669
	# ---------------------------------------------------------------
	# str.ascii_only? true or false
	# ---------------------------------------------------------------
	# Returns true if the string contains no characters with a character
	# code greater than 127 (that is, it contains only  7-bit ASCII
	# character)>
	def test_String_InstanceMethods_AsciiOnly
		assert_equal(true, 'dog'.ascii_only?)
		# TODO, need add a failed test.
		assert_equal(true, "\x00 to \x7f".ascii_only?)
	end

	# From the page 670
	# ---------------------------------------------------------------
	# str.b -> string
	# ---------------------------------------------------------------
	# Returns a copy of the contents of str with ASCII-8BIT encoding.
	# This is a convenient way to get to the byte values of any string.
	def test_String_InstanceMethods_b
		str = 'jedi'
		# TODO, new in 2.0
		# bstr = str.b
		# assert_equal(2*str.length, b.length)
	end

	# From the page 670
	# ---------------------------------------------------------------
	#             str.bytes -> enum | array
	# str.bytes {|byte|...} -> str
	# ---------------------------------------------------------------
	# Returns an enumerator (Ruby 1.9) or array (Ruby 2.0) for the
	# bytes (integers in the range 0 to 255) in str. With a block, 
	# passes each byte to the block and returns the original string.
	# See also String#codepoints and #chars.
	def test_String_InstanceMethods_bytes
		assert_equal([100,111,103], "dog".bytes.to_a)
	end

	# From the page 670
	# ---------------------------------------------------------------
	# str.bytesize -> int
	# ---------------------------------------------------------------
	# Returns the number of bytes (not characters) in str. See also
	# String#length.
	def test_String_InstanceMethod_bytesize
		# TODO, need add other test for unicode strings.
		assert_equal(3, 'dog'.length)
		assert_equal(3, 'dog'.bytesize)
	end

	# From the page 671
	# ---------------------------------------------------------------
	# str.byteslice(offset, length=1) -> string or nil
	#            str.byteslice(range) -> string or nil
	# ---------------------------------------------------------------
	# Returns the string consisting of length bytes starting at byte
	# position offset, or between the offsets given by the range. A
	# negative offset counts from the end of the string. The returned
	# string retains the encoding of str, but may not be valid in that
	# encoding.
	def test_String_InstanceMethods_byteslice
		a = 'dog'
		# TODO, need add other tests.
		# Need high version.
		# assert_equal([100], a.byteslice(0))
	end

	# From the page 671
	# ---------------------------------------------------------------
	# str.capitalize -> string
	# ---------------------------------------------------------------
	# Returns a copy of str with the first character converted to
	# uppercase and the remainder to lowercase.
	def test_String_InstanceMethods_capitalize
		assert_equal("Hello world", "hello world".capitalize)
		assert_equal("Hello world", "HELLO WORLD".capitalize)
		assert_equal("123abc", "123ABC".capitalize)
	end

	# From the page 671
	# ---------------------------------------------------------------
	# str.capitalize! -> str or nil
	# ---------------------------------------------------------------
	# Modifies str by converting the first character to uppercase and
	# the remainder to lowercase. Return nil if no changes are made.
	def test_String_InstanceMethods_capitialize!
		a = "hello world"
		assert_equal("Hello world", a.capitalize!)
		assert_equal("Hello world", a)
		assert_equal(nil, a.capitalize!)
	end

	# From the page 671
	# ---------------------------------------------------------------
	# str.casecmp(string) -> 1, 0, +1
	# ---------------------------------------------------------------
	# Case-insensitive version of String#<=>
	def test_String_InstanceMethods_casecmp
		assert_equal(1, "abcdef".casecmp("abcde"))
		assert_equal(0, "abcdef".casecmp("abcdef"))
		assert_equal(0, "aBcDeF".casecmp("abcdef"))
		assert_equal(-1, "abcdef".casecmp("abcdefg"))
		assert_equal(0, "abcdef".casecmp("ABCDEF"))
	end

	# From the page 671
	# ---------------------------------------------------------------
	# str.center(int, pad="") -> string
	# ---------------------------------------------------------------
	# If int is greater the length of str, returns a new String of
	# length int with str centered between the given padding (default
	# to spaces); otherwise, return str.
	def test_String_InstanceMethods_center
		assert_equal("hello", "hello".center(4))
		assert_equal("       hello        ", "hello".center(20))
		assert_equal("hello", "hello".center(4, "_-^-"))
		assert_equal("_-^-_-^hello_-^-_-^-", "hello".center(20, "_-^-"))
		assert_equal("-------hello--------", "hello".center(20, "-"))
	end

	# From the page 671
	# ------------------------------------------------------------------
	#               str.chars -> enum | array
	# str.chars { |char| ...} -> str
	# [New in 2.0]
	# ------------------------------------------------------------------
	# Returns an enumerator (Ruby 1.9) or array (Ruby 2.0) for the
	# characters (single character strings) in str. With a block, passes
	# character to the block and returns the original string. See also
	# String#bytes and String#codepoints.
	def test_String_InstanceMethods_chars
		assert_equal(['d','o','g'], "dog".chars.to_a)
		result = []; "dog".chars {|c| result<<c}
		assert_equal(['d','o','g'], result)
	end

	# From the page 672
	# ------------------------------------------------------------------
	# str.chr -> string
	# ------------------------------------------------------------------
	# Returns the first character of str.
	def test_String_InstanceMethods_chr
		assert_equal('d', 'dog'.chr)
		assert_equal('m', 'me'.chr)
	end

	# From the page 672
	# ------------------------------------------------------------------
	# str.clear -> str
	# ------------------------------------------------------------------
	# Removes the content (but not the associated encoding) of str.
	def test_String_InstanceMethods_clear
		str = 'dog'
		assert_equal("", str.clear)
		assert_equal(0, str.length)
		assert_equal("US-ASCII", str.encoding.to_s)
	end

	# From the page 672
	# ------------------------------------------------------------------
	# str.chomp(rs=$/) -> string
	# ------------------------------------------------------------------
	# Returns a new String with the given record separator removed from
	# the end of str (if present). If $/ has not been changed from the
	# default Ruby record separator, then chomp also removes carriage
	# return characters (that is, it wll remove\n,\r and \r\n).
	def test_String_InstanceMethods_chomp
		assert_equal('hello', 'hello'.chomp)
		# TODO, why failed?
		# assert_equal('hello', 'hello\n'.chomp)
		# assert_equal('hello', 'hello\r\n'.chomp)
		# assert_equal('hello', 'hello\r'.chomp)
		assert_equal('hello \n there', 'hello \n there'.chomp)
		assert_equal('he', 'hello'.chomp('llo'))
	end

	# From the page 672
	# ------------------------------------------------------------------
	# str.chomp!(rs=$/) -> str or nil
	# ------------------------------------------------------------------
	# Modifies str in place as described for String#chomp, returning str
	# or returning nil if no modifications were made.
	def test_String_InstanceMethods_chomp!
		a = 'hello'
		assert_equal('he', a.chomp!('llo'))
		assert_equal('he', a)
	end

	# From the page 672
	# ------------------------------------------------------------------
	# str.chop -> string
	# ------------------------------------------------------------------
	# Returns a new String with the last character removed. If the string
	# ends with \r\n, both characters are removed. Applying chop to an
	# empty string returns an empty string. String#chomp is often a safer
	# alternative, because it leaves the string unchanged if it doesn't
	# end in a record separator.
	def test_String_InstanceMethods_chop
		# TODO, why failed?
		# assert_equal('string', 'string\r\n'.chop)
		# assert_equal('string\n', 'string\n\r'.chop)
		# assert_equal('string', 'string\n'.chop)
		assert_equal('strin', 'string'.chop)
		assert_equal("", 'x'.chop.chop)
	end

	# From the page 673
	# ------------------------------------------------------------------
	# str.chop! -> str or nil
	# ------------------------------------------------------------------
	# Process str as String#chop, returning nil if str is the empty string.
	# See also String#chomp!.
	def test_String_InstanceMethods_chop!
		a = 'string'
		assert_equal('strin', a.chop!)
		assert_equal('strin', a)
		assert_equal(nil, ''.chop!)
	end

	# From the page 673
	# ------------------------------------------------------------------
	# str.codepoints -> enum | array
	# str.codepoints {|integer|...} -> str
	# ------------------------------------------------------------------
	# Returns an enumerator (Ruby 1.9) or array (Ruby 2.0) for the
	# codepoints (integers representation of the characters) in str. With
	# a block, passes each integer to the block and returns the original
	# string. See also String#bytes and String#chars.
	def test_String_InstanceMethods_codepoints
		assert_equal([100,111,103], 'dog'.codepoints.to_a)
		result = []; 'dog'.codepoints {|c| result<<c}
		assert_equal([100,111,103], result)
	end

	# From the page 673
	# ------------------------------------------------------------------
	# str.concat(int) -> str
	# str.concat(obj) -> str
	# ------------------------------------------------------------------
	# Synonym for String#<<.
	def test_String_InstanceMethods_concat
		assert_equal('the', 'th'.concat('e'))
		assert_equal('', ''.concat(""))
	end

	# From the page 673
	# ------------------------------------------------------------------
	# str.crypt(settings) -> string
	# ------------------------------------------------------------------
	# Applies a one-way cryptographic hash to str by invoking the standard
	# library function crypt. The argument is to some extent system
	# dependent. On traditional Unix boxes, it is often a two-character
	# salt string. On more modern boxes, it may also control things such
	# as DES encryption parameters. See the man page for crypt(3) for
	# details.
	def test_String_InstanceMethods_crypt
		assert_equal('shRK3aVg8FsI2', 'secret'.crypt("sh"))
		assert_equal('_...0abcdROn65JNDj12', 'secret'.crypt("_...0abcd"))
	end

	# From the page 674
	# ------------------------------------------------------------------
	# str.delete(<string>+) -> new_string
	# ------------------------------------------------------------------
	# Returns a copy of str with all characters in the intersection of
	# its arguments deleted. Uses the same rules for building the set of
	# characters as String#count.
	def test_String_InstanceMethods_delete
		assert_equal('heo', 'hello'.delete('l','lo'))
		assert_equal('he', 'hello'.delete('lo'))
		assert_equal('hell', 'hello'.delete('aeiou', '^e'))	# Special for me
		assert_equal('ho', 'hello'.delete('ej-m'))			# Don't understand
	end

	# From the page 674
	# ------------------------------------------------------------------
	# str.downcase -> str or nil
	# ------------------------------------------------------------------
	# Replace a copy of str with all uppercase letters replaced with
	# their lowercase counterparts. The operation is locale insensitive-
	# only characters A to Z are affected. Multibyte characters are
	# skipped.
	def test_String_InstanceMethods_downcase
		assert_equal('hello', 'hELLo'.downcase)
	end

	# From the page 674
	# ------------------------------------------------------------------
	# str.downcase! -> string
	# ------------------------------------------------------------------
	# Repalces uppercase letters in str with their lowercase counterparts.
	# Returns nil if no changes were made.
	def test_String_InstanceMethods_downcase!
		a = 'hELLo'
		assert_equal('hello', a.downcase!)
		assert_equal('hello', a)
	end

	# TODO
	# each_byte
	# each_char
	# each_codepoint
	# each_line
	
	# From the page 675
	# ------------------------------------------------------------------
	# str.empty? -> true or false
	# ------------------------------------------------------------------
	# Returns true if str has a length of zero.
	def test_String_InstanceMethods_empty?
		assert_equal(false, 'h'.empty?)
		assert_equal(true,  ''.empty?)
	end

	# TODO
	# encode
	# encode!
	# encoding
	
	# From the page 676
	# ------------------------------------------------------------------
	# str.end_with?(<suffix>+) -> true of false
	# ------------------------------------------------------------------
	# Returns true if str ends with any of the given suffixes.
	def test_String_InstanceMethods_endwith?
		assert_equal(true, 'Apache'.end_with?('ache'))
		assert_equal(true, 'ruby code'.end_with?('python', 'perl', 'code'))
		assert_equal(false, 'ruby'.end_with?('FcHyx'))
	end

	# From the page 677
	# ------------------------------------------------------------------
	# str.eql?(obj) -> true of false
	# ------------------------------------------------------------------
	# Return true if obj is a String with identical contents to str.
	def test_String_InstanceMethods_eql?
		assert_equal(true , 'cat'.eql?('cat'))
		assert_equal(false, 'bee'.eql?('cat'))
	end

	# TODO
	# force_encoding
	# getbyte
	
	# From the page 678
	# ------------------------------------------------------------------
	# str.gsub(pattern, replacement) -> string
	# str.gsub(pattern) {|match|...} -> string
	#              str.gsub(pattern) -> enum
	# ------------------------------------------------------------------
	# Returns a copy of str with all occurrences of pattern replaced with
	# either replacement or the value of the block. The pattern will
	# typically be a Regexp; if it is String, then no regular expression
	# metacharacters will be interpreted (that is, /\d/ will match a digit,
	# but '\d' will match a backslash followd by a d)
	#
	# If a string is used as the replacement, special variables from the
	# match (such as $& and $1) cannot be substituted into it, because
	# substitution into the string occurs before the pattern match starts.
	# However, the sequence \1, \2, and so on, may be used to interpolcate
	# successive numbered groups in the match, and \k<name> will substitute
	# the corresponding named captures. These sequences are shown in the
	# following table.
	# <Table 23 - Backslash sequences in substitution>
	def test_String_InstanceMethods_gsub
		assert_equal('h*ll*',      "hello".gsub(/[aeiou]/,'*'))
		assert_equal('h<e>ll<o>',  "hello".gsub(/([aeiou])/,'<\1>'))
		assert_equal('h e l l o ', "hello".gsub(/./) {|c| c[0].to_s<<' '})
		assert_equal('he-l--l-o',  "hello".gsub(/(?<double>l)/,'-\k<double>-'))
	end
	
	# From the page 678
	# ------------------------------------------------------------------
	# str.gsub!(pattern, replacement) -> string
	# str.gsub!(pattern) {|match|...} -> string
	#              str.gsub!(pattern) -> enum
	# ------------------------------------------------------------------
	# Performs the substitutions of String#gusb in place, returning str,
	# or returning nil if no substitutions were performed. If no block
	# or replacement string is given, an enumerator is returned.
	def test_String_InstanceMethods_gsub!
		a = "hello"
		assert_equal('h*ll*',      a.gsub!(/[aeiou]/,'*'))
		assert_equal('h*ll*',      a)
		
		b = "hello"
		assert_equal('h<e>ll<o>',  b.gsub!(/([aeiou])/,'<\1>'))
		assert_equal('h<e>ll<o>',  b)
		
		c = "hello"
		assert_equal('h e l l o ', c.gsub!(/./) {|c| c[0].to_s<<' '})
		assert_equal('h e l l o ', c)
		
		d = "hello"
		assert_equal('he-l--l-o',  d.gsub!(/(?<double>l)/,'-\k<double>-'))
		assert_equal('he-l--l-o',  d)
	end

	# From the page 678
	# ------------------------------------------------------------------
	# str.hex -> inx
	# ------------------------------------------------------------------
	# Treats leading character from str as a string of hexadecimal digits
	# (with an optional sign and an optional 0x) and returns the corresponding
	# number. Zero is return on error.
	def test_String_InstanceMethods_hex
		assert_equal(10, '0x0a'.hex)
		assert_equal(-4660, '-1234'.hex)
		assert_equal(0, "0".hex)
		assert_equal(0, "wombat".hex)
	end
	
	# From the page 679
	# ------------------------------------------------------------------
	# str.include?(string) -> true or false
	# ------------------------------------------------------------------
	# Returns true if str contains the given string.
	def test_String_InstanceMethods_include?
		assert_equal(true,  'hello'.include?('lo'))
		assert_equal(false, 'hello'.include?('ol'))
		assert_equal(true,  'hello'.include?('h'))
	end

	# From the page 679
	# ------------------------------------------------------------------
	# str.index(string <,offset>) -> int or nil
	# str.index(regexp <,offset>) -> int or nil
	# ------------------------------------------------------------------
	# Returns the index of the first occurrence of the given substring
	# or pattern in str. Return nil if not found. If the second parameter
	# is present, it specifies the position in the string to begin the
	# search.
	def test_String_InstanceMethods_index
		assert_equal(1, 'hello'.index('e'))
		assert_equal(3, 'hello'.index('lo'))
		assert_equal(nil, 'hello'.index('a'))
		assert_equal(4, 'hello'.index(/[aeiou]/, -3))
	end

	# From the page 627
	# ------------------------------------------------------------------
	# str.insert(index, string) -> str
	# ------------------------------------------------------------------
	# Inserts string before the character at the given index, modifying
	# str. Negative indices count from the end of the string and insert
	# after the given character. After the insertion, str will contain
	# string starting at index.
	def test_String_InstanceMethods_insert
		assert_equal('Xabcd', 'abcd'.insert(0,'X'))
		assert_equal('abcXd', 'abcd'.insert(3,'X'))
		assert_equal('abcdX', 'abcd'.insert(4,'X'))
		assert_equal('abXcd', 'abcd'.insert(-3,'X'))
		assert_equal('abcdX', 'abcd'.insert(-1,'X'))
	end

	# From the page 679
	# ------------------------------------------------------------------
	# str.intern -> symbol
	# ------------------------------------------------------------------
	# Returns the Symbol corresponding to str, creating the symbol if it
	# did not previously exist. Can intern any string, not just identifiers.
	# See Symbol#id2name on page 700.
	def test_String_InstanceMethods_intern
		# assert_equal(":Koala", "Koala".intern)
		sym = "$1.50 for a soda!?!?".intern
		assert_equal("$1.50 for a soda!?!?", sym.to_s)
	end

	# From the page 679
	# ------------------------------------------------------------------
	# str.length -> int
	# ------------------------------------------------------------------
	# Returns the number of characters in str. See also String#bytesize.
	def test_String_InstanceMethods_length
		assert_equal(3, 'bee'.length)
		assert_equal(3, 'FYX'.length)
	end

	# From the page 679
	# ------------------------------------------------------------------
	# str.lines(sep=$/) -> enum | array
	# str.lines(sep=$/) {|substr|...} -> str
	# ------------------------------------------------------------------
	# Splits str using the supplied parameter as the record separator
	# ($/ by default) and passing each substring in turn to the supplied
	# block. If a zero-length record separator is supplied, the string
	# is split into paragraphs, each terminated by multiple \n characters.
	# With no block, returns a enumerator (Ruby 1.9) or an array (Ruby 2.0).
	def test_String_InstanceMethods_lines
		assert_equal(["Example one\n", "hello\n", "world"], "Example one\nhello\nworld".lines.to_a)
		assert_equal(["hel", "l", "o\nworl", "d"], "hello\nworld".lines('l').to_a)
	end

	# From the page 680
	# ------------------------------------------------------------------
	# str.ljust(width, padding="") -> string
	# ------------------------------------------------------------------
	# If width is greater than the length of str, returns a new String of
	# length width with str left justified and padded with copies of
	# padding; otherwise, returns a copy of str.
	def test_String_InstanceMethods_ljust
		assert_equal('hello', 'hello'.ljust(4))
		assert_equal('hello     ', 'hello'.ljust(10))
		assert_equal('hello*****', 'hello'.ljust(10,'*'))
		assert_equal('hello j j ', 'hello'.ljust(10,' j'))
	end

	# From the page 680
	# ------------------------------------------------------------------
	# str.lstrip -> string
	# ------------------------------------------------------------------
	# Returns a copy of str with leading whitespace characters removed.
	# Also see String#rstrip and String#strip.
	def test_String_InstanceMethods_lstrip
		assert_equal('hello  ', '  hello  '.lstrip)
		assert_equal('\000 hello  ', ' \000 hello  '.lstrip)
		assert_equal('hello', 'hello'.lstrip)
	end

	# From the page 680
	# ------------------------------------------------------------------
	# str.lstrip! -> str or nil
	# ------------------------------------------------------------------
	# Removes leading whitespace characters from str, returning nil if no
	# change was made. See also String#rstrip! and String#strip!.
	def test_String_InstanceMethods_lstrip!
		assert_equal('hello', '  hello  '.strip!)
		assert_equal(nil, 'hello'.strip!)
	end

	# From the page 861
	# ------------------------------------------------------------------
	# str.match(pattern) -> match_data or nil
	# str.match(pattern) {|matchdata|...} -> obj
	# ------------------------------------------------------------------
	# Converts pattern to a Regexp (if it isn't already one) and then
	# invokes its match method on str. If a block is given, the block is
	# passed the MatchData object, and the match method returns the value
	# of the block.
	def test_String_InstanceMethods_match
		assert_equal('ee', 'seed'.match('(.)\1')[0])
		assert_equal('ee', 'seed'.match(/(.)\1/)[0])
		assert_equal(nil, 'seed'.match('ll'))
		assert_equal(nil, 'seed'.match('ll') {|md| md[0].upcase })
		assert_equal(nil, 'seed'.match('xx'))
	end

	# From the page 681
	# ------------------------------------------------------------------
	# str.next -> string
	# ------------------------------------------------------------------
	# Synonym for String#succ.
	def test_String_InstanceMethods_next
		assert_equal('abce', 'abcd'.next)
		assert_equal('THX1139', 'THX1138'.next)
		assert_equal('<<koalb>>', '<<koala>>'.next)
		assert_equal('2000aaa', '1999zzz'.next)
		assert_equal('AAAA0000', 'ZZZ9999'.next)
		assert_equal('**+', '***'.next)
		assert_equal("2.0", "1.9".next)
		assert_equal("2//0", "1//9".next)
		assert_equal("2/0/0/0", "1/9/9/9".next)
		assert_equal("1y0", "1x9".next)
	end

	# From the page 681
	# ------------------------------------------------------------------
	# str.oct -> int
	# ------------------------------------------------------------------
	# Treats leading characters of str as a string of octal (with an
	# optional sign) and returns the corresponding number. Returns 0 if
	# the conversion fails.
	def test_String_InstanceMethods_oct
		assert_equal(83, "123".oct)
		assert_equal(-255, "-377".oct)
		assert_equal(0, "bad".oct)
		assert_equal(255, "0377bad".oct)
	end

	# From the page 681
	# ------------------------------------------------------------------
	# str.ord -> int
	# ------------------------------------------------------------------
	# Returns the integer code point of the first character of str.
	def test_String_InstanceMethods_ord
		assert_equal(100, 'd'.ord)
		assert_equal(100, 'dog'.ord)
	end

	# From the page 681
	# ------------------------------------------------------------------
	# str.partition(pattern) -> [before, match, after]
	# ------------------------------------------------------------------
	# Searches str for pattern (which may be a string or a regular
	# expression). Returns a three-element array containing the part of
	# the string before the pattern, the part that matched the pattern,
	# and the part after the match. If the pattern does not match, the
	# entire string will be returned as the first element of the array,
	# and the other two entries will be empty strings.
	def test_String_InstanceMethods_partition
		assert_equal(['THX','11','38'], 'THX1138'.partition('11'))
		assert_equal(['THX','11','38'], 'THX1138'.partition(/\d\d/))
		assert_equal(['THX1138','',''], 'THX1138'.partition('99'))
	end

	# From the page 682
	# ------------------------------------------------------------------
	# str.prepend(other) -> str
	# ------------------------------------------------------------------
	# Inserts other at the beginning of str.
	def test_String_InstanceMethods_prepend
		str = '1138'
		# TODO
		# assert_equal('THX1138', str.prepend('THX'))
		# assert_equal('THX1138', str)
	end

	# From the page 682
	# ------------------------------------------------------------------
	# str.replace(string) -> str
	# ------------------------------------------------------------------
	# Replaces the contents, encoding, and taintedness of str with the
	# corresponding values in string.
	def test_String_InstanceMethods_replace
		s = 'hello'; s.replace 'world'
		assert_equal('world', s)
	end

	# From the page 682
	# ------------------------------------------------------------------
	# str.reverse -> string
	# ------------------------------------------------------------------
	# Returns a new string with the characters from str in reverse order.
	def test_String_InstanceMethod_reverse
		assert_equal('desserts', 'stressed'.reverse)
	end

	# From the page 682
	# ------------------------------------------------------------------
	# str.reversed! -> str
	# ------------------------------------------------------------------
	# Reverse str in place.
	def test_String_InstanceMethod_reversed!
		str = 'stressed'
		assert_equal('desserts', str.reverse!)
		assert_equal('desserts', str)
	end

	# From the page 682
	# ------------------------------------------------------------------
	# str.rindex(string <,int>) -> int or nil
	# str.rindex(regexp <,int>) -> int or nil
	# ------------------------------------------------------------------
	# Returns the index of the last occurrence of the given substring,
	# character, or pattern in str. Returns nil if not found. If the
	# second parameter is present, it specifies the position in the string
	# to end the search - characters beyond this point will not be
	# considered.
	def test_String_InstanceMethods_rindex
		assert_equal(1, 'hello'.rindex('e'))
		assert_equal(3, 'hello'.rindex('l'))
		assert_equal(nil, 'hello'.rindex('a'))
		assert_equal(1, 'hello'.rindex(/[aeiou]/, -2))
	end

	# From the page 683
	# ------------------------------------------------------------------
	# str.rjust(width, padding="") -> string
	# ------------------------------------------------------------------
	# If width is greater than the length of str, returns a new String
	# of length with str right justified and padded with copies of padding;
	# otherwise, returns a copy of str.
	def test_String_InstanceMethods_rjust
		assert_equal('hello', 'hello'.rjust(4))
		assert_equal('     hello', 'hello'.rjust(10))
		assert_equal('*****hello', 'hello'.rjust(10, '*'))
		assert_equal('paddingpaddingphello', 'hello'.rjust(20, 'padding'))
	end

	# From the page 683
	# ------------------------------------------------------------------
	# str.rpartition(pattern) -> [before, match, after]
	# ------------------------------------------------------------------
	# Searches str for pattern (which may be a string or regular expression),
	# starting at the end of the string. Returns a three-element array
	# containing the part of the string before the pattern, the part that
	# matched the pattern, and the part after the match. If the pattern
	# does not match, the entire string will be returned as the last
	# element of the array, and the other two entries will be empty strings.
	def test_String_InstanceMethods_rpartition
		assert_equal(['THX1','1','38'], 'THX1138'.rpartition('1'))
		assert_equal(['THX1','13','8'], 'THX1138'.rpartition(/1\d/))
		assert_equal(['','','THX1138'], 'THX1138'.rpartition('99'))
	end

	# From the page 683
	# ------------------------------------------------------------------
	# str.rstrip -> string
	# ------------------------------------------------------------------
	# Returns a copy of str, stripping first trailing null characters and
	# then stripping trailing whitespace characters. See also String#lstrip
	# and String#strip.
	def test_String_InstanceMethods_rstrip
		assert_equal('  hello', '  hello  '.rstrip)
		assert_equal('hello', 'hello'.rstrip)
		# assert_equal('  hello', '  hello  \000'.rstrip)
	end

	# From the page 683
	# ------------------------------------------------------------------
	# str.rstrip! -> str or nil
	# ------------------------------------------------------------------
	# Removes trailing null characters and then removes trailing white-
	# space characters from str. Returns nil if no change was made. See
	# also String#lstrip! and #strip!.
	def test_String_InstanceMethods_rstrip!
		str = "  hello  "
		assert_equal("  hello", str.rstrip!)
		assert_equal("  hello", str)
		assert_equal(nil, "hello".rstrip!)
	end

	# From the page 683
	# ------------------------------------------------------------------
	# str.scan(pattern) -> array
	# str.scan(pattern) {|match,...| ...} -> str}
	# ------------------------------------------------------------------
	# Both forms iterate through str, matching the pattern (which may be
	# a Regexp or a String). For each match, a result is generated and
	# either added to the result array or passed to the block. If the
	# pattern contains no groups, each individual result consists of the
	# matched string, $&. If the pattern contains groups, each individual
	# result is itself an array containing one entry per group. If the
	# pattern is a String, it is interpreted literally (in other words,
	# it is not taken to be a regular expression pattern).
	def test_String_InstanceMethods_scan
		a = "cruel world"
		assert_equal(['cruel','world'], a.scan(/\w+/))
		assert_equal(['cru','el ','wor'], a.scan(/.../))
		assert_equal([['cru'],['el '],['wor']], a.scan(/(...)/))
		assert_equal([['cr','ue'],['l ','wo']], a.scan(/(..)(..)/))
	end

	# From the page 684
	# ------------------------------------------------------------------
	# str.setbyte(offset,byte) -> byte
	# ------------------------------------------------------------------
	# Sets the byte at offset (starting from the end of the string if the
	# offset is negative) to byte. Cannot be used to change the length of
	# the string. Does not change the encoding of the string.
	def test_String_InstanceMethods_setbyte
		str = "fog"
		assert_equal(100, str.setbyte(0, 100))
		assert_equal('dog', str)
		assert_equal(3, str.length)
	end

	# From the page 684
	# ------------------------------------------------------------------
	# str.size -> int
	# ------------------------------------------------------------------
	# Synonym for String#length.
	def test_String_InstanceMethods_size
		assert_equal(5, 'hello'.size)
		assert_equal(5, 'world'.size)
	end

	# From the page 684
	# ------------------------------------------------------------------
	#          str.slice(int) -> string or nil
	#     str.slice(int, int) -> string or nil
	#        str.slice(range) -> string or nil
	#       str.slice(regexp) -> string or nil
	# str.slice(match_string) -> string or nil
	# ------------------------------------------------------------------
	# Synonym for String#[].
	def test_String_InstanceMethods_slice
		a = 'hello there'
		assert_equal('e', a.slice(1))
		assert_equal('ell', a.slice(1,3))
		assert_equal('ell', a.slice(1..3))
		assert_equal('er', a.slice(-3, 2))
		assert_equal('her', a.slice(-4..-2))
		assert_equal('the', a.slice(/th[aeiou]/))
		assert_equal('lo', a.slice('lo'))
		assert_equal(nil, a.slice('bye'))
	end

	# From the page 684
	# ------------------------------------------------------------------
	#          str.slice!(int) -> string or nil
	#     str.slice!(int, int) -> string or nil
	#        str.slice!(range) -> string or nil
	#       str.slice!(regexp) -> string or nil
	# str.slice!(match_string) -> string or nil
	# ------------------------------------------------------------------
	# Deletes the specified portion from str and returns the portion
	# deleted. The forms that take a Fixnum will raise an IndexError if
	# the value is out of range; the Range form will raise a RangeError,
	# and the Regexp and String forms will silently not change the string.
	def test_String_InstanceMethods_slice!
		str = "this is a string"
		assert_equal("i",     str.slice!(2))
		assert_equal(" is ",  str.slice!(3..6))
		assert_equal("sa st", str.slice!(/s.*t/))
		assert_equal("r",     str.slice!("r"))
		assert_equal("thing", str)
	end

	# From the page 685
	# ------------------------------------------------------------------
	# str.split(pattern=$;,<limit>) -> array
	# ------------------------------------------------------------------
	# Divides str into substring based on a delimiter, returning an array
	# of these substring.
	#
	# If pattern is a String, then its contents are used as the delimiter
	# splittings str. If pattern is a single space, str is split on
	# whitespace, with leading whitespace and runs of contiguous 
	# whitespace characters ignored.
	#
	# If pattern is a regexp, str is divided where the pattern matches.
	# Whenever the pattern matches a zero-length string, str is split
	# into individual characters. If pattern includes groups, these
	# groups will be included in the returned values.
	#
	# If pattern is omitted, the value of $; is used. If $; is nil (which
	# is the default), str is split on whitespace as if " " were specified.
	#
	# If the limit parameter is omitted, trailing empty fields are
	# suppressed. If limit is positive number, at most that number of
	# fields will be returned (if limit is 1, the entire string is 
	# returned as the only entry in an array). If negative, there is
	# no limit to the number of fields returned, and trailing null 
	# fields are not suppressed.
	def test_String_InstanceMethods_split
		assert_equal(["now's", "the", "time"], " now's  the time".split)
		assert_equal(["now's", "the", "time"], " now's  the time".split(' '))
		assert_equal(["", "now's","","the", "time"], " now's  the time".split(/ /))
		assert_equal(["a","bb","ccc"], "a@1bb@2ccc".split(/@\d/))
		assert_equal(["a","1","bb","2","ccc"], "a@1bb@2ccc".split(/@(\d)/))
		assert_equal(["1","2.34","56","7"], "1, 2.34, 56, 7".split(/,\s*/))
		assert_equal(['h','e','l','l','o'], 'hello'.split(//))
		assert_equal(['h','e','llo'], 'hello'.split(//,3))
		assert_equal(['h','i','m','o','m'], 'himom'.split(/\s*/))
		assert_equal([], "".split)
		assert_equal(['m','w y','w'], 'mellow yellow'.split('ello'))
		assert_equal(['1','2','','3','4'], "1,2,,3,4,,".split(','))
		assert_equal(['1','2','','3,4,,'], "1,2,,3,4,,".split(',', 4))
		assert_equal(['1','2','','3','4','',''], "1,2,,3,4,,".split(',', -4))
	end

	# From the page 686
	# ------------------------------------------------------------------
	# str.squeeze(<string>*) -> squeezed_string
	# ------------------------------------------------------------------
	# The parameter(s) specify a set of characters using the procedure
	# described for String#count on page 673. Returns a new string where
	# runs of the same character that occur in this set are replaced by
	# a single character. If no arguments are given, all runs of identical
	# characters are replaced by single character.
	def test_String_InstanceMethods_squeeze
		assert_equal('yelow mon', 'yellow moon'.squeeze)
		assert_equal(' now is the', '  now  is  the'.squeeze)
		assert_equal('puters put balls', 'putters putt balls'.squeeze('m-z'))
	end

	# From the page 686
	# ------------------------------------------------------------------
	# str.squeeze!(<string>*) -> str or nil
	# ------------------------------------------------------------------
	# Squeezes str in place, returning str. Returns nil if no changes
	# were made.
	def test_String_InstanceMethods_squeeze!
		a = 'yellow moon'
		assert_equal('yelow mon', a.squeeze!)
		assert_equal('yelow mon', a)

		b = '  now  is  the'
		assert_equal(' now is the', b.squeeze!)
		assert_equal(' now is the', b)

		c = 'putters putt balls'
		assert_equal('puters put balls', c.squeeze!('m-z'))
		assert_equal('puters put balls', c)
	end

	# From the page 686
	# ------------------------------------------------------------------
	# str.start_with?(<prefix>+) -> true of false
	# ------------------------------------------------------------------
	# Returns true if str stars with any of the given prefixs.
	def test_String_InstanceMethods_startwith?
		assert_equal(true, "Apache".start_with?("Apa"))
		assert_equal(true, "ruby code".start_with?("python","perl","ruby"))
	end

	# From the page 686
	# ------------------------------------------------------------------
	# str.strip -> string
	# ------------------------------------------------------------------
	# Returns a new string, stripping leading whitespace and trailing
	# null and whitespace characters from str.
	def test_String_InstanceMethods_strip
		assert_equal("hello", " hello  ".strip)
		assert_equal("goodbye", "\tgoodbye\r\n".strip)
		assert_equal("goodbye", "goodbye \000".strip)
		assert_equal("goodbye", "goodbye \000 ".strip)
		assert_equal("", "".strip)
	end

	# From the page 686
	# ------------------------------------------------------------------
	# str.strip! -> str or nil
	# ------------------------------------------------------------------
	# Removes leading whitespace and trailing null and whitespace
	# characters from str. Returns nil if str was not altered.
	def test_String_InstanceMethods_strip!
		a = " hello  "
		assert_equal("hello", a.strip!)
		assert_equal("hello", a)

		b = "\tgoodbye\r\n"
		assert_equal("goodbye", b.strip!)
		assert_equal("goodbye", b)
		
		c = "goodbye \000"
		assert_equal("goodbye", c.strip!)
		assert_equal("goodbye", c)
		
		d = "goodbye \000 "
		assert_equal("goodbye", d.strip!)
		assert_equal("goodbye", d)
	end

	# From the page 686
	# ------------------------------------------------------------------
	# str.sub(pattern, replacement) -> string
	# str.sub(pattern) {|match|...} -> string
	# ------------------------------------------------------------------
	# Returns a copy of str with the first occurrence of pattern replaced
	# with either replacement or the value of the block. See the description
	# of String#gsub on page 677 for a description of the parameters.
	def test_String_InstanceMethods_sub
		assert_equal('h*llo', 'hello'.sub(/[aeiou]/, '*'))
		assert_equal('h<e>llo', 'hello'.sub(/([aeiou])/, '<\1>'))
		assert_equal('h ello', 'hello'.sub(/./) {|s| s[0].to_s<<" "})
		assert_equal('he-l-lo', 'hello'.sub(/(?<double>l)/, '-\k<double>-'))
	end

	# From the page 687
	# ------------------------------------------------------------------
	# str.sub!(pattern, replacement) -> str or nil
	# str.sub!(pattern) {|match|...} -> str or nil
	# ------------------------------------------------------------------
	# Performs the substitutions of String#sub in place, returning str.
	# Returns nil if no substitutions were performed.
	def test_String_InstanceMethods_sub!
		a = "hello" 
		assert_equal('h*llo', a.sub!(/[aeiou]/, '*'))
		assert_equal('h*llo', a)
		
		b = "hello"
		assert_equal('h<e>llo', b.sub!(/([aeiou])/, '<\1>'))
		assert_equal('h<e>llo', b)
		
		c = "hello"
		assert_equal('h ello', c.sub!(/./) {|s| s[0].to_s<<" "})
		assert_equal('h ello', c)
		
		d = "hello"
		assert_equal('he-l-lo', d.sub!(/(?<double>l)/, '-\k<double>-'))
		assert_equal('he-l-lo', d)
	end

	# From the page 687
	# ------------------------------------------------------------------
	# str.succ -> string
	# ------------------------------------------------------------------
	# Returns the successor to str. The successor is calculated by
	# incrementing characters starting from the rightmost alphanumeric
	# (or the rightmost character if there are no alphanumerics) in the
	# string. Incrementing a digit always results in another digit, and
	# incrementing a letter results in another letter of the same case.
	# Incrementing nonalphanumerics uses the underlying character set's
	# collating sequence.
	#
	# If the increment generates a "carry," the character to the left
	# of it is incremented. This process repeats until there is no
	# carry, adding a character if necessary. An exception is when the
	# carry is generated by a sequence of digits in a string containing
	# digits, nonalpha characters, and more digits, in which case the
	# carry applies to the digits. This allows for incrementing (for
	# example) numbers with decimal places.
	def test_String_InstanceMethods_succ
		assert_equal('abce', 'abcd'.succ)
		assert_equal('THX1139', 'THX1138'.succ)
		assert_equal('<<koalb>>', '<<koala>>'.succ)
		assert_equal('2000aaa', '1999zzz'.succ)
		assert_equal('AAAA0000', 'ZZZ9999'.succ)
		assert_equal('**+', '***'.succ)
		assert_equal("2.0", "1.9".succ)
		assert_equal("2//0", "1//9".succ)
		assert_equal("2/0/0/0", "1/9/9/9".succ)
		assert_equal("1y0", "1x9".succ)
	end

	# From the page 687
	# ------------------------------------------------------------------
	# str.succ! -> str
	# ------------------------------------------------------------------
	# Equivalent to String#succ but modifies the receiver in place.
	def test_String_InstanceMethods_succ!
		assert_equal('abce', 'abcd'.succ!)
		assert_equal('THX1139', 'THX1138'.succ!)
		assert_equal('<<koalb>>', '<<koala>>'.succ!)
		assert_equal('2000aaa', '1999zzz'.succ!)
		assert_equal('AAAA0000', 'ZZZ9999'.succ!)
		assert_equal('**+', '***'.succ!)
		assert_equal("2.0", "1.9".succ!)
		assert_equal("2//0", "1//9".succ!)
		assert_equal("2/0/0/0", "1/9/9/9".succ!)
		assert_equal("1y0", "1x9".succ!)
	end

	# From the page 687
	# ------------------------------------------------------------------
	# str.sum(n=16) -> int
	# ------------------------------------------------------------------
	# Returns a basic n-bit checksum of the characters in str, where n is
	# the optional parameter, defaulting to 16. The result is simply the
	# sum of the binary value of each character in str modulo 2^n-1. This
	# is not a particularly good checksum - see the digest libraries on
	# page 747 for better alternatives.
	def test_String_InstanceMethods_sum
		assert_equal(1408, "now is the time".sum)
		assert_equal(128, "now is the time".sum(8))
	end

	# From the page 687
	# ------------------------------------------------------------------
	# str.swapcase -> string
	# ------------------------------------------------------------------
	# Returns a copy of str with uppercase alphabetic characters converted
	# to lowercase and lowercase characters converted to uppercase. The
	# mapping depends on the string encoding, but not all encodings
	# produce expected results.
	def test_String_InstanceMethods_swapcase
		assert_equal('hELLO', 'Hello'.swapcase)
		assert_equal('MATHE', 'mathe'.swapcase)
	end

	# From the page 687
	# ------------------------------------------------------------------
	# str.swapcase! -> str or nil
	# ------------------------------------------------------------------
	# Equivalent to String#swapcase but modifies str in place, returning
	# str. Returns nil if no changes were made.
	def test_String_InstanceMethods_swapcase!
		a = 'hello'
		assert_equal('HELLO', a.swapcase!)
		assert_equal('HELLO', a)
	end

	# From the page 688
	# ------------------------------------------------------------------
	# str.to_c -> complex
	# ------------------------------------------------------------------
	# Returns the result of interpreting leading characters in str as a
	# complex number. Extraneous characters past the end of a valid number
	# are ignored. If there is not a valid number at the start of str,
	# Complex(0,0) is returned. The method never raises an exception.
	def test_String_InstanceMethods_to_c
		assert_equal(Complex(123,0), "123".to_c)
		assert_equal(Complex(4,5), "4+5i".to_c)
		assert_equal(Complex(0,0), "thx1138".to_c)
	end

	# From the page 688
	# ------------------------------------------------------------------
	# str.to_f -> float
	# ------------------------------------------------------------------
	# Returns the result interpreting leading characters in str as a
	# floating-point number. Extraneous characters past the end of a 
	# valid number are ignored. If there is not a valid number at the
	# start of str, 0.0 is returned. The method never raises an exception
	# (use Object#Float to validate numbers).
	def test_String_InstanceMethods_to_f
		assert_equal(1234.5, "123.45e1".to_f)
		assert_equal(45.67, "45.67 degrees".to_f)
		assert_equal(0.0, "thx1138".to_f)
	end

	# From the page 688
	# ------------------------------------------------------------------
	# str.to_i(base=10) -> int
	# ------------------------------------------------------------------
	# Returns the result of interpreting leading characters in str as an
	# integer base base (2 to 36). Given a base of zero, to_i looks for
	# leading, 0, 0b, 0d, or 0x and sets the base accordingly. Leading
	# spaces are ignored, and leading plus or minus signs are honored.
	# Extraneous characters past the end of a valid number are ignored.
	# If there is not a valid number at the start of str, 0 is returned.
	# The method never raises an exception.
	def test_String_InstanceMethod_to_i
		assert_equal(12345, "12345".to_i)
		assert_equal(99, '99 read balloons'.to_i)
		assert_equal(0, '0a'.to_i)
		assert_equal(10, '0a'.to_i(16))
		assert_equal(0, '0x10'.to_i)
		assert_equal(16, '0x10'.to_i(0))
		assert_equal(-16, '-0x10'.to_i(0))
		assert_equal(14167554, 'hello'.to_i(30))
		assert_equal(101, "1100101".to_i(2))
		assert_equal(294977, "1100101".to_i(8))
		assert_equal(1100101, "1100101".to_i(10))
		assert_equal(17826049, "1100101".to_i(16))
	end

	# From the page 688
	# ------------------------------------------------------------------
	# str.to_r -> rational
	# ------------------------------------------------------------------
	# Returns the result of interpreting leading characters in str as a
	# rational number. Extraneous characters past the end of a valid
	# number are ignored. If there is not a valid number at the start of
	# str, Rational(0,1) is returned. The method never raises an exception.
	def test_String_InstanceMethods_to_r
		assert_equal(123/1, "123".to_r)
		# assert_equal(Rational(5/6), "5/6".to_r)
		assert_equal(5/1, "5/six".to_r)
		assert_equal(0/1, "thx1138".to_r)
	end

	# From the page 689
	# ------------------------------------------------------------------
	# str.to_s -> str
	# ------------------------------------------------------------------
	# Returns the receiver
	def test_String_InstanceMethods_to_s
		assert_equal('hell', 'hell'.to_s)
		assert_equal('1234', 1234.to_s)
		assert_equal('12.3', 12.3.to_s)
	end

	# From the page 689
	# ------------------------------------------------------------------
	# str.to_str -> str
	# ------------------------------------------------------------------
	# Synonym for String#to_s. to_str is used by methods such as String#concat
	# to convert their arguments to a string. Unlike to_s, which is supported
	# by almost all classes, to_str is normally implemented only by those
	# classes that act like strings. Of the built-in classes, only Exception
	# and String implement to_str.
	def test_String_InstanceMethods_to_str
		assert_equal('hell', 'hell'.to_str)
		# TODO, need add other testcases.
	end

	# From the page 689
	# ------------------------------------------------------------------
	# str.to_s -> symbol
	# ------------------------------------------------------------------
	# Returns the symbol for str. This can create symbols that cannot be
	# represented using the :xxx notation. A synonym for String#intern.
	def test_String_InstanceMethods_to_sym
		s = 'cat'.to_sym; assert_equal(:cat, s)
		s = 'cat and dog'.to_sym
		assert_equal(:"cat and dog", s)
		assert_equal(true, s == :'cat and dog')	# God, what wrong!
	end

	# From the page 689
	# ------------------------------------------------------------------
	# str.tr(from_string, to_string) -> string
	# ------------------------------------------------------------------
	# Returns a copy of str with the characters in from_string replaced
	# by the corresponding character in to_string. If to_string is shorter
	# than from_string, it is padded with its last character. Both strings
	# may use the c1-c2 notation to denote ranges of characters, and
	# from_string may start with a^, which denotes all characters except
	# those listed.
	def test_String_InstanceMethods_tr
		assert_equal('h*ll*', 'hello'.tr('aeiou','*'))
		assert_equal('*e**o', 'hello'.tr('^aeiou','*'))
		assert_equal('hippo', 'hello'.tr('el', 'ip'))
		assert_equal('ifmmp', 'hello'.tr('a-y', 'b-z'))
	end

	# From the page 689
	# ------------------------------------------------------------------
	# str.tr!(from_string, to_string) -> str or nil
	# ------------------------------------------------------------------
	# Translates str in place, using the same rules as String#tr. Returns
	# str or returns nil if no changes were made.
	def test_String_InstanceMethods_tr!
		a='hello';	assert_equal('h*ll*', a.tr!('aeiou','*'))	; assert_equal('h*ll*', a)
		b='hello';	assert_equal('*e**o', b.tr!('^aeiou','*'))	; assert_equal('*e**o', b)
		c='hello';	assert_equal('hippo', c.tr!('el', 'ip'))	; assert_equal('hippo', c)
		d='hello';	assert_equal('ifmmp', d.tr!('a-y', 'b-z'))	; assert_equal('ifmmp', d)
	end

	# From the page 689
	# ------------------------------------------------------------------
	# str.tr_s(from_string, to_string) -> string
	# ------------------------------------------------------------------
	# Processes a copy of str as described under String#tr and then removes
	# duplicate characters in regions that were affected by the translation.
	def test_String_InstanceMethods_tr_s
		assert_equal('hero', 'hello'.tr_s('l', 'r'))
		assert_equal('h*o',  'hello'.tr_s('el', '*'))
		assert_equal('hhxo', 'hello'.tr_s('el', 'hx'))
	end

	# From the page 690
	# ------------------------------------------------------------------
	# str.tr_s!(from_string, to_string) -> str or nil
	# ------------------------------------------------------------------
	# Performs String#tr_s processing on str in place, returning str.
	# Returns nil if no changes were made.
	def test_String_InstanceMethods_tr_s!
		a='hello';	assert_equal('hero', a.tr_s!('l', 'r'));	assert_equal('hero', a)
		b='hello';	assert_equal('h*o',  b.tr_s!('el', '*'));	assert_equal('h*o',  b)
		c='hello';	assert_equal('hhxo', c.tr_s!('el', 'hx'));	assert_equal('hhxo', c)
	end

	# From the page 690
	# ------------------------------------------------------------------
	# str.unpack(format) -> array
	# ------------------------------------------------------------------
	# Decodes str (which may contain binary data) according to the format
	# string, returning an array of the extracted values. The format string
	# consists of a sequence of single-character directives, summarized in
	# Table 24, Directives for unpack, on page 692. Each directive may be
	# followed by a number, indicating the number of times to repeat this
	# directive. An asterisk (*) will use up all remaining element. The
	# directives sSillL may each be followed by an underscore (_) or bang
	# (!} to use the underlying platform's native size for the specified
	# type; otherwise, it uses a platform-independent consistent size. The
	# directives s S i l l L q Q may be followed by a less than sign to
	# signify little endian or greater than sign for big endian. Spaces
	# are ignored in the format string. Comments starting with # to the
	# next newline or end of string are also ignored. The encoding of the
	# string is ignored; unpack treats the string as a sequence of bytes.
	# See also Array#pack on page 432.
	def test_String_InstanceMethods_unpack
		assert_equal(["abc", "abc "],  "abc \0\0abc \0\0".unpack('A6Z6'))
		assert_equal(["abc", " \0\0"], "abc \0\0".unpack('a3a3'))
		assert_equal(["10000110", "01100001"], "aa".unpack('b8B8'))
		assert_equal(["16", "61", 97], "aaa".unpack('h2H2c'))
		assert_equal([-2, 65534], "\xfe\xff\xfe\xff".unpack('sS'))
		assert_equal(["now is"], "now=20is".unpack('M*'))
		assert_equal(["h", "e", "l", "l", "o"], "whole".unpack('xax2aX2aX1aX2a'))
	end

	# From the page 690
	# ------------------------------------------------------------------
	# str.upcase -> string
	# ------------------------------------------------------------------
	# Returns a copy of str with all lowcase letters replaced with their
	# uppercase counterparts. The mapping depends on the string encoding,
	# but not all encoding produce expected results.
	def test_String_InstanceMethods_upcase
		assert_equal('HELLO', 'hello'.upcase )
		assert_equal('HELLO', 'hELLo'.upcase )
		assert_equal('HELLO', 'hEllO'.upcase )
	end

	# From the page 690
	# ------------------------------------------------------------------
	# str.upcase! -> str or nil
	# ------------------------------------------------------------------
	# Upcases the contents of str, returning nil if no changes were made.
	def test_String_InstanceMethods_upcase!
		a='hello'; assert_equal('HELLO', a.upcase! ); assert_equal('HELLO',a)
		b='hELLo'; assert_equal('HELLO', b.upcase! ); assert_equal('HELLO',a)
		c='hEllO'; assert_equal('HELLO', c.upcase! ); assert_equal('HELLO',a)
	end

	# From the page 691
	# ------------------------------------------------------------------
	# str.upto(string, exclude_end=false) {|s|...} -> str or enumerator
	# ------------------------------------------------------------------
	# Iterates through successive values, starting at str and ending
	# at string inclusive (or omitting string if the second parameter is
	# true). Passes each value in turn to the block. The String#succ
	# method is used to generate each value. Returns an Enumerator object
	# if no block is given.
	def test_String_InstanceMethods_upto
		assert_equal(['a8','a9','b0','b1','b2','b3','b4','b5'], 'a8'.upto('b6',true).to_a)
		# TODO, assert_equal(['99','100','101','102','103'], '99'.upto('103').to_a)
		assert_equal(['008','009','010','011','012'], '008'.upto('012').to_a)
	end

	# From the page 691
	# ------------------------------------------------------------------
	# str.valid_encoding? -> true or false
	# ------------------------------------------------------------------
	# Returns true if str contains a valid byte sequence in its current
	# encoding.
	def test_String_InstanceMethods_valid_encoding?
		str = "\xE2"; str.force_encoding("utf-8"); 
		assert_equal(false, str.valid_encoding?)
		
		str = "\xE2\x88\x82"; str.force_encoding("utf-8"); 
		assert_equal(true, str.valid_encoding?)
	end

end
