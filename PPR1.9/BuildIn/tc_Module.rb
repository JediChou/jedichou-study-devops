#####################################################################
# File name: tc_Module.rb
# Create date: 2013-10-9 11:24 AM
# Update date: 
# Description: Cross write unit test to study build-in classes
#####################################################################
# Author  : Jedi Chou
# From    : Programming Ruby 1.9 & 2.0
#           The Pragmatic Programmers' Guide
# ISBN-13 : 978-1-93778-549-9
#####################################################################

require 'test/unit'

class TC_Module < Test::Unit::TestCase
	
	# From the page 568
	# ------------------------------------------------------------------
	# In the descriptions that follow, the parameter symbol refers to a
	# name, which is either a quoted string or a symbol (such as :name).
	def test_Module_Introduction
		assert_equal("Module", Mod_Introduction.class.name)
		assert_equal([:CONST, :PI, :E], Mod_Introduction.constants)
	end

	# From the page 568
	# ------------------------------------------------------------------
	#                  Module.constants -> array
	# Module.constants(include_parents) -> array
	# ------------------------------------------------------------------
	# With no argument, returns a list of the top-level constans in the
	# interpreter. With one argument, returns the constants defined in
	# class Module (and its parents if the argument is true). This
	# somewhat obscure interface is because Module is a kind of Class,
	# and Class is a subclass of Module. The first form of call is a
	# true call to the class method constants, while the second form
	# actually proxies to the instance method form (see Module#constans
	# later in this section).
	def test_Module_ClassMethods_constants
		# Notice, not same as book.
		assert_equal([:SPURIOUS_CONSTANT], Module2.constants.sort[1..3])
		assert_equal(true, (Module2.constants.include? :CONST_MIXIN) )
		assert_equal([:SPURIOUS_CONSTANT], Module2.constants(false))
		assert_equal([:SPURIOUS_CONSTANT, :CONST_MIXIN], Module2.constants(true))
	end

	# From the page 568
	# ------------------------------------------------------------------
	# Module.nesting -> array
	# ------------------------------------------------------------------
	# Returns the list of modules nested at the point of call.
	def test_Module_ClassMethods_nesting
		# TODO, need add test cases.
	end

	# From the page 569
	# ------------------------------------------------------------------
	#            Module.new -> mod
	# Module.new {|mod|...} -> mod
	# ------------------------------------------------------------------
	# Creates a new anonymous module. If a block is given, it is passed
	# the module object, and the block is evaluated in the context of
	# this module using module_eval.
	def test_Module_ClassMethods_new
		a = "my string"
		assert_equal("my string", a.extend(Fred))
		assert_equal("hello", a.meth_one)
		assert_equal("bye", a.meth_two)
	end

	# From the page 569
	# ------------------------------------------------------------------
	# mod relop module -> true, false or nil
	# ------------------------------------------------------------------
	# Hierarchy Query - One module is considered greater than another if
	# it is included in (or is a parent class of) the other module. The
	# other operators are defined accordingly. If there is no relationship
	# between the modules, all operators return nil.
	def test_Module_InstanceMethods_HierarchyQuery
		assert_equal(false, Parent_6 > Mixin_5)
		assert_equal(true,  Parent_6 < Mixin_5)
		assert_equal(true,  Parent_6 <= Parent_6)
		assert_equal(nil,   Parent_6 < Unrelated_7)
		assert_equal(nil,   Parent_6 > Unrelated_7)
	end

	# From the page 570
	# ------------------------------------------------------------------
	# mod <=> other_mod -> -1, 0, +1
	# ------------------------------------------------------------------
	# Comparison - Returns -1 if mod includes other_mod, 0, if mod is the
	# same module as other_mod, and +1 if mod is included by other_mod or
	# if mod has no relationship with other_mod.
	def test_Module_InstanceMethods_Comparison
		assert_equal(0, Parent_6 <=> Parent_6)
		assert_equal(-1, Parent_6 <=> Mixin_5)
		assert_equal(1, Mixin_5 <=> Parent_6)
	end

	# From the page 570
	# ------------------------------------------------------------------
	# mod === obj -> true or false
	# ------------------------------------------------------------------
	# Case Equality - Returns true if obj is an instance of mod or one
	# of mod's descendents. Of limited use for modules but can be used
	# in case statements to test objects by class.
	def test_Module_InstanceMethods_CaseEquality
		assert_equal(false, Parent_6 === Parent_6)
		# Need, add other test cases.
		# assert_equal(true, Fred === Fred)
	end

	# From the page 570
	# ------------------------------------------------------------------
	# mod.ancestors -> array
	# ------------------------------------------------------------------
	# Returns a list of modules included in mod (including mod itself).
	def test_Module_InstanceMethods_ancestors
		assert_equal([Mod8, Comparable, Math], Mod8.ancestors)
		assert_equal([Math], Math.ancestors)
	end

	# From the page 570
	# ------------------------------------------------------------------
	# mod.autoload(name, file_name) -> nil
	# ------------------------------------------------------------------
	# Registers file_name to be loaded (using Object#require) the first
	# time that module name (which may be a String or a Symbol) is
	# accessed in the namespace of mod. Note that the autoloaded file is
	# evaluated in the top-level context.
	def test_Module_InstanceMethods_autoload
		# TODO, need add test cases.
	end

	# From the page 571
	# ------------------------------------------------------------------
	# mod.autoload?(name) -> file_name or nil
	# ------------------------------------------------------------------
	# Returns the name of the file that will be autoloaded when the
	# string or symbol name is referenced in the context of mod or returns
	# nil if there is no associated autoload.
	def test_Module_InstanceMethods_autoload?
		# TODO, need add test cases.
	end

	# From the page 571
	# ------------------------------------------------------------------
	# mod.class_eval(string<,file_name<,line_number>>) -> obj
	#                              mod.class_eval{...} -> obj
	# ------------------------------------------------------------------
	# Synonym for Module#module_eval
	def test_Module_InstanceMethods_class_eval
		# TODO, need add test cases.
		# Module#module_eval
	end

	# From the page 571
	# ------------------------------------------------------------------
	# mod.class_exec(<args>+){|args|...} -> obj
	# ------------------------------------------------------------------
	# Synonym for Module#module_exec
	def test_Module_InstanceMethods_class_exec
		# TODO, need add test cases.
		# Module#module_exec
	end

	# From the page 571
	# ------------------------------------------------------------------
	# mod.class_variable_defined?(name) -> true or false
	# ------------------------------------------------------------------
	# Returns true if the named class variable is defined in mod. The two
	# @ signs are a required part of the name.
	def test_Module_InstanceMethods_classVariableDefined
		assert_equal(true,  One9.class_variable_defined?(:@@var1) )
		assert_equal(false, One9.class_variable_defined?(:@@var2) )
	end

	# From the page 571
	# ------------------------------------------------------------------
	# mod.class_variable_get(name) -> obj
	# ------------------------------------------------------------------
	# Returns the value of the named class variable. The two @ signs
	# must appear in the name.
	def test_Module_InstanceMethods_classVariableGet
		assert_equal("wibble",  One9.class_variable_get(:@@var1) )
		assert_equal("wibble",  One9.class_variable_get("@@var1"))
	end

	# From the page 571
	# ------------------------------------------------------------------
	# mod.class_variable_set(name, value) -> value
	# ------------------------------------------------------------------
	# Sets the value of the named class variable. The two @ signs must
	# appear in the name.
	def test_Module_InstanceMethods_classVariableSet
		assert_equal(99, One9.class_variable_set(:@@var1, 99))
		assert_equal(99, One9.class_variable_get("@@var1"))
	end

	# From the page 572
	# ------------------------------------------------------------------
	# mod.class_variables -> array
	# ------------------------------------------------------------------
	# Returns an array of the names of class variables in mod. (As of
	# Ruby 1.9, class variables are no longer shared with child classes,
	# so this listing is restricted to the class variables defined in
	# mod.)
	def test_Module_InstanceMethods_classVariables
		assert_equal([:@@var1], One10.class_variables)
		# TODO, Failed? Why?
		# assert_equal([:@@var2, :@@var1], Two11.class_variables)
	end

	# From the page 572
	# ------------------------------------------------------------------
	# mod.const_defined?(symbol <search_parents=true>) -> true or false
	# ------------------------------------------------------------------
	# Returns true if a constant with the given name is defined by mod
	# or the parents of mod (if the second parameter is true).
	def test_Module_InstanceMethods_constDefined?
		assert_equal(true, (Math.const_defined? "PI"))
	end

	# From the page 572
	# ------------------------------------------------------------------
	# mod.const_get(symbol) -> obj
	# ------------------------------------------------------------------
	# Returns the value of the named constant in mod. Ruby 2.0 allows
	# this name to be qualified by one or more module names.
	def test_Module_InstanceMethods_constGet
		# TODO, need add test cases.
		# Math.const_get :PI			# -> 3.141592653589793
		# Object.const_get("Math::PI")	# -> 3.141592653589793
	end

	# From the page 572
	# ------------------------------------------------------------------
	# mod.const_missing(symbol) -> obj
	# ------------------------------------------------------------------
	# Invoked when a reference is made to an undefined constant in mod.
	# It is passed a symbol for the undefined constant and returns a
	# value to be used for that constant. The following code is very poor
	# style. If a reference is made to an undefined constant, it attempts
	# to load a file whose name is the lowercase version of the constant
	# (thus, class Fred is assumed to be in file fred.rb). If found, it
	# returns the value of the loaded class. It therefore implements a
	# perverse kind of autoload facility.
	def test_Module_InstanceMethods_constMissing
		# TODO, need add test cases.
	end

	# From the page 573
	# ------------------------------------------------------------------
	# mod.const_set(symbol, obj) -> obj
	# ------------------------------------------------------------------
	# Sets the named constant to the given object, returning that object.
	# Create a new constant if no constant with the given name previously
	# existed.
	def test_Module_InstanceMethods_constSet
		# TODO, need add test cases.
		# Math.const_set("HIGH_SCHOOL_PI", 22.0/7.0)
		# assert_equal(0.0012644892673496777, Math::HIGH_SCHOOL_PI - Math::PI)
	end

	# From the page 573
	# ------------------------------------------------------------------
	# mod.constants(include_parents = true) -> array
	# ------------------------------------------------------------------
	# Returns an array of the names of the constants accessible in mod.
	# If the parameter is true, this includes the names of constants in
	# any included modules.
	def test_Module_InstanceMethods_constants
		assert_equal('Array', IO.constants(false).class.name)
		assert_equal('Array', IO.constants(true).class.name)
		assert_equal(false, IO.constants(false).empty?)
		assert_equal(false, IO.constants(true).empty?)
	end

	# From the page 573
	# ------------------------------------------------------------------
	# mod.include?(other_mod) -> true or false
	# ------------------------------------------------------------------
	# Returns true if other_mod is included in mod or one of mod's
	# ancestors.
	def test_Module_InstanceMethods_include?
		assert_equal(true,  B12.include?(A11) )
		assert_equal(true,  C13.include?(A11) )
		assert_equal(false, A11.include?(A11) )
	end

	# From the page 573
	# ------------------------------------------------------------------
	# mod.included_modules -> array
	# ------------------------------------------------------------------
	# Returns the list of modules included in mod.
	def test_Module_InstanceMethods_includeModules
		assert_equal([], Mixin14.included_modules)
		assert_equal([Mixin14], Outer15.included_modules)
	end

	# From the page 574
	# ------------------------------------------------------------------
	# mod.instance_method(symbol) -> unbound_method
	# ------------------------------------------------------------------
	# Returns an UnboundMethod representing the given instance method
	# in mod.
	def test_Module_InstanceMethods_instanceMethod
		interpreter = Interpreter.new
		# TODO, need to complete.
		# assert_equal("Hello there, Dave!", interpreter.interpret('dave'))
	end

	# From the page 574
	# ------------------------------------------------------------------
	# mod.instance_methods(inc_super=true) -> array
	# ------------------------------------------------------------------
	# Returns an array containing the names of public and protected
	# instance methods in the receiver. For a module, these are the
	# public methods; for a class, they are the instance (not singleton)
	# methods. With no argument or with an argument that is true, the
	# methods in mod and mod's superclasses are returned. When called
	# with a module as a receiver or with a parameter that is false,
	# then instance methods in mod are returned.
	def test_Module_InstanceMethods_instanceMethods
		assert_equal([:method1], A16.instance_methods)
		assert_equal([:method2], B17.instance_methods(false) )
		assert_equal([:method3], C18.instance_methods(false) )
		assert_equal(60, C18.instance_methods(true).length )
	end

	# From the page 575
	# ------------------------------------------------------------------
	# mod.method_defined?(symbol) -> true or false
	# ------------------------------------------------------------------
	# Returns true if the named method is defined by mod (or its included
	# modules and, if mod is a class, its ancestors). Public and protected
	# methods are matched.
	def test_Module_InstanceMethods_methodDefined
		assert_equal(true,  (A18.method_defined? :method1) )
		assert_equal(true,  (C20.method_defined? "method1") )
		assert_equal(true,  (C20.method_defined? "method2") )
		assert_equal(true,  (C20.method_defined? "method3") )
		assert_equal(false, (C20.method_defined? "method4") )
	end

	# From the page 575
	# ------------------------------------------------------------------
	# mod.module_eval(string<,file_name <,line_number>>) -> obj
	#                               mod.module_eval{...} -> obj
	# ------------------------------------------------------------------
	# Evaluates the string or block in the context of mod. This can be
	# used to add methods to a class. module_eval the result of
	# evaluating its argument. The optional file_name and line_number
	# parameters set the text for error messages.
	def test_Module_InstanceMethods_moduleEval
		# Need add some test cases.
	end

	# From the page 575
	# ------------------------------------------------------------------
	# mod.module_exec(<args>+) {|args|...} -> obj
	# ------------------------------------------------------------------
	# Behaves the same as the block form for Module#module_eval, except
	# any parameters passed to the method are in turn passed to the block.
	# This gives you a way of passing in values that would otherwise not
	# be in scope in the block (because self is changed).
	def test_Module_InstanceMethods_moduleExec
		# Need add some test cases.
	end

	# From the page 576
	# ------------------------------------------------------------------
	# mod.name -> string
	# ------------------------------------------------------------------
	# Returns the name of the module mod.
	def test_Module_InstanceMethods_name
		# Need add some test cases.
	end

	# From the page 576
	# ------------------------------------------------------------------
	# mod.private_class_method(<symbol>+) -> nil
	# ------------------------------------------------------------------
	# Makes existing class methods private. Often used to hide the
	# default constructor new.
	def test_Module_InstanceMethods_privateClassMethod
		# Need add some test cases.
	end

	# From the page 576
	# ------------------------------------------------------------------
	# mod.private_constant(<symbol>+) -> mod
	# ------------------------------------------------------------------
	# Makes the given constants (which must already have been defined)
	# private to the module. A private constant cannot be referenced
	# using the module name as scope, so they effectively can only be
	# accessed within the context of the module itself.
	

