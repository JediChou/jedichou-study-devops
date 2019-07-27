# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'

class RubyRange < Test::Unit::TestCase

  def test_range_create
    a = 1..10
    b = 1.0..10.0
    assert_equal(1..10, a)
    assert_equal(1.0..10.0, b)
  end

  def test_range_include_1
    becky_years = 1981..1990
    jedi_years = 1971..1980
    assert(becky_years.include?(1983))
    assert(jedi_years.include?(1978))
  end

  def test_range_include_2
    r = 0..100
    assert(r.member?(50))
    assert(r.include?(100))
    assert(r.include?(99.9))
  end

  def test_range_include_3
    triples = "AAA".."ZZZ"
    assert(triples.include?("ABC"))
    assert(triples.include?("ABCD"))
    assert(!triples.to_a.include?("ABCD"))
  end

end
