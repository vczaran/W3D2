require_relative "card"
require "byebug"
class Board
    
    def initialize()
        @size = 4
        @grid = Array.new(4){Array.new(4, "")}
    end

    attr_reader :grid

    def populate
        @alpha = ("a".."z").to_a
        (@size * @size / 2).times do |i|
            value = @alpha.sample
            rand_row = rand(0...@size)
            rand_col = rand(0...@size)
            rand_pos = [rand_row, rand_col]
           
            2.times do
                # if self.valid_position?(rand_pos) && 
                until self.empty_position?(rand_pos)
                    card = Card.new(value,"face_down")
                    debugger
                    @grid[rand_row][rand_col] = card
                end
            end
        end
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value
    end

    def valid_position?(pos)
        if pos[0] < 4 && pos[1] < 4
            return true
        end
        false
    end

    def empty_position?(pos)
        if [pos] == ""
            return true
        end
        false
    end

end