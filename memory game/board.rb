require_relative "card"

class Board
    
    def initialize()
        @size = 4
        @grid = Array.new(4){Array.new(4, "")}
    end

    attr_reader :grid

    def populate
        @alpha = ("a".."z").to_a
      
           until self.full?
                value = @alpha.sample
                pair = 0
                while pair < 2
                    rand_row = rand(0...@size)
                    rand_col = rand(0...@size)
                    rand_pos = [rand_row, rand_col]
                    if self.empty_position?(rand_pos)
                        card = Card.new(value,"face_down")
                        @grid[rand_row][rand_col] = card
                        pair += 1
                    end
                end
            end
    end

    def render
       @grid.each do |row|
        row.each do |card|
           print card.face_value + " "
        end
        puts 
    end
    end

    def Reveal(guess)
     if @grid[guess[0]][guess[1]].face_up?
        return
     else
        @grid[guess[0]][guess[1]].reveal
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
        if @grid[pos[0]][pos[1]].is_a?(String)
            return true
        end
        false
    end

    def full?
        full = true
        @grid.each do |row|
            row.each do |ele|
                if ele.is_a?(String)
                    full = false
                end
            end
        end
        full
    end

    def won?
      @grid.all? do |row|
        row.all? { |card| card.face_up? }
      end
    end

end