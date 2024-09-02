class Duck
  def quack
    puts "Quack!"
  end

  def feathers
    puts "The duck has white and gray feathers."
  end
end

class Person
  def quack
    puts "The person imitates a duck."
  end

  def feathers
    puts "The person picks up a feather and shows it."
  end

  def name
    puts "John Smith"
  end
end

def in_the_forrest(duck)
  # These methods are duck typing because we don't have to specify which class's #quack or #feathers method we are referring to. Ruby understands that if we call #quack on an object with the ability to use a #quack method, then Ruby can invoke the method.
  duck.quack 
  duck.feathers 
end

donald = Duck.new
john = Person.new

[john, donald].each { |duck| in_the_forrest(duck) }
# => The person imitates a duck.
# => The person picks up a feather and shows it.
# => Quack!
# => The duck has white and gray feathers.

[john, donald].each { |duck| duck.name }
# => John Smith    (the `Person` class has a `#name` method)
# => NoMethodError (however, the `Duck` class does not have a `#name` method)
