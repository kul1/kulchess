require_relative 'piece'

# Represents a Queen chess piece
class Queen < Piece
  attr_accessor :faction, :position, :name

  def initialize(faction)
    super
    @name = 'Queen'
    @faction = faction
    @position = nil
  end

  # define chess character 
  def to_s
    if faction == :white
      " \u2655 "
    else
      " \u265b "
    end
  end

  def character_paths
    right = right_path
    left = left_path
    up = up_path
    down = down_path
    r_up = right_up_path
    l_up = left_up_path
    l_down = left_down_path
    r_down = right_down_path
    paths = [right, left, up, down, r_up, l_up, l_down, r_down]
    paths
  end

  def all_paths
    moves = right_path + left_path + up_path + down_path + right_up_path +
            left_up_path + left_down_path + right_down_path
  end

  def valid_moves
    moves = []
    moves << vert_horz_moves
    moves << diag_moves
    moves.flatten(1)
  end

  def valid_move?(coordinates)
    moves = valid_moves
    moves.include?(coordinates) ? true : false
  end

  def vert_horz_moves
    moves = []
    col, row = @position
    (0..7).each do |num|
      moves << [num, row]
      moves << [col, num]
    end
    moves.delete(@position) # Current position is not valid
    moves
  end

  def diag_moves
    moves = []
    differentiations = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
    differentiations.each do |differentiation|
      crawl_diag(differentiation, @position, moves)
    end
    moves
  end

  def crawl_diag(differentiation, position, moves)
    x, y = differentiation
    loop do
      col, row = position
      next_col = col + x
      next_row = row + y
      break unless next_col.between?(0, 7) && next_row.between?(0, 7)
      moves << [next_col, next_row]
      position = [next_col, next_row]
    end
    moves
  end

end
