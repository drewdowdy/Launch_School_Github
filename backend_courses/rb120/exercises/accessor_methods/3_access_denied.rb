class Person
  attr_reader :phone_number # change `attr_accessor` to `attr_reader`

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number # => 1234567899

person1.phone_number = 9987654321
puts person1.phone_number # => NoMethodError
