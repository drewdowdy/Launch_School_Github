class Person
  attr_accessor :name, :pet

  def initialize(name)
    @name = name
  end
end

class Bulldog
  def speak
    "bark!"
  end

  def fetch
    "fetching!"
  end
end

bob = Person.new("Robert")
bud = Bulldog.new

bob.pet = bud # `bud` is stored in the `@pet` variable of `bob`
puts bob.pet       # => <Bulldog:0x007fd8399eb920>
puts bob.pet.class # => Bulldog
puts bob.pet.speak # => "bark!"
puts bob.pet.fetch # => "fetching!"
