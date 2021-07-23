require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text = File.read('sample.txt')
    @text_object = Text.new(@text)
  end
  
  def test_swap
    @text.gsub!('a', 'e')
    assert_equal(@text, @text_object.swap('a', 'e'))
  end
  
  def teardown
    @text.gsub!('a', 'e')
    p @text
  end
  
end