class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_name(name)
  end

  def name=(name)
    parse_name(name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  private 

  def parse_name(name)
    names = name.split
    @first_name = names.first
    @last_name = names.size > 1 ? names.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob == rob # => false
# This returns false because 'bob' and 'rob' are two different objects of the Person class.

puts bob.name == rob.name # => true
# This returns true becasue the string values of the names of 'bob' and 'rob' are the same value.
# Ruby ultimately treats some core library objects differently than others.
