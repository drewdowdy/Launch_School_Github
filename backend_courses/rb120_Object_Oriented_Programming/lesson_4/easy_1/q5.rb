# Which class creates an instance variable?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin

The `Pizza` class would create objects with instance variables. Instance variables always start with `@`.
We can check if the instance variables of an object by calling `#instance_variables` on an object.

=end

apple = Fruit.new('apple')
pepperoni = Pizza.new('pepperoni')

apple.instance_variables        # => []
pepperoni.instance_variables    # => [:@name]
