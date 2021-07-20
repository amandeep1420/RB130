require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

# class EqualityTest < Minitest::Test
#   def test_value_equality
#     str1 = 'hi there'
#     str2 = 'hi there'
    
#     assert_equal(str1, str2)
#     assert_same(str1, str2)
#   end
# end


class Car
  attr_accessor :wheels, :name
  
  def initialize
    @wheels = 4
  end
  
  def ==(other)
    other.is_a?(Car) && name == other.name
  end
end

class CarTest < MiniTest::Test
  def setup
    @car1 = Car.new
    @car2 = Car.new
  end
  
  def test_value_equality
    @car1.name = "Kim"
    @car2.name = "Kim"
    
    assert_equal(@car1, @car2)
  end
end