class Person
  attr_accessor :first_name # both getter and setter methods
  attr_writer :last_name    # only a setter method

  def first_equals_last?
    first_name == @last_name # use the class variable `@last_name` to reference the value w/out a getter method
  end
end

# OR

class Person
  attr_accessor :first_name
  attr_writer :last_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name # make the getter method private
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last? # => false