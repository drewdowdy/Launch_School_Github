class Person
  attr_writer :name

  def name        # manually define getter method `#name`
   "Mr. #{@name}" # format the output
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name # => Mr. James
