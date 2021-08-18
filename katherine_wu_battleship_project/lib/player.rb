class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        pos = []
        gets.chomp.split(" ").each{|n| pos << n.to_i}
        pos
    end

end
