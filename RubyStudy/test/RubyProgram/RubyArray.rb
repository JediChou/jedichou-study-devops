$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class RubyArray < Test::Unit::TestCase
  
  def test_array_define
    assert_equal(["this", "is", "sample"], %w[this is sample])
    assert_equal(['(', ')', '-'], %w| ( ) -|)
    assert_equal(["\s", "\t"], %W(\s \t))
  end

  def test_array_initial
    assert_equal([], Array.new())
    assert_equal([nil, nil, nil], Array.new(3))
    assert_equal([0,0,0], Array.new(3, 0))

    nils = [1, 2, 3]
    assert_equal(nils, Array.new(nils))
    assert_equal(nils, Array.new(3) { |i| i+1 })
  end

  def test_array_element_use_index
    a = [0, 1, 2, 3, 4, 5, 6]
    assert(0, a[0])
    assert(6, a[-1])
    assert(5, a[-2])
    assert(6, a[a.size-1])
    assert(0, a[-a.size])
    assert_equal(nil, a[8])
    assert_equal(nil, a[-8])
  end

  def test_array_element_assign_1
    a = [1,4,16]
    a[0] = "zero"
    assert_equal(["zero",4,16], a)
  end

  def test_array_element_assign_2
    a = [1, 4, 16]
    a[-1] = 1..16
    assert_equal([1, 4, 1..16], a)
  end

  def test_array_element_assign_3
    a = [1, 4, 16]
    a[6] = 8
    assert_equal([1,4,16,nil,nil,nil,8], a)
  end

  def test_array_element_assign_4
    a = [1,2,3]
    assert_equal(nil, a[45])
  end

  def test_array_get_element_use_range
    a = ('a'..'e').to_a
    assert_equal(['a','b','c','d','e'], a)
    assert_equal([], a[0,0])
    assert_equal(['b'], a[1,1])
    assert_equal(['d', 'e'], a[-2, 2])
    assert_equal(['a', 'b', 'c'], a[0..2])
    assert_equal(['d', 'e'], a[-2..-1])
    assert_equal(['a','b','c','d','e'], a[0..-1])
  end

  def test_array_insert_element_1
    a = ('a'..'e').to_a
    a[0, 2] = ['A', 'B']
    assert_equal(['A','B', 'c','d','e'], a)
  end

  def test_array_insert_element_2
    a = ('a'..'e').to_a
    assert_equal(['c','d','e'], a[2..5])
  end

  def test_array_insert_element_3
    a = ('a'..'c').to_a
    a[0, 0] = [1, 2, 3]
    assert_equal([1,2,3,'a','b','c'], a)

    a[0..2] = []
    assert_equal(['a','b','c'], a)
  end

  def test_array_insert_element_4
    a = ('a'..'d').to_a
    a[-1, 1] = 'z'
    assert_equal(['a', 'b', 'c','z'], a)
  end

  def test_array_insert_element_5
    a = ('a'..'d').to_a
    a[-1, 1] = ['z']
    assert_equal(['a', 'b', 'c','z'], a)
  end

  def test_array_insert_element_6
    a = ('a'..'d').to_a
    a[-2, 2] = nil
    assert_equal(['a', 'b'], a)
  end

  def test_array_plus_operation_1
    a = [1,2]
    b = [3,4]
    assert_equal([1,2,3,4], a+b)
  end

  def test_array_plus_operation_2
    a = [1, 2]
    b = [[3, 4]]
    assert_equal([1,2,[3,4]], a+b)
  end

  def test_array_plus_exception
    a = [1, 2]
    b = 9
    assert_raise TypeError do
      a+b
    end
  end

  def test_array_sub_1
    a = [1,2,3,4,1]
    b = [2,3,4]
    assert_equal([1,1], a-b)
  end

  def test_array_sub_2
    a = [1,2,3,4,5]
    b = [2,4]
    assert_equal([1,3,5], a-b)
  end

  def test_array_sub_3
    a = [1,1,1,2,2,2,3,3,3]
    b = [1,2,3]
    assert_equal([], a-b)
  end

  def test_array_append_element_1
    a = [] << 1
    assert_equal([1], a)
  end

  def test_array_append_element_2
    a = [1] << 2 << 3
    assert_equal([1,2,3], a)
  end

  def test_array_append_element_3
    a = [1] << [2,3,4]
    assert_equal([1, [2,3,4]], a)
  end

  def test_array_multi
    a = [0] * 3
    assert_equal([0,0,0], a)
  end

  def test_array_logic_operation
    a = [1,1,2,2,3,3,4]
    b = [5,5,4,4,3,3,2]
    assert_equal([1,2,3,4,5], a|b)
    assert_equal([5,4,3,2,1], b|a)
    assert_equal([2,3,4], a&b)
    assert_equal([4,3,2], b&a)
  end

  def test_array_iterator
    a = ['a'] * 100
    a.each { |item| assert_equal('a', item) }
  end
  
end
