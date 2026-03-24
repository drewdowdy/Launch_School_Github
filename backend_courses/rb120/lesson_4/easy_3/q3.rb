class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Create two instances of `AngryCat` with different names and ages

mittens = AngryCat.new(2, 'Mittens')
socks = AngryCat.new(1, 'Socks')

p mittens, socks
# => #<AngryCat:0x0000000100bc1a50 @age=2, @name="Mittens">
# => #<AngryCat:0x0000000100bc1898 @age=1, @name="Socks">
