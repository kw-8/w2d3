
class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "the mark is " + @mark.to_s
        p "enter a position as two numbers separated by a space i.e. '1 2'"
        input = gets.chomp.split(" ")
        raise "invalid input" if !input.all?{|w| w.split("").all?{|c| "1234567890".include?(c)} }
        pos = input.map!{|n| n.to_i}
    end

end

# h = HumanPlayer.new(:X)
# h.get_position