class Person
  attr_reader :name

  def name=(name)           # manually define setter method `#name=`
    @name = name.capitalize # format the input
  end

end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name # => Elizabeth
