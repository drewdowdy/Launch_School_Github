require 'minitest/autorun'
require "minitest/reporters" # colorizes results in terminal
Minitest::Reporters.use!     # colorizes results in terminal

require_relative 'car' # require the name of the file to test

class CarTest < Minitest::Test
  def test_wheels # prefix all tests with `test_` to tell Minitest to run the test
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip("Don't test bad wheels!") # `skip` skips the test it's written in; can pass custom message
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
