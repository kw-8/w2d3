require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all?{|el| POSSIBLE_PEGS.has_key?(el.upcase)}
  end

  def initialize(peg_arr)
    if self.class.valid_pegs?(peg_arr)
      @pegs = peg_arr
      @pegs.map!{|peg| peg.upcase}
    else raise "this is not an array of valid pegs"
    end
  end

  def self.random(num)
    arr = (1..num).map {|i| POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  '''
  PART 2
  '''

  def num_exact_matches(code_guess)
    code_guess.pegs.select.with_index{|ch, i| ch == @pegs[i] }.count
  end

  def num_near_matches(code_guess)
    code_guess.pegs.select.with_index{|ch, i| @pegs.include?(ch) && ch != @pegs[i] }.count
  end

  def  ==(other_code)
    @pegs == other_code.pegs
  end
end
