class MyCar
  attr_accessor :color # change and view
  attr_reader :year    # only view

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

bronco = MyCar.new(2024, "gray", "Ford Bronco")

puts bronco.color      # => gray
bronco.color = "green"
puts bronco.color      # => green

puts bronco.year       # => 2024
bronco.year = 2023     # => NoMethodError since there's no setter method 
