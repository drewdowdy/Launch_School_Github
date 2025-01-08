require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EasyTest < Minitest::Test
  def setup
    @num = 2
  end

  def test_odd
    assert_equal(true, @num.odd?)
    assert @num.odd?, 'Number is not odd.'
  end
end
