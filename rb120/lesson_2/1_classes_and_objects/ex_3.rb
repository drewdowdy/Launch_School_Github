class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    @first_name = name.split.first
    @last_name = name.split.size > 1 ? name.split.last : ''
  end

  def name=(name)
    # use 'self' to indicate a setter method
    self.first_name = name.split.first
    self.last_name = name.split.size > 1 ? name.split.last : ''
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

puts ''
bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