end

## Test Module for test_Module_Introduction
module Mod_Introduction
	include Math
	CONST = 1
	def meth; Math::PI; end
end

## Test Module for test_Module_ClassMethods_constants
module Mixin2
	CONST_MIXIN = 1
end
class Module2
	include Mixin2
	SPURIOUS_CONSTANT = 2
end

## Test Module for test_Module_ClassMethods_nesting
# module M3
#	module M4
#		nest = Module.nesting
#		p nest
#		p nest[0].name
#		def meth4
#			"Nest4"
#		end
#	end
#	def meth3
#		"Nest3"
#	end
# end

## Test Module for test_Module_ClassMethods_new
Fred = Module.new do
	def meth_one; "hello"; end
	def meth_two; "bye"; end
end

## Test Module for test_Module_ClassMethods_HierarchyQuery
module Mixin_5; end
module Parent_6; include Mixin_5; end
module Unrelated_7; end

## Test Module for test_Module_InstanceMethods_ancestors
module Mod8
	include Math
	include Comparable
end

## Test Class for test_Module_InstanceMethods_classVariableDefined
class One9; @@var1 = "wibble"; end

## Test Class for test_Module_InstanceMethods_classVariables
class One10; @@var1=1; end
class Two11 < One10; @@var2=2; end

## Test Class and module for test_Module_InstanceMethods_include?
module A11; end
class B12; include A11; end
class C13 < B12; end;

## Test module for test_Module_InstanceMethods_includeModules
module Mixin14; end
module Outer15; include Mixin14; end

## Test class for test_Module_InstanceMethods_instanceMethod
class Interpreter
	def do_a() "there, "; end
	def do_d() "Hello "; end
	def do_e() "!\n"; end
	def do_v() "Dave"; end

    Dispatcher = {
		'a' => instance_method(:do_a),
		'd' => instance_method(:do_d),
		'e' => instance_method(:do_e),
		'v' => instance_method(:do_v)
	}

	def interpret(string)
		string.each_char {|ch| Dispatcher[ch].bind(self).call}
	end
end

## Test class and module for test_Module_InstanceMethods_instanceMethods
module A16; def method1; end; end
class B17; def method2; end; end;
class C18 < B17; def method3; end; end

## Test class and module for test_Module_InstanceMethods_methodDefined
module A18; def method1; end; end;
class B19; def method2; end; end;
class C20 < B19; include A18; def method3; end; end;
