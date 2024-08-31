class Wedding
  attr_reader :guests, :flowers, :songs

  def initialize
    @guests = ["Billy", "Jessica"]
    @flowers = ["lilies", "tulips"]
    @songs = ["Eye of the Tiger", "Africa"]
  end

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end

end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    puts "Preparing food for #{guests[0]} and #{guests[1]}"
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    puts "Placing the #{flowers[0]} and #{flowers[1]} on the tables"
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    puts "Queing up #{songs[0]} and #{songs[1]}"
  end
end

joe = Chef.new
bob = Decorator.new
linda = Musician.new
staff = [joe, bob, linda]
sean_and_dyani = Wedding.new
sean_and_dyani.prepare(staff)

=begin

1) `Wedding.prepare` passes array to the #prepare method in `Wedding` where `#each` is invoked on the array
2) On each iteration of `#each`, `#prepare_wedding` is invoked on each person in the array
3) Each class of the person has a `#prepare_wedding` method in their classes which invokes their own respective specific preparation method based on the class of the calling object.

This is an example of duck typing since each person is an instance of a different class but they can all be passed to the invocation of the same mathod.

=end
