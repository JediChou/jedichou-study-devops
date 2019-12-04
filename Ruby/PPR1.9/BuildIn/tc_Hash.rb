#####################################################################
# File name: tc_Hash.rb
# Create date: 2013-9-26 12:11 PM
# Update date: 2013-9-29 08:54 AM
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Hash < Test::Unit::TestCase

	# From the page 521
	# ------------------------------------------------------------------
	# Hash [ <key=>value>* ] -> hsh
	# Hash [ obj ] -> hsh
	# ------------------------------------------------------------------
	# Creates a new hash populated with the given objects. Equivalent to
	# creating a hash using the literal {key=>value,...}. Keys and values
	# occur in paris, so there must be an even number of arguments. In the
	# second form, obj must respond to to_hash
	def test_Hash_InstanceMethods_Hash
		assert_equal({'a'=>100, "b"=>200}, Hash['a',100,'b',200])
		assert_equal({'a'=>100, "b"=>200}, Hash['a'=>100,'b'=>200])
		assert_equal({'a'=>100, "b"=>200}, {'a'=>100,'b'=>200})
	end

	# From the page 521
	# ------------------------------------------------------------------
	#                 Hash.new -> hsh
	#            Hash.new(obj) -> hsh
	# Hash.new {|hash,key|...} -> hsh
	# ------------------------------------------------------------------
	# Returns a new, empty hash. If this hash is subsequently accessed by
	# a key that doesn't correspond to a hash entry, the value returned
	# depends on the style of new used to create the hash. In the first
	# form, the access returns nil. If obj is specified, this single object
	# will be used for all default values. If a block specified, it will
	# be called with the hash object and the key, and it should return the
	# default value. It is the block's responsibility to store the value
	# in the hash if required.
	def test_Hash_InstanceMethods_new
		h = Hash.new("Go Fish")
		h["a"] = 100; h["b"]=200;
		assert_equal(100, h["a"])
		assert_equal("Go Fish", h["c"])
		assert_equal("GO FISH", h["c"].upcase!)
		assert_equal("GO FISH", h["d"])
		assert_equal(["a","b"], h.keys)

		# While this creates a new default object each time
		h = Hash.new{|hash, key| hash[key] = "Go Fish: #{key}"}
		assert_equal("Go Fish: c", h["c"])
		assert_equal("GO FISH: C", h["c"].upcase!)
		assert_equal("Go Fish: d", h["d"])
		assert_equal(["c","d"], h.keys)
	end

	# From the page 522
	# ------------------------------------------------------------------
	# Hash.try_convert(obj) -> a_hash or nil
	# ------------------------------------------------------------------
	# If obj is not already a hash, attempts to convert it to one by 
	# calling it to_hash method. Returns nil if no conversion could be
	# made.
	def test_Hash_InstanceMethods_try_convert
		config = ConfigFile.new("./tfile/filename")
		assert_equal(nil, Hash.try_convert(config)["user_name"])
		assert_equal(nil, Hash.try_convert(config)["password"])
	end

	# From the page 522
	# ------------------------------------------------------------------
	# hsh = obj -> true or false
	# ------------------------------------------------------------------
	# Equality - Two hashes are equal if they contain the same number of
	# keys and the value corresponding to each key in the first hash is
	# equal (using ==) to the value for the same key in the second. If
	# obj is not a hash, attempts to convert it using to_hash and returns
	# obj == hsh.
	def test_Hash_InstanceMethods_Equality
		h1 = { 'a'=>1, 'c'=>2 }
		h2 = { 7=>35, 'c'=>2, 'a'=>1 }
		h3 = { 'a'=>1, 'c'=>2, 7=>35 }
		h4 = { 'a'=>1, 'd'=>2, 'f'=>35 }
		assert_equal(false, h1 == h2)
		assert_equal(true,  h2 == h3)
		assert_equal(false, h3 == h4)
	end

	# From the page 522
	# ------------------------------------------------------------------
	# hsh[key] -> value
	# ------------------------------------------------------------------
	# Element Reference - Retrieves the value stored for key. If not
	# found, returns the default value (see Hash.new for details).
	def test_Hash_InstanceMethods_ElementReference
		h = { 'a'=>100, 'b'=>200 }
		assert_equal(100, h['a'])
		assert_equal(nil, h['c'])
	end

	# From the page 523
	# ------------------------------------------------------------------
	# hsh[key] = value -> value
	# ------------------------------------------------------------------
	# Element Assignment - Associates the value given by value with the
	# key given by key. key should not have its value changed while it is
	# in use as a key (a string passed as a key will be duplicated and
	# frozen).
	def test_Hash_InstanceMethods_ElementAssignment
		h = { 'a'=>100, 'b'=>200 }
		h['a'] = 9; h['c'] = 4
		assert_equal({'a'=>9, 'b'=>200, 'c'=>4}, h)
	end

	# From the page 523
	# ------------------------------------------------------------------
	# hsh.assoc(key) -> [key, val] or nil
	# ------------------------------------------------------------------
	# Returns the two element array [key, hsh[key]] or nil if key does not
	# reference an entry in the hash.
	def test_Hash_InstanceMethods_assoc
		h = {'a'=>100, "b"=>200}
		assert_equal(['a',100], h.assoc('a'))
		assert_equal(['b',200], h.assoc('b'))
	end

	# From the page 523
	# ------------------------------------------------------------------
	# hsh.clear -> hsh
	# ------------------------------------------------------------------
	# Removes all key/value pairs from hsh.
	def test_Hash_InstanceMethods_clear
		h = { 'a'=>100, 'b'=>200 }; h.clear
		assert_equal({}, h)
	end

	# From the page 523
	# ------------------------------------------------------------------
	# hsh.compare_by_identity -> hsh
	# ------------------------------------------------------------------
	# Hashes normally compare key values using eql?, which returns true
	# if two objects have the same value. If you call compare_by_identity,
	# keys will instead be considered to be equal only if they are the
	# same object. Note that when strings are used as keys, they are
	# automatically duplicated, so you will never be able to retrieve a
	# string-keyed entry if keys are compared using identity.
	def test_Hash_InstanceMethods_compare_by_identity
		key = "key"
		h = { key=>100, 99=>"ninety nine" }
		assert_equal(100, h[key])
		assert_equal(100, h["key"])
		assert_equal("ninety nine", h[99])

		h.compare_by_identity
		assert_equal(nil, h[key])
		assert_equal(nil, h["key"])
		assert_equal("ninety nine", h[99])
	end

	# From the page 523
	# ------------------------------------------------------------------
	# hsh.compare_by_identity? -> true or false
	# ------------------------------------------------------------------
	# Returns true if hsh compares keys by identity.

	# From the page 524
	# ------------------------------------------------------------------
	# hsh.default(key=nil) -> obj
	# ------------------------------------------------------------------
	# Returns the default value, the value that would be returned by
	# hsh[key] if key did not exist in hsh. See also Hash.new and
	# Hash#default=.
	def test_Hash_InstanceMethods_default
		h = Hash.new
		assert_equal(nil, h.default)
		assert_equal(nil, h.default(2))

		h = Hash.new("cat")
		assert_equal("cat", h.default)
		assert_equal("cat", h.default(2))

		h = Hash.new {|h,k| h[k] = k.to_i*10}
		assert_equal(nil, h.default)
		assert_equal(20 , h.default(2))
	end

	# From the page 524
	# ------------------------------------------------------------------
	# hsh.default= obj -> hsh
	# ------------------------------------------------------------------
	# Sets the value returned for a key that does not exist in the hash.
	# Use Hash#default_proc=to set the proc to be called to calculate a
	# default.
	def test_Hash_InstanceMethods_default=
		h = {'a'=>100, 'b'=>200}
		h.default = "Go fish"
		assert_equal(100, h['a'])
		assert_equal("Go fish", h["z"])

		# This doesn't do what you might hope... (but see default_proc=)
		h.default = lambda { |hash, key| hash[key] = key + key }
	end

	# From the page 524
	# ------------------------------------------------------------------
	# hsh.default_proc -> obj or nil
	# ------------------------------------------------------------------
	# If Hash.new was invoked with a block, returns that block; otherwise,
	# return nil
	def test_Hash_InstanceMethods_default_proc
		h = Hash.new {|h,k| h[k]=k*k}
		assert_equal({}, h)
		p = h.default_proc
		a = []
		p.call(a, 2)
		assert_equal([nil,nil,4], a)
	end

	# From the page 524
	# ------------------------------------------------------------------
	# hsh.default_proc = proc -> proc or nil
	# ------------------------------------------------------------------
	# Sets the proc to be called to calculate values to be returned when
	# a hash is accessed with a key it does not contain. Removes the
	# default proc if passed nil.
	def test_Hash_InstanceMethods_default_proc=
		h = { 'a'=>100, 'b'=>200 }
		h.default = "Go fish"
		assert_equal(100, h['a'])
		assert_equal("Go fish", h["z"])

		h.default_proc = lambda { |hash, key| hash[key]=key+key }
		assert_equal(4, h[2])
		assert_equal("catcat", h["cat"])
	end

	# From the page 525
	# ------------------------------------------------------------------
	#            hsh.delete(key) -> value
	# hsh.delete(key) {|key|...} -> value
	# ------------------------------------------------------------------
	# Deletes from hsh the entry whose key is to key, returning the
	# corresponding value. If the key is not found, returns nil. If the
	# optional code block is given and the key is not found, passes
	# it the key and returns the result of block.
	def test_Hash_InstanceMethods_delete
		h = {'a'=>100, "b"=>200}
		assert_equal(100, h.delete("a"))
		assert_equal(nil, h.delete("z"))
		assert_equal("z not found", h.delete("z") {|elt| "#{elt} not found"})
	end

	# From the page 525
	# ------------------------------------------------------------------
	# hsh.delete_if <{|key, value|...}> -> hsh or enumerator
	# ------------------------------------------------------------------
	# Deletes every key/value pair from hsh for which block is true.
	# Returns an Enumerator object if no block is given.
	def test_Hash_InstanceMethods_delete_if
		h = {'a'=>100, 'b'=>200, 'c'=>300 }
		h.delete_if {|key, value| key>='b'}
		assert_equal({'a'=>100}, h)
	end

	# From the page 525
	# ------------------------------------------------------------------
	# hsh.each {|key,value|...} -> hsh
	# ------------------------------------------------------------------
	# Calls block once for each key in hsh, passing the key and value
	# as parameters.
	def test_Hash_InstanceMethods_each
		h = {'Sara'=>'BL-Girl', 'Winnie'=>'BL-Girl'}
		h.each { |key,value| assert_equal('BL-Girl', value) }
	end

	# From the page 525
	# ------------------------------------------------------------------
	# hsh.each_key {|key|...} -> hsh
	# ------------------------------------------------------------------
	# Calls block once for each in hsh, passing the key as a parameter.
	def test_Hash_InstanceMethods_each_key
		h = {1=>'CocaCola', 2=>'MonstDrink'}; result = []
		h.each_key {|key| result.push(key)}
		assert_equal([1,2], result)
	end

	# From the page 525
	# ------------------------------------------------------------------
	# hsh.each_pair {|key,value|...} -> hsh
	# ------------------------------------------------------------------
	# Synonym for Hash#each.
	def test_Hash_InstanceMethods_each_pair
		h = {'a'=>100, 'b'=>100}
		h.each_value {|value| assert_equal(100, value)}
	end

	# From the page 526
	# ------------------------------------------------------------------
	# hsh.empty? -> true or false
	# ------------------------------------------------------------------
	# Returns true if hsh contains no key/value pairs.
	def test_Hash_InstanceMethods_empty?
		assert_equal(true,  {}.empty?)
		assert_equal(false, {'b'=>1}.empty?)
	end

	# From the page 526
	# ------------------------------------------------------------------
	# hsh.fetch(key <,default>) -> obj
	# hsh.fetch(key) {|key|...} -> obj}
	# ------------------------------------------------------------------
	# Returns a value from the hash for the given key. If the key can't
	# be found, several options exist. With no other arguments, it will
	# raise an IndexError exception; if default is given, then that will
	# be returned; if the optional code block is specified, then that
	# will be run and its result returned. fetch does not evaluate any
	# default values supplied when the hash was created - it looks only
	# for keys in the hash.
	def test_Hash_InstanceMethods_fetch
		h = {'a'=>100, 'b'=>200}
		assert_equal(100, h.fetch('a'))
		assert_equal('go fish', h.fetch('z','go fish'))
		assert_equal('go fish, z', h.fetch('z') {|el| "go fish, #{el}"})
	end

	# From the page 527
	# ------------------------------------------------------------------
	# hsh.flatten( depth=1 ) -> an_array
	# ------------------------------------------------------------------
	# Converts hsh to an array and then invokes Array#flatten! on the
	# result.
	def test_Hash_InstanceMethods_flatten
		h = { feline:["felix", "tom"], equine:"ed" }
		assert_equal([:feline, ["felix","tom"], :equine, "ed"], h.flatten)
		assert_equal([:feline, ["felix","tom"], :equine, "ed"], h.flatten(1))
		assert_equal([:feline, "felix","tom", :equine, "ed"],   h.flatten(2))
	end

	# From the page 626
	# ------------------------------------------------------------------
	# hsh.hash_key?(key) -> true or false
	# ------------------------------------------------------------------
	# Return true if the given key is present in hsh.
	def test_Hash_InstanceMethods_hash_key?
		h = {'a'=>100, 'b'=>200}
		assert_equal(true,  h.has_key?('a'))
		assert_equal(false, h.has_key?('z'))
	end

	# From the page 527
	# ------------------------------------------------------------------
	# hsh.has_value?(value) -> true or false
	# ------------------------------------------------------------------
	# Returns true if the given value is present for some key in hsh.
	def test_Hash_InstanceMethods_has_value?
		h = {'a'=>100, 'b'=>200}
		assert_equal(true,  h.has_value?(100))
		assert_equal(false, h.has_value?(999))
	end

	# From the page 527
	# ------------------------------------------------------------------
	# hsh.include?(key) -> true of false
	# ------------------------------------------------------------------
	# Synonym for Hash#has_key?.
	def test_Hash_InstanceMethods_include?
		h = {'a'=>100, 'b'=>200}
		assert_equal(true,  h.include?('a'))
		assert_equal(true,  h.include?('b'))
		assert_equal(false, h.include?('c'))
	end

	# From the page 527
	# ------------------------------------------------------------------
	# hsh.index(value) -> key
	# ------------------------------------------------------------------
	# Deprecated - use Hash#key instead.
	def test_Hash_InstanceMethods_index
		h = {'a'=>100, 'b'=>200}
		# TODO
	end

	# From the page 527
	# ------------------------------------------------------------------
	# hsh.invert -> other_hash
	# ------------------------------------------------------------------
	# Returns a new hash created by using hsh's value as keys and using
	# the keys as values. If hsh has duplicate values, the result will
	# contain only one of them as a key - which one is not predictable.
	def test_Hash_InstanceMethods_invert
		h = {'n'=>100, 'm'=>100, 'y'=>300, 'd'=>200, 'a'=>0}
		assert_equal({100=>'m',300=>'y',200=>'d',0=>'a'}, h.invert)
	end

	# From the page 528
	# ------------------------------------------------------------------
	# hsh.keep_if {|key,value|...} -> hsh or enumerator
	# ------------------------------------------------------------------
	# Modifies hsh by removing all elements for which block is false (see
	# also Enumerable#select and Hash.select!.) Returns an Enumerator
	# object if no block is given.
	def test_Hash_InstanceMethods_keepif
		a = {a: 1, b: 2, c: 3}
		# TODO
		# assert_equal({:b=>2, :c=>3}, a.keep_if {|key, value| key =~ /[bc]/})
		# assert_equal({:b=>2, :c=>3}, a)
	end

	# From the page 528
	# ------------------------------------------------------------------
	# hsh.key(value) -> key or nil
	# ------------------------------------------------------------------
	# Returns the key of the first hash entry whose value is value.
	def test_Hash_InstanceMethods_key
		h = {a: 100, b: 200, c: 100}
		assert_equal('a', h.key(100).to_s)
		assert_equal('b', h.key(200).to_s)
		assert_equal(nil, h.key(300))
	end

	# From the page 527
	# ------------------------------------------------------------------
	# hsh.key?(key) -> true or false
	# ------------------------------------------------------------------
	# Synonym for Hash#has_key
	def test_Hash_InstanceMethods_key?
		a = {'Father'=>'Jedi', 'Mother'=>'Becky'}
		assert_equal(true, a.key?('Father'))
		assert_equal(true, a.key?('Mother'))
	end

	# From the page 528
	# ------------------------------------------------------------------
	# hsh.keys -> array
	# ------------------------------------------------------------------
	# Returns a new array populated with the keys from this hash. See
	# also Hash#values.
	def test_Hash_InstanceMethods_keys
		h = {'a'=>100, 'b'=>200}
		assert_equal(['a','b'], h.keys)
	end

	# From the page 528
	# ------------------------------------------------------------------
	# hsh.length -> fixnum
	# ------------------------------------------------------------------
	# Returns the number of key/value pairs in the hash.
	def test_Hash_InstanceMethods_length
		h = {'d'=>100, 'a'=>200, 'v'=>300, 'e'=>400}
		assert_equal(4, h.length)
		assert_equal(200, h.delete('a'))
		assert_equal(3, h.length)
	end

	# From the page 528
	# ------------------------------------------------------------------
	#                            hsh.merge(other_hash) -> result_hash
	# hsh.merge(other_hash) {|key,old_val,new_val|...} -> result_hash
	# ------------------------------------------------------------------
	# Returns a new hash containing the contents of other_hash and the
	# contents of hsh. With no block parameter, overwirtes entries in hsh
	# with duplicate keys with those from other_hash. If a block is 
	# specified, it is called with each duplicate key and the values from
	# the two hashes. The value returned by the block is stored in the
	# new hash.
	def test_Hash_InstanceMethods_merge
		h1 = { 'a'=>100, 'b'=>200 }
		h2 = { 'b'=>254, 'c'=>300 }
		assert_equal({'a'=>100,'b'=>254,'c'=>300}, h1.merge(h2))
		assert_equal({'a'=>100,'b'=>200,'c'=>300}, h1.merge(h2) {|k,o,n| o})
		assert_equal({'a'=>100,'b'=>200}, h1)
	end

	# From the page 528
	# ------------------------------------------------------------------
	#                           hsh.merge!(other_hash) -> hsh
	# hsh.merge!(other_hahs){|key,old_val,new_val|...} -> hsh
	# ------------------------------------------------------------------
	# Like Hash#merge but changes the contesnts of hsh.
	def test_Hash_InstanceMethods_merge!
		h1 = {'a'=>100,'b'=>200}
		h2 = {'b'=>254,'c'=>300}
		assert_equal({'a'=>100,'b'=>254,'c'=>300}, h1.merge!(h2))
		assert_equal({'a'=>100,'b'=>254,'c'=>300}, h1)
	end

	# From the page 528
	# ------------------------------------------------------------------
	# hsh.rassoc(val) -> [key, val] or nil
	# ------------------------------------------------------------------
	# Searches hsh for the first element whose value is val, returning
	# the key and value as a two element array. Returns nil if the value
	# does not occur in the hash.
	def test_Hash_InstanceMethods_rassoc
		h = {'a'=>100, 'b'=>200, 'c'=>100 }
		assert_equal(['a',100], h.rassoc(100))
		assert_equal(['b',200], h.rassoc(200))
	end

	# From the page 529
	# ------------------------------------------------------------------
	# hsh.rehash -> hsh
	# ------------------------------------------------------------------
	# Rebuilds the hash based on the current hash values for each key.
	# If values of key objects have changed since they were inserted, 
	# this method will reindex hsh. If Hash#rehash is called while an
	# iterator is traversing the hash, an IndexError will be raised in
	# the iterator.
	def test_Hash_InstanceMethods_rehash
		a = ['a', 'b']
		c = ['c', 'd']
		h = { a=>100, c=>300 }
		a[0] = 'z'
		assert_equal(nil, h[a])
		assert_equal({['z','b']=>100, ['c','d']=>300}, h.rehash)
		assert_equal(100, h[a])
	end

	# From the page 529
	# ------------------------------------------------------------------
	# hsh.reject {|key,value|...} -> hash
	# ------------------------------------------------------------------
	# Same as Hash#delete_if but uses (and returns) a copy of hsh.
	# Equivalent to hsh.delete_if.
	def test_Hash_InstanceMethods_reject
		# TODO, will be add some testcases
	end

	# From the page 529
	# ------------------------------------------------------------------
	# hsh.reject!<{|key,value|...}> -> hsh or enumerator
	# ------------------------------------------------------------------
	# Equivalent to Hash#delete_if but returns nil if no changes were
	# made. Returns an Enumerator object if no block is given.
	def test_Hash_InstanceMethods_reject!
		# TODO, will be add some testcases
		# "test_Hash_InstanceMethods_reject!"		
	end

	# From the page 529
	# ------------------------------------------------------------------
	# hsh.replace(other_hash) -> hsh
	# ------------------------------------------------------------------
	# Replaces the contents of hsh with the contents of other_hash.
	def test_Hash_InstanceMethods_replace
		h = {'a'=>100, 'b'=>200}
		assert_equal({'c'=>300, 'd'=>400}, h.replace({'c'=>300, 'd'=>400}))
		assert_equal({'c'=>300, 'd'=>400}, h)
	end

	# From the page 529
	# ------------------------------------------------------------------
	# hsh.select {|key,value|...} -> hash
	# ------------------------------------------------------------------
	# Returns a new hash consisting of [key, value] pairs for which the
	# block returns true. Also see Hash#values_at. (This behavior differs
	# from Ruby 1.8, which returns an array of arrays.)
	def test_Hash_InstanceMethods_select
		h = {'a'=>100, 'b'=>200, 'c'=>300}
		assert_equal({'b'=>200, 'c'=>300}, h.select {|k,v| k>'a'})
		assert_equal({'a'=>100}, h.select {|k,v| v<200})
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.select! {|key,value|...} -> hsh, nil, or enumerator
	# ------------------------------------------------------------------
	# Modifies hsh by removing all elements for which block is false (
	# see also Enumerable#select and Hash#keep_if). Returns nil if no
	# changes were made or returns an Enumerator object if no block is
	# given. Otherwise, returns hsh.
	def test_Hash_InstanceMethods_select!
		a = {a: 1, b: 2, c: 3}
		# TODO
		# assert_equal({:a=>1}, a.select! {|key,value| value<2})
		# assert_equal(nil,     a.select! {|key,value| value<3})
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.shift -> array or nil
	# ------------------------------------------------------------------
	# Removes a key/value pair from hsh and returns it as the two-item
	# array [key,value]. If the hash is empty, returns the default value,
	# calls default proc (with a key value of nil), or returns nil.
	def test_Hash_InstanceMethods_shift
		h = {1=>'a', 2=>'b', 3=>'c'}
		assert_equal([1,'a'], h.shift)
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.size -> fixnum
	# ------------------------------------------------------------------
	# Synonym for Hash#length
	def test_Hash_InstanceMethods_size
		h={1=>'a', 2=>'b', 3=>'c'}
		assert_equal(3, h.size)
	end

	# From the page 530
	# ------------------------------------------------------------------
	#            hsh.sort -> array
	# hsh.sort {|a,b|...} -> array
	# ------------------------------------------------------------------
	# Converts hsh to a nested array of [key,value] arrays and sorts it,
	# using Array#sort. (Techinically this is just the sort method of
	# Enumerable. It's documented here because it's unusual for sort to
	# return a different type.)
	def test_Hash_InstanceMethods_sort
		h = {'a'=>20, 'b'=>30, 'c'=>10}
		assert_equal([['a',20],['b',30],['c',10]], h.sort)
		assert_equal([['c',10],['a',20],['b',30]], h.sort {|k,v| k[1]<=>v[1]}) 
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.store(key, value) -> value
	# ------------------------------------------------------------------
	# Synonym for Element Assignment (Hash#[]=).
	def test_Hash_InstanceMethods_store
		# TODO, will be add some testcases
		assert_equal(true, true)
	end
	
	# From the page 530
	# ------------------------------------------------------------------
	# hsh.to_a -> array
	# ------------------------------------------------------------------
	# Converts hsh to nested array of [key,value] arrays.
	def test_Hash_InstanceMethods_to_a
		h = {'c'=>300, 'a'=>100, 'd'=>400, 'c'=>300}
		assert_equal([['c',300],['a',100],['d',400]], h.to_a)
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.to_h -> hsh
	# ------------------------------------------------------------------
	# Returns the hash. Converts the receiver to hash if send to a subclass
	# of Hash.
	def test_Hash_InstanceMethods_to_h
		# TODO, will be add some testcases
		assert_equal(true, true)
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.to_hash -> hsh
	# ------------------------------------------------------------------
	# See the discussion in the ducktyping chapter on page 351.
	def test_Hash_InstanceMethods_to_hash
		# TODO, will be add some testcases
		assert_equal(true, true)
	end

	# From the page 530
	# ------------------------------------------------------------------
	# hsh.to_s -> string
	# ------------------------------------------------------------------
	# Converts hsh to a string by converting the hash to an array of
	# [key,value] pairs and then converting that array to a string using
	# Array#join with the default separator.
	def test_Hash_InstanceMethods_to_s
		h = {"c"=>300, "a"=>100, "d"=>400, "c"=>300}
		assert_equal("{\"c\"=>300, \"a\"=>100, \"d\"=>400}", h.to_s)
	end

	# From the page 531
	# ------------------------------------------------------------------
	#                            hsh.update(other_hash) -> hsh
	# hsh.update(other_hash) {|key,old_val,new_val|...} -> hsh
	# ------------------------------------------------------------------
	# Synonym for Hash#merge!
	def test_Hash_InstanceMethods_update
		h1 = {'a'=>100,'b'=>200}
		h2 = {'b'=>254,'c'=>300}
		assert_equal({'a'=>100,'b'=>254,'c'=>300}, h1.update(h2))
		assert_equal({'a'=>100,'b'=>254,'c'=>300}, h1)
	end

	# From the page 531
	# ------------------------------------------------------------------
	# hsh.value?(value) -> true or false
	# ------------------------------------------------------------------
	# Synonym for Hash#has_value?.
	def test_Hash_InstanceMethods_value?
		# TODO, will be add some testcases
		assert_equal(true, true)
	end

	# From the page 531
	# ------------------------------------------------------------------
	# hsh.values -> array
	# ------------------------------------------------------------------
	# Returns an array populated with the values from hsh. See also
	# Hash#keys
	def test_Hash_InstanceMethods_values
		h = {'a'=>100, 'b'=>200, 'c'=>300}
		assert_equal([100,200,300], h.values)
	end

	# From the page 531
	# ------------------------------------------------------------------
	# hsh.values_at(<key>+) -> array
	# ------------------------------------------------------------------
	# Returns an array consisting of values for given key(s). Will insert
	# the default value for keys that are not found.
	def test_Hash_InstanceMethods_values_at
		h = {'a'=>100, 'b'=>200, 'c'=>300}
		assert_equal([100,300], h.values_at("a","c"))
		assert_equal([100,300,nil], h.values_at("a","c","z"))
		h.default = "cat"
		assert_equal([100,300,"cat"], h.values_at("a","c","z"))
	end

end

#####################################################################
# A helper class for test_Hash_InstanceMethods_try_convert method
class ConfigFile
	def initialize(name)
		@content = File.read(name)
	end
	def to_hash
		result = {}
		@content.scan(/^(\w+):\s*(.*)/) do |name, value|
			result[name] = value
		end
		result
	end
end
