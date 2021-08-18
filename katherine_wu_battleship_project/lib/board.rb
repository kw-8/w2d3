class Board
  def initialize(n)
    @grid = Array.new(n){ Array.new(n){:N} }
    @size = n
  end
end
