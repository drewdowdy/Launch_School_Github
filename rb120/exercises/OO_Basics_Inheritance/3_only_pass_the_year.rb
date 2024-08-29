class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type # create a getter method `#bed_type`

  def initialize(year, bed_type)
    super(year) # only pass `year` to `Vehicle`
    @bed_type = bed_type
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year     # => 1994
puts truck1.bed_type # => Short

car1 = Car.new(2005)
puts car1.year       # => 2005
