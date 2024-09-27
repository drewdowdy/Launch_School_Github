class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    # super
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin

Error: 'ArgumentError', when 'super' is invoked on `line 37` it sents all the arguments to the superclass method `#initialize`. 

Fix: The `#initialize` method has 3 arguments and we only want to send 2 to the superclass. So specify which arguments to send with parenthesis ()

Further Exploration:

Q: Is the `FlightlessBird#initialize` method necessary? Why or why not?

A: It's not necessary because the superclass 'Animal' has the same exact initial method. We can DRY up the code by removing it.

=end
