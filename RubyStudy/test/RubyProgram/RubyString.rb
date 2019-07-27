$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class RubyString < Test::Unit::TestCase
  def test_simple_string
   assert_equal("Hello", 'Hello')
   assert_equal("Hello world", 'Hello world')
  end

  def test_create_str
    assert_equal("Hello", String.new("Hello"))
  end

  def test_character_literals
    assert_equal(65, ?A)
    assert_equal(66, ?B)
    assert_equal(34, ?")
    assert_equal(63, ??)
  end

  def test_character_literals_unicode
    # TODO: the feature is for ruby 1.9.x
    # assert_equal(\u20AC, ??)
  end

  def test_string_plus
    assert_equal("HelloWorld", "Hello"+"World")
    assert_equal("aaa", "a"*3)
    assert_equal("1 1 1 ", "1 "*3)
    assert_equal("Hello World", "Hello"<<" "<<"World")
  end

  def test_access_string
    str = 'Hello'
    assert_equal(72, str[0])
    assert_equal(111, str[str.length-1])
    assert_equal(111, str[-1])
    assert_equal(108, str[-2])
    assert_equal(72, str[-str.length])
    assert_equal(nil, str[str.length])
  end

  def test_use_character_literal
    str = 'hello'
    str[0] = ?H
    assert_equal('Hello', str)

    str[-1] = ?O
    assert_equal('HellO', str)
  end

  def test_delete_str_element
    str = 'hello'; str[-1] = ""
    assert_equal('hell', str)

    str[-1] = 'p!'
    assert_equal('help!', str)
  end

  def test_str_split
    str = 'hello'
    assert_equal('h', str[0,1])
    assert_equal('o', str[-1, 1])
    assert_equal('', str[0, 0])
    assert_equal('hello', str[0, 10])
    assert_equal('', str[str.length, 1])
    assert_equal(nil, str[str.length+1, 1])
    assert_equal(nil, str[0, -1])
  end

  def test_str_insert_operation
    str = 'hello'; str[0, 1] = 'H'
    assert_equal('Hello', str)

    str[str.length, 0] = " World!"
    assert_equal('Hello World!', str)

    str[5, 0] = ','
    assert_equal('Hello, World!', str)

    # TODO: str[5, 6] = ""
    # assert_equal('Hello World!', str)
  end

  def test_str_insert_use_range
    str = 'hello'
    assert_equal('ll', str[2..3])
    assert_equal('llo', str[-3..-1])
    assert_equal('h', str[0..0])
    assert_equal('', str[0...0])
    assert_equal('', str[2..1])
    assert_equal(nil, str[7..10])
    assert_equal('lo', str[-2..-1])

    str[0...0] = 'Please '
    assert_equal('Please hello', str)

    str[0...7] = ''
    assert_equal('hello', str)
  end

  def test_str_replace_use_while
    str = 'hello'
    while(str["h"])
      str["h"] = "H"
    end
    assert_equal('Hello', str)
  end

  def test_compare_string_element
    str = 'aaaaa'
    0.upto(str.size-1) { |i|
      assert_equal('a', str[i..i])
    }
  end

  def test_str_property
    str = "1234567890"
    assert_equal(10, str.length)
    assert_equal(10, str.size)
    assert_equal(10, str.bytesize)
  end

  def test_encoding
    # TODO: need test string encode model
  end
end
