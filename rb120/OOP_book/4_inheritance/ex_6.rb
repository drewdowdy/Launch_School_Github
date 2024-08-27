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
  include Moveable
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

  def age # a method that calls a private method to determine age of vehicle
    puts "Your #{self.model} is #{determine_age} years old."
  end

  private

  def determine_age
    Time.now.year - self.year.to_i
  end

end

class MyCar < Vehicle
  PASSENGER_NUM = 5
  
  def to_s
    "The car is a #{self.color} #{self.year} #{self.model}."
  end
end

class MyTruck < Vehicle
  BED_SIZE = 61.5
  include Towable

  def to_s
    "The truck is a #{self.color} #{self.year} #{self.model}."
  end
end

car = MyCar.new(2022, 'dark green', 'Volkwagon Passat')
truck = MyTruck.new(2024, 'gray', 'Dodge Ram')

car.age
truck.age
