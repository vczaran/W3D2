class Board
    
    def initialize()
        @size = 4
        @grid = Array.new(4){Array.new(4), ""}
    end

    def populate
        @alpha = (a..z).to_a
        (@size * @size / 2).times do |i|
            value = @alpha.rand
            rand_row = (0...@size).rand
            rand_col = (0...@size).rand
            rand_pos = [rand_row][rand_col]
            
            2.times do
                if self.valid_position(rand_pos) && self.empty_position(rand_pos)
                    card = Card.new(value,"face_down")
                    @grid[rand_pos] = card
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