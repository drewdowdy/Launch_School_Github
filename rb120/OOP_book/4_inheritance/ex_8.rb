class Person
  # move #hi definition here
  
  private 

  def hi
    puts 'hi'
  end
end

bob = Person.new
bob.hi

# ex_8.rb:10:in `<main>': private method `hi' called for #<Person:0x00000001024b20f0> (NoMethodError)

# We can fix this error by moving the #hi method definition above the #private method call, making it accessable in the Person class.