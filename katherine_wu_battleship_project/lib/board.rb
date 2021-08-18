require "byebug"

class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n){ Array.new(n){:N} }
        @size = n*n
    end
    
    def [](pos)
        i, j = pos[0], pos[1]
        @grid[i][j]
    end

    def []=(pos, val)
        i, j = pos[0], pos[1]
        @grid[i][j] = val
    end

    def num_ships
        @grid.flatten.select{|el| el == :S}.count
    end

    '''
    PART 2
    '''

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        positions = 0
        n = @grid.length-1
        while @grid.flatten.count(:S) < @size/4
            pos = [rand(n), rand(n)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        hidden = @grid.map{ |row| row.map{|el| el == :S ? el = :N : el} }
    end

    def self.print_grid(arr)
        arr.each{ |row| puts row.join(" ") }
    end

    def cheat
        self.class.print_grid(@grid)
    end

    def print
        self.class.print_grid(hidden_ships_grid)
    end
end
