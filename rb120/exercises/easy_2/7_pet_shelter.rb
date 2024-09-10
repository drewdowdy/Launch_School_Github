class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{@type} named #{name}"
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new{|h,k| h[k] = []}
  end

  def adopt(owner, pet)
    @adoptions[owner] << pet
    owner.add_pet(pet)
  end

  def print_adoptions
    @adoptions.each do |owner, pets_array|
      puts "#{owner.name} has adopted the following pets:"
      pets_array.each { |pet| puts pet }
      puts ''
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Kennedy
# a parakeet named Sweetie Pie
# a dog named Molly
# a fish named Chester

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# P Hanson has 3 adopted pets.
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# B Holmes has 4 adopted pets.

=begin

## Further Exploration

> Suppose the shelter has a number of not-yet-adopted pets, and wants to manage them through this same system. Thus, you should be able to add the following output to the example output shown above:

=end

puts ''
puts 'Further Exploration'
puts ''

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{@type} named #{name}"
  end
end

class Owner
  attr_reader :name

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new{|h,k| h[k] = []}
    @unadopted = []
  end

  def drop_off(pet)
    @unadopted << pet
  end

  def adopt(owner, pet)
    @adoptions[owner] << @unadopted.delete(pet)
    owner.add_pet(pet)
  end

  def print_adoptions
    puts 'The shelter has the following unadopted pets:'
    @unadopted.each { |pet| puts "- #{pet}" }
    puts ''
    @adoptions.each do |owner, pets_array|
      puts "#{owner.name} has adopted the following pets:"
      pets_array.each { |pet| puts "- #{pet}" }
      puts ''
    end
    puts "The shelter has #{@unadopted.size} unadopted pets."
  end
end

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
junebug      = Pet.new('cat', 'Junebug')
horchata     = Pet.new('cat', 'Horchata')

shelter.drop_off(butterscotch)
shelter.drop_off(pudding)
shelter.drop_off(darwin)
shelter.drop_off(kennedy)
shelter.drop_off(sweetie)
shelter.drop_off(molly)
shelter.drop_off(chester)
shelter.drop_off(asta)
shelter.drop_off(laddie)
shelter.drop_off(fluffy)
shelter.drop_off(kat)
shelter.drop_off(ben)
shelter.drop_off(chatterbox)
shelter.drop_off(bluebell)
shelter.drop_off(junebug)
shelter.drop_off(horchata)

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
# The shelter has the following unadopted pets:
# - a dog named Asta
# - a dog named Laddie
# - a cat named Fluffy
# - a cat named Kat
# - a cat named Ben
# - a parakeet named Chatterbox
# - a parakeet named Bluebell
# - a cat named Junebug
# - a cat named Horchata

# P Hanson has adopted the following pets:
# - a cat named Butterscotch
# - a cat named Pudding
# - a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# - a dog named Kennedy
# - a parakeet named Sweetie Pie
# - a dog named Molly
# - a fish named Chester

# The shelter has 9 unadopted pets.

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# P Hanson has 3 adopted pets.
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
# B Holmes has 4 adopted pets.
