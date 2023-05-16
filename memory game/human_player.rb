class HumanPlayer
    def initialize
        @name = "player"
    end

    def self.get_input
        puts "give us 2 coordinates separated by a space"
        gets.chomp
    end


end