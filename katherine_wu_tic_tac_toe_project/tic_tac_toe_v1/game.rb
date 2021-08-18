require_relative "board.rb"
require_relative "human_player.rb"

class Game
    attr_reader :cur
    def initialize(p1_mark, p2_mark)
        @board = Board.new
        @p1 = HumanPlayer.new(p1_mark)
        @p2 = HumanPlayer.new(p2_mark)
        @cur = @p1
    end

    def switch_turn
        @cur == @p1 ? @cur = @p2 : @cur = @p1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @cur.get_position
            @board.place_mark(pos, @cur.mark)
            if @board.win?(@cur.mark)
                @board.print
                p "victory to " + @cur.mark.to_s
                return true
            else switch_turn
            end
        end
        p "round ended in a draw"
    end

end