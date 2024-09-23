=begin

1. Write a description of the problem and extract major nouns and verbs.
2. Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
3. Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

spike - exploratory code to play with the problem
CRC - Class Reponsibility Collaborator

1. 

Steps of TTT Gameplay

1. Decide who chooses first.
2. Blank board is displayed.
3. Player 1 chooses a spot on the board.
4. Determine if there's a winner OR if the board is full.
5. Updated board is displayed.
6. Player 2 chooses a spot on the board.
7. Determine if there's a winner OR if the board is full.
8. Repeat steps 3-7 until there's a winner or board is full.
9. Display the winner.
10. Ask player if they'd like to play again.

2. 
Nouns: board, player, spot, winner, move
Verbs: choose, display, determine, play

Spike:
=end

class Player
  def choose
    # choose a spot on the board
    # number the spots 1-9
  end
end

module Displayable
  def display
    # display the current board state
  end
  
  def update
    # update the board state
  end
end

class Board
  include Displayable

  def initialize
    # create 3x3 grid (an array of pipes and underscores?)
    # has a collection of squares that are marked/unmarked
  end
end

class Square
  def initialize
    # represents each spot on the board
    # has a status of marked / unmarked by X or O
    # has a position on the board
  end
end

class TTTGame
  def initialize
    # create player 1
    # create player 2
    # create a blank board
  end

  def display_welcome_message
    # welcome message
  end

  def whos_first
    # determine who goes first
  end
  
  def someone_won?
    # determine who has 3 in a row
  end

  def board_full
    # check if all the spots on the board are full
  end
  
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end
