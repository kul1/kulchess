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
    @board.setup
  end

  def start
    @board.render

  end

end