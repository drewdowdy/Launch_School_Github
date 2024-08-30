class Wedding
  attr_reader :guests, :flowers, :songs

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
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end

george = Chef.new
linda = Decorator.new
stacy = Musician.new

Wedding.prepare([george, linda, stacy]) 

=begin

1) `Wedding.prepare` passes array to the #prepare method in `Wedding` where `#each` is invoked on the array
2) On each iteration of `#each`, `#prepare_wedding` is invoked on each person in the array
3) Each class of the person has a `#prepare_wedding` method in their classes which invokes their own respective specific preparation method based on the class of the calling object.

This is an example of polymorphic code since each of the people `george`, `linda`, and `stacy` are instances of different classes, but can all be passed to an invocation of #prepare and have their own independent outcomes.

=end
