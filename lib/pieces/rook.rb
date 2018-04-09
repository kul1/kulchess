require_relative 'piece'

# Represents a rook chess piece
class Rook < Piece
  attr_accessor :faction, :position, :name

  def initialize(faction)
    super
    @name = 'Rook'
  end

  # define unicode char for chess piece
  def to_s
    if faction == :white
      " \u2656 "
    else
      " \u265c "
    end
  end

  def character_paths
    right = right_path
    left = left_path
    up = up_path
    down = down_path
    paths = [right, left, up, down]
    paths
  end

  def all_paths
    moves = right_path + left_path + up_path + down_path
  end

  def valid_moves
    #eg: @postion [2,3]
    # move = [0,3], [1,3], [2,3], [3,3], [4,3], [5,3], [6,3], [7,3]
    #        [2,0], [2,1], 2,2], 2,3], 2,4], 2,5], 2,6], 2,7]
    moves = []
    col, row = @position
    (0..7).each do |num|
      moves << [num, row]
      moves << [col, num]
    end
    moves.delete(@position) # Current position is not valid
    moves
  end

  def valid_move?(coordinates)
    moves = valid_moves
    moves.include?(coordinates) ? true : false
  end

end
