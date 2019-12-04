require "test/unit"

class Test_Ch010102 < Test::Unit::TestCase

  # use n.times and n.upto(num)
  def test_BlocksAndIterators_1
    a = 3; 3.times {a += 1}
    assert_equal(6, a)
    b = 3; 1.upto(3) { b += 1}
    assert_equal(6, b)
  end

  # use iterator
  def test_BlocksAndIterators_2
    a = [1, 2, 3]
    a[3] = a[2] + 1
    a.each do |elt|
      assert_equal(a.index(elt)+1, elt)
    end
  end

  # use iterator with Array
  def test_BlocksAndIterators_3
    a = [1,2,3,4] ; sum = 0
    b = a.map {|x| x*x}
    c = a.select {|x| x%2==0}

    a.inject do |sum, x|
      sum += x
    end
    assert_equal([1,4,9,16], b, "use object.map with iterator")
    assert_equal([2,4], c, "use object.select with iterator")
    assert_equal(10, sum, "use object.inject with iterator")
  end

  # use iterator with Hash
  def test_BlocksAndIterators_4
    h = {:one=>1, :two=>2}
    assert_equal(1, h[:one])
    assert_equal(2, h[:two])
    h[:three]=3
    assert_equal(3, h[:three])
    assert_equal(3, h.length)
  end

end