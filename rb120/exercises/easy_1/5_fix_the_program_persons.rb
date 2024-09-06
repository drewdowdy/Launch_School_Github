# We can fix this code by manually defining the getter methods `#first_name=` and `#last_name=` so that we can also capitalize the names when they are set.

class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def first_name=(name) # add a setter method that capitalizes the first name
    @first_name = name.capitalize
  end

  def last_name=(name) # add a setter method that capitalizes the last name
    @last_name = name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person # => John Doe

person.first_name = 'jane'
person.last_name = 'smith'
puts person # => Jane Smith
