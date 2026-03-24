module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

small_car = Car.new
small_car.go_fast # => I am a Car and going super fast!

=begin

When we invoke `#go_fast` on the `Car` object called `small_car`, in the body of the `#go_fast` method, the `#class` method is invoked on `self` (in this case being the `Car` object referenced by `small_car`) and the class name is interpolated into the string, which is output by the `#puts` invocation.

=end
