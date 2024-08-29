module Towable    # create `Towable` module with reserved word `module`
  def tow         # define method `#tow`
    puts 'I can tow a trailer!'
  end
end

class Truck
  include Towable # mix `Towable` module into `Truck` class with `include` method
end

class Car
end

truck1 = Truck.new
puts truck1.tow # => 'I can tow a trailer!'
