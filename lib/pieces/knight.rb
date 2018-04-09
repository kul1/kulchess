#knight.rb
# Represent knight pieces 
require_relative 'piece'

class Knight < Piece
  attr_accessor :faction, :position, :name

  def initialize(faction)
    super
    @name = 'Knight'
  end

  def valid_moves
    col, row = @position
    moves = []
    differentiation = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1],
                     [2, -1], [2, 1]]
    differentiation.each do |different|
      x, y = different
      new_col = col + x
      new_row = row + y
      moves << [new_col, new_row] if new_col.between?(0, 7) && new_row.between?(0, 7)
    end
    moves
  end

  def valid_move?(coordinates)
    moves = valid_moves
    moves.include?(coordinates) ? true : false
  end

  def character_paths
    moves = valid_moves
  end

  def all_paths
    moves = valid_moves
  end

  # define unicode char for chess piece
  def to_s
    if faction == :white
      " \u2658 "
    else
      " \u265e "
    end
  end

end
