$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'roman'

class UnitTestSample < Test::Unit::TestCase
  def test_simple
    assert_equal("i", Roman.new(1).to_s)
    assert_equal("ix", Roman.new(9).to_s)
  end
end
