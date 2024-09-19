module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed     # mix in the module

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck         # mix in the module
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast     # => I am a Car and going super fast!
Truck.new.go_fast   # => I am a Truck and going super fast!
