class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.clone # return a copy of `@name` instead of direct reference
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name # => James
