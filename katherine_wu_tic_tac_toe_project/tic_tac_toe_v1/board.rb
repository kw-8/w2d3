require "byebug"

class Board
    def initialize
        @grid = Array.new(3){ Array.new(3){:_} }
    end
    
    def valid?(pos)
        (0..2).include?(pos[0]) && (0..2).include?(pos[1])
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end
    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def empty?(pos)
        self[pos] == :_
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            self[pos] = mark
        else raise "not a valid move"
        end
    end

    def print
        @grid.each{|row| puts row.join(" ")}
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?{|el| el == mark} }
    end

    def win_col?(mark)
        (0..2).any?{|col_i| @grid.all?{|r| r[col_i] == mark} }
    end

    def win_diagonal?(mark)
        left  = @grid.all?{|row| (0..2).any?{|i| row[i] == mark} }
        right = @grid.all?{|row| (0..2).any?{|i| row[2-i] == mark} }
        left || right
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.count(:_) > 0
    end
end

# b = Board.new
# b.place_mark([0,0], :X)
# b.place_mark([1,1], :X)
# b.place_mark([2,2], :X)
# p b.win_diagonal?(:X)
# p b.win_diagonal?(:O)
# p b.empty_positions?
# p b.win?(:X)
# p b.win?(:O)