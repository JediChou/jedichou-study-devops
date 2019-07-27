# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class RubyRoundingError < Test::Unit::TestCase
  def test_simple
    # God! This is rounding error
    assert_not_equal(0.1, 0.4-0.3)
  end
end
