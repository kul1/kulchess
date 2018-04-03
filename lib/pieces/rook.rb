require_relative 'piece'

# Represents a rook chess piece
class Rook < Piece
  attr_accessor :faction, :position, :name

  def initialize(faction)
    super
    @name = 'Rook'
  end
end
