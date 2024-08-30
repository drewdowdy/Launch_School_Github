class Person
  attr_accessor :name

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(name)
    names = name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end
end

# OR

class Person
  attr_accessor :name

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(name)
    @first_name, @last_name = name.split.first, name.split.last 
  end
end

person1 = Person.new
person1.name = 'John Doe'
person2 = Person.new
person2.name = 'Mary Whithers Smith'
puts person1.name # => John Doe
puts person2.name # => Mary Smith

# Example of parallel assignment w/ arrays

string = 'Hey there Bob'
a, b = string.split
puts a # => Hey
puts b # => there

# when we do parallel assignment and the value is an array, the number of variables are assigned to each index from 0 until all variables are assigned to values (even if there are remaining elements in the array)

# Another Example:

a, b = [1, 2, 3]
puts a # => 1
puts b # => 2
