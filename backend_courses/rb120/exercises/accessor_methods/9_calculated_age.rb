class Person
  def age=(age)
    @age = age * 2 # assign `@age` to the product of `2` and the input
  end

  def age
    @age * 2       # return the value of `age` multiplied by `2`
  end
end

# OR

class Person
  def age=(age)
    @age = double(age)
  end

  def age
    double(@age)
  end

  private

  def double(value) # method can be private since it's only used within the class
    value * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age # => 80
