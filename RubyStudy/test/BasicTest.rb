# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class BasicTest < Test::Unit::TestCase
  def test_foo
    assert_equal("foo", "foo")
  end

  def test_abc
    assert_equal(1, 1)
  end

  def test_bcd
    assert_equal(2, 2)
  end
end
