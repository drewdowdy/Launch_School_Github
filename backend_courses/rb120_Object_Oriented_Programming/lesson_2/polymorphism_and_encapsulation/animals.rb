class Animal
  def move
  end
end

class Fish < Animal
  def move
    puts "swim"
  end
end

class Cat < Animal
  def move
    puts "walk"
  end
end

# Sponges and Corals don't have a separate move method - they don't move
class Sponge < Animal; end
class Coral < Animal; end

animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
animals.each { |animal| animal.move }

# This code is an example of polymorphism thorugh inheritance.
# Each class inherits `#move` from the `Animal` class so instances of different classes can use the same method `#move`.
# However, 'Fish' and `Cat` override the `#move` from the `Animal` class with their own `#move` methods.
