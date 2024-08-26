module Speak
  def speak(sound)
    puts sound
  end
end

module Name
  def initialize(name)
    @name = name
  end
end

class GoodDog
  attr_accessor :name, :height, :weight

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    puts "#{@name} is #{@height} tall and weighs #{@weight}."
  end

  include Speak, Name
end

class HumanBeing
  
  include Speak, Name
end

sparky = GoodDog.new("Sparky")
sparky.speak("Arf!") # => Arf!
puts ''
puts "---GoodDog ancestors---"
puts GoodDog.ancestors

puts ''

bob = HumanBeing.new("Bob")
bob.speak("Hello!")  # => Hello!
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors