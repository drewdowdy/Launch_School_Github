class MyCar
  attr_accessor :color
  attr_reader :year

  @@miles = 32
  @@gallons = 1

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

  def spray_paint(paint)
    self.color = paint
    puts "You spraypainted the car and now it's #{paint}."
  end

  def self.milage(miles, gallons)
    puts "Your car gets #{miles / gallons} miles per gallon."
  end
end

corolla = MyCar.new(2024, 'red', 'Toyota Corolla')
MyCar.milage(32, 1)
