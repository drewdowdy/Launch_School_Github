module Speak
  def speak(sound)
    puts sound
  end
end

module Information
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def info
    puts "#{@name} is #{@height} tall and weighs #{@weight}."
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
end

class GoodDog
  attr_accessor :name, :height, :weight
  include Speak, Information
end

class HumanBeing
  attr_accessor :name, :height, :weight
  include Speak, Information
end

sparky = GoodDog.new('Sparky', '13in', '20lbs')
sparky.speak("Arf!") # => Arf!
sparky.info
puts ''
puts "---GoodDog ancestors---"
puts GoodDog.ancestors

puts ''

bob = HumanBeing.new('Bob', '6ft 2in', '145lbs')
bob.speak('Hello!')  # => Hello!
bob.info
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors