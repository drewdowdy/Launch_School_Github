# Variable Scope

## Instance Variables

Starts with `@` and is scoped at the object level.

```ruby
@var # instance variable
```

That means that the value does **NOT** cross over between objects.

```ruby
class Person
  def initialize(n)
    @name = n
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect    # => #<Person:0x007f9c830e5f70 @name="bob">
puts joe.inspect    # => #<Person:0x007f9c830e5f20 @name="joe">

# Each Person object it's own @name
```

Within a class, an instance variable is accessible in the object's instance methods, even if it initialized outside of that method.

```ruby
class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name       # @name is accessible here
  end
end

bob = Person.new('bob')
bob.get_name    # => "bob"
```

Instance variables initialized at the class level are inaccesible. **DO NOT DO THIS!!**

```ruby
class Person
  @name = "bob"   # class level initialization

  def get_name
    @name
  end
end

bob = Person.new
bob.get_name     # => nil
```

## Class Variables

Class variables start with `@@` and are scoped at the class level.

```ruby
@@var # class variable
```

All objects share **ONE COPY** of the class variables. Class methods can access a class variable if the variable has been initialized before the method call.

```ruby
class Person
  @@total_people = 0    # initialized at the class level

  def self.total_people
    @@total_people      # accessible from class method
  end

  def initialize
    @@total_people += 1 # reassigned from instance method
  end

  def total_people
    @@total_people      # accessible from instance method
  end
end

Person.total_people   # => 0
Person.new
Person.new
Person.total_people   # => 2

bob = Person.new
bob.total_people      # => 3

joe = Person.new
joe.total_people      # => 4

Person.total_people   # => 4
```

## Constant Variables

Called 'constants' since you're not supposed to reassign them. They begin with a capital letter (usually all caps). Contants have a **lexical scope**, meaning where the constant is defined determines where it is available.

```ruby
class Car
  WHEELS = 4

  def wheels
    WHEELS
  end
end

class Motorcycle < Car
  WHEELS = 2
end

civic = Car.new
puts civic.wheels # => 4

bullet = Motorcycle.new
puts bullet.wheels # => 4 (when you expect the out to be 2)

# Since the `#wheels` invocation is from the `Car` class, the `WHEELS` contant in `Car` is used
```

However, we can **reach into** other classes and access constants. We can do this by **adding `::` to the class name**.

```ruby
class Computer
  GREETINGS = ["Beep", "Boop"]
end

class Person
  def self.greetings
    Computer::GREETINGS.join(', ')  # reaching into Computer class
  end

  def greet
    Computer::GREETINGS.sample      # reaching into Computer class
  end
end

Person.greetings # "Beep, Boop"
Person.new.greet # "Boop"
```

