require_relative "board"
require_relative "card"


class Game
  
    def initialize(board, previous_guess = [])
        @board = board
        @previous_guess = previous_guess
    end


    def play
       until @game.won?
        @board.render
        
    end

end