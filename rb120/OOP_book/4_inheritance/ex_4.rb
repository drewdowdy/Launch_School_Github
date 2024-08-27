module Moveable
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

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  include Moveable # Moveable module is mixed into the Vehicle class

  @@total_vehicles = 0

  def self.milage(miles, gallons)
    puts "Your car gets #{miles / gallons} miles per gallon."
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
    puts "You got a new vehicle! It's a #{@color} #{@year} #{@model}! Congrats!"
    @@total_vehicles += 1
  end

  def spray_paint(paint)
    self.color = paint
    puts "You spraypainted the car and now it's #{paint}."
  end

  def self.total_vehicles
    puts "There are currently #{@@total_vehicles} vehicles in this program."
  end
end

class MyCar < Vehicle
  PASSENGER_NUM = 5
  
  def to_s
    "The car is a #{color} #{year} #{model}."
  end
end

class MyTruck < Vehicle
  BED_SIZE = 61.5

  include Towable # The Towable module is mixed into the MyTruck class

  def to_s
    "The truck is a #{color} #{year} #{model}."
  end
end

puts "=== MyCar Method Lookup ==="
puts MyCar.ancestors 
# prints the method lookup path for MyCar class
puts ''
puts "=== MyTruck Method Lookup ==="
puts MyTruck.ancestors 
# prints the method lookup path for MyTruck class
