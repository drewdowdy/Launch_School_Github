module Speak
  def speak(sound)
    puts sound
  end

  def yell(sound)
    puts sound.upcase
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

  def whisper(sound)
    puts "Psst, #{sound.downcase}"
  end
end

sparky = GoodDog.new('Sparky', '13in', '20lbs')
sparky.speak("Arf!") # => Arf!
sparky.yell('Woof!')

# sparky.whisper('Bark?') 
# in `<main>': undefined method `whisper' for #<GoodDog:0x000000010069e028 @name="Sparky", @height="13in", @weight="20lbs"> (NoMethodError)

sparky.info

puts ''

bob = HumanBeing.new('Bob', '6ft 2in', '145lbs')
bob.speak('Hello!')  # => Hello!
bob.yell('Get back here!')
bob.whisper('PRETTY PLEASE?')
bob.info
puts 'Bob lost some weight!'
bob.change_info('Bob', '6ft 2in', '140lbs')
bob.info

puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
puts ''
puts "---GoodDog ancestors---"
puts GoodDog.ancestors
