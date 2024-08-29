class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim       # overrides `#swim` in the `Dog` superclass
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak # => "bark!"
puts teddy.swim  # => "swimming!"

karl = Bulldog.new
puts karl.speak # => "bark!"
puts karl.swim   # => "can't swim!"
