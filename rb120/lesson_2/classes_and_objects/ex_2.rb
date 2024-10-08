class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
   names = n.split
   @first_name = names.first
   @last_name = names.size > 1 ? names.last : ''
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

=begin
String#strip:
Removes any whitespaces at the beginning or end of the String calling object.
=end
