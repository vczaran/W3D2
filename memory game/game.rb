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
        row = pos[0]
        col = pos[1]
        card = @game_board.grid[row][col]
        unless card.face_up?
            card.reveal
            puts "your card is #{card.face_value}"
            if @previous_guess == []
                @previous_guess = card
            else
                unless card == @previous_guess
                    @previous_guess.hide
                    card.hide
                end
                @previous_guess = []
            end
        end
    end


end