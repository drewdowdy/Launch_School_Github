class Person
  attr_accessor :name
  attr_writer :phone_number
end

# OR

class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def phone_number=(phone_number)
    @phone_number = phone_number
  end
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name         # => Jessica
puts person1.phone_number # => NoMethodError
