require_relative 'board'
require_relative 'player'

require 'pp'
require './lib/chess_helper'
include ChessHelper
class Chess

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = Board.new
    # To setup all start up piece on chess board
    # Un-comment line below
    @board.setup
  end

  def start
    @board.render

  end

end