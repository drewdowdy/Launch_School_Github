class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed} please!" # `#super` with empty parentheses passes no arguments
  end
end

truck1 = Truck.new              
puts truck1.start_engine('fast') # => Ready to go! Drive fast, please!
