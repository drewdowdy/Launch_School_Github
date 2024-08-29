# When the `#super` method is invoked inside a method definition, it tells Ruby to look in the class hierarchy for another method with the same name and invoke it. With no parentheses `()`, `#super` passes all arguments.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super # passes `year` to `#initialize` in `Vehicle`
    start_engine
  end
  
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994) # => Ready to go!
puts truck1.year         # => 1994
