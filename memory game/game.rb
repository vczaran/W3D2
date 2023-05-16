require_relative "board"
require_relative "card"


class Game
  
    def initialize( previous_guess = [])
        @board = Board.new
        @previous_guess = previous_guess
    end


    def play
       until @board.won?
        @board.render
        guessed_pos = HumanPlayer.get_input
        make_guess(guessed_pos)
       end
        
    end

    def make_guess(pos)
       card = @board[pos[0]][pos[1]]
       debugger
        unless card.face_up?
            card.reveal
            if @previous_guess == []
                @previous_guess = card
            else
                unless card == @previous_guess
                    @previous_guess.hide
                    card.hide
                end
            end
        end
    end


end