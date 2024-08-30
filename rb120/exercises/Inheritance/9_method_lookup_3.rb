module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color
puts bird1.class.ancestors.join(' >> ')
# method lookup path for `#color` invoked on `bird1`:
# Bird >> Flyable >> Animal

# Modules included in a class are checked before their parent class. If there are multiple modules, the modules are checked in ascending order (last one mixed in is checked first).
