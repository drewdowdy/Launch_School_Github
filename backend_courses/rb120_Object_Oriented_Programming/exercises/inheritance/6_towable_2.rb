module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle           # create `Vehicle` class
  attr_reader :year     # create getter method `#year`

  def initialize(year)  # define method `#initialize`
    @year = year        # assign instance variable `@year` to `year`
  end
end

class Truck < Vehicle   # `Truck` inherits from `Vehicle`
  include Towable
end

class Car < Vehicle     # `Car` inherits from `Vehicle`
end

truck1 = Truck.new(1994)
puts truck1.year        # => 1994
puts truck1.tow         # => I can tow a trailer!

car1 = Car.new(2006)
puts car1.year          # => 2006
