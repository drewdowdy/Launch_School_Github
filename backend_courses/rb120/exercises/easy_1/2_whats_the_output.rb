class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => Fluffy
puts fluffy      # => My name is FLUFFY.
puts fluffy.name # => FLUFFY
puts name        # => FLUFFY

# We should fix this code by only calling `#upcase` within the string interpolation on `line 10`.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}." #Fixed
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # => Fluffy
puts fluffy      # => My name is FLUFFY.
puts fluffy.name # => Fluffy
puts name        # => Fluffy

## Further Exploration

name = 42              
fluffy = Pet.new(name) 
name += 1              
puts fluffy.name # => 42
puts fluffy      # => My name is 42.
puts fluffy.name # => 42
puts name        # => 43

# This code words because we change the input `name` into a string when the instance of `Pet` is intansiated. Since integers are immutable, incrementing `name` by 1 does not mutate the value of the instance variable `@name`.
