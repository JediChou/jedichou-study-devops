# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class RubyHashes < Test::Unit::TestCase

  def test_create_hashes_1
    numbers = Hash.new
    assert_equal({}, numbers)
  end

  def test_create_hashes_2
    numbers = Hash.new
    numbers['one'] = 1
    numbers['two'] = 2
    assert_equal({'one'=>1, 'two'=>2}, numbers)
  end

  def test_create_hashes_3
    numbers = Hash.new
    numbers['one'] = 1
    numbers['two'] = 2
    assert_equal(3, numbers['one'] + numbers['two'])
  end

  def test_create_hashes_4
    hash_a = {'one'=>1, 'two'=>2}
    hash_b = {:one=>1, :two=>2}
    assert_equal(hash_a['one'], hash_b[:one])
    assert_equal(hash_a['two'], hash_b[:two])
  end

end