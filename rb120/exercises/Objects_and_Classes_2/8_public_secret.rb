# Using the following code, create a class named Person with an instance variable named @secret. Use a setter method to add a value to @secret, then use a getter method to print @secret.

class Person
  def secret=(message)
    @secret = message
  end

  def secret
    @secret
  end
end

# OR

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret # => Shh.. this is a secret!
