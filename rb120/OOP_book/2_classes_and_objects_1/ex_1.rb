=begin
Exercise 1: Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.
=end

class MyCar
  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    puts "You got a new car! It's a #{@color} #{@year} #{@model}! Congrats!"
  end

  def accelorate(number)
    @speed += number
    puts "You push the accelorator and speed up by #{number} mph."
  end

  def break(number)
    @speed -= number
    puts "You push the break and slow down by #{number} mph."
  end

  def current_speed
    puts "You are currently driving #{@speed} mph."
  end

  def shut_off
    @speed = 0
    puts "You stop the car and park."
  end
end

accord = MyCar.new(2011, 'red', 'Honda Accord')

accord.accelorate(10)
accord.current_speed

accord.accelorate(40)
accord.current_speed

accord.break(30)
accord.current_speed

accord.break(10)
accord.current_speed

accord.shut_off
