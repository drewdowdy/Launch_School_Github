class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle; end # `Tuck` inherits from `Vehicle`

class Car < Vehicle; end   # `Car` inherits from `Vehicle`

truck1 = Truck.new(1994)
puts truck1.year # => 1994

car1 = Car.new(2006)
puts car1.year   # => 2006
