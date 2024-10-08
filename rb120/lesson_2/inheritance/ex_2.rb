class Pet
  def run
    puts 'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    puts 'bark!'
  end

  def fetch
    puts 'fetching!'
  end

  def swim
    puts 'swimming!'
  end
end

class Bulldog < Dog
  def swim
    puts "can't swim!"
  end
end

class Cat < Pet
  def speak
    puts 'meow!'
  end
end

puts "=== Pet Ancestors ==="
puts Pet.ancestors
puts ''
puts "=== Dog Ancestors ==="
puts Dog.ancestors
puts ''
puts "=== Bulldog Ancestors ==="
puts Bulldog.ancestors
puts ''
puts "=== Cat Ancestors ==="
puts Cat.ancestors
puts ''

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

pete.run    # => "running!"
pete.speak  # => NoMethodError

kitty.run   # => "running!"
kitty.speak # => "meow!"
kitty.fetch # => NoMethodError

dave.speak  # => "bark!"

bud.run     # => "running!"
bud.swim    # => "can't swim!"
