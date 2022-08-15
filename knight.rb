class Knight
  attr_accessor :pos

  def initialize(pos = [0, 0])
    @pos = pos
  end

  def moves
    vertical_moves + horizontal_moves
  end

  private

  def vertical_moves
    moves = []
    moves << [pos[0] + 1, pos[1] + 2] << [pos[0] - 1, pos[1] + 2]
    moves << [pos[0] + 1, pos[1] - 2] << [pos[0] - 1, pos[1] - 2]
  end

  def horizontal_moves
    moves = []
    moves << [pos[0] + 2, pos[1] + 1] << [pos[0] + 2, pos[1] - 1]
    moves << [pos[0] - 2, pos[1] + 1] << [pos[0] - 2, pos[1] - 1]
  end
end