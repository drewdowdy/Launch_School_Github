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

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" # => The person's name is: #<Person:0x00000001010a1598>
# => Interpolates the object ID information into the string.

puts "The person's name is: #{bob.name}" # fixed