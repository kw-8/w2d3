require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts @board.size/4
        @board.print
    end

    def lose?
        if @remaining_misses > 0
            false
        else puts "you lose"
            true
        end
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            true
        else false
        end
    end

    def game_over?
        win? || lose? ? true : false
    end

    def turn
        @remaining_misses -= 1 if !@board.attack( @player.get_move )
        @board.print
        puts "remaining misses: "
        p @remaining_misses
    end
end
