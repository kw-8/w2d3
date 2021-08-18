require_relative "board.rb"
require_relative "human_player.rb"

class Game
    attr_reader :cur
    def initialize(num, *marks)
        @board = Board.new(num)
        @round_robin = marks.map{|m| HumanPlayer.new(m)}
        @cur = @round_robin[0]
        # @cur = @p1
    end

    def switch_turn
        # @cur == @p1 ? @cur = @p2 : @cur = @p1
        @cur = @round_robin.rotate![0]
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

g = Game.new(5, :X, :O)
g.play