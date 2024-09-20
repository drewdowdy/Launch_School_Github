# If we add a `#play` method to the `Bingo` class, all instances of the `Bingo` class will use the `Bingo` class's `#play` method instead of the one from the `Game` class. It essentially overrides the method inherited from the superclass.

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Start the game of bingo!"
  end
end

p Bingo.new.play
