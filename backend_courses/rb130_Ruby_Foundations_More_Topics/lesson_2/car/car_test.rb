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

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")   # this code raises ArgumentError, so this assertion passes
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car 
    car = Car.new
    arr = [1, 2, 3]
    arr << car
  
    assert_includes(arr, car) # `assert_includes` invokes `assert` twice behind the scenes (+2 assertions)
  end
end
