require 'minitest/autorun'

require_relative '../lib/fizzix/vector'

describe Fizzix do
  it "should correctly add two vectors" do
    v1 = Fizzix::Vector.new(3, 5)
    v2 = Fizzix::Vector.new(-1, 4)
    
    res = v1 + v2
    res.x.must_equal 2
    res.y.must_equal 9
  end

  it "should correctly subtract two vectors" do
    v1 = Fizzix::Vector.new(-2, 2)
    v2 = Fizzix::Vector.new(-1, 4)
    
    res = v1 - v2
    res.x.must_equal -1
    res.y.must_equal -2
  end

  it "should correctly multiply two vectors" do
    v1 = Fizzix::Vector.new(1, 2)
    v2 = Fizzix::Vector.new(-3, 2)
    
    res = v1 * v2
    res.x.must_equal -3
    res.y.must_equal 4
  end

  it "should correctly divide two vectors" do
    v1 = Fizzix::Vector.new(-2, 2)
    v2 = Fizzix::Vector.new(-1, 4)
    
    res = v1 / v2
    res.x.must_equal 2
    res.y.must_equal 0.5
  end

  it "should be able to scale a vector" do
    v1 = Fizzix::Vector.new(5, -2)

    res = v1.scale(5)
    res.x.must_equal 25
    res.y.must_equal -10
  end

  it "should be able to determine the length of a vector" do
    v1 = Fizzix::Vector.new(3, 4)

    v1.length.must_be_close_to 5.0
  end
end
