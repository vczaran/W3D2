require_relative "board"
require_relative "card"
require_relative "human_player"

require "byebug"
class Game
  
    def initialize( previous_guess = [])
        @game_board = Board.new
        @previous_guess = previous_guess
    end

    attr_reader :board

    def play
       @game_board.populate
       until @game_board.won?
        @game_board.render
        guessed_pos = HumanPlayer.get_input
        make_guess(guessed_pos)
       end
        
    end

    def make_guess(pos)
       card = @game_board[pos[0]][pos[1]]
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