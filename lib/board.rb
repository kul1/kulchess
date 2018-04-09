Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each {|file| require file}
require 'pry'

# Stores piece objects on a grid and renders board
class Board
  attr_accessor :grid, :turn, :move_success

  def initialize
    @turn = :white
    #@grid = Array.new(8) {Array.new(8, '   ')}
    @grid = Array.new(8) {Array.new(8, "   ")}

    #@grid = Array.new(10) {Array.new(10, '   ')}
    
    @dead_pieces = []
  end

  def setup
    setup_faction(:white)
    setup_faction(:black)
  end


  def render

    puts %q{
------------------------------   
|   a  b  c  d  e  f  g  h   |}

    7.downto(0) do |i|
      print "|#{i + 1} "

      grid[i].each_with_index do |cell, cell_idx|

        if i.even? && cell_idx.even?
          print colorize(cell, "30;42")
        elsif i.odd? && cell_idx.odd?
          print colorize(cell, "30;42")
        else
          print colorize(cell, "30;47")
        end

      end

      puts " #{i + 1}|"
    end

    puts %q{|   a  b  c  d  e  f  g  h   |
------------------------------}
  end

  def generate_selected_piece(piece,position)  
    # To generate data for render in chessercise
    d_col, d_row = position
    @grid[d_row][d_col] = piece
    @grid

    # map all path with grid
    piece.all_paths.each do | d_col, d_row|
      @grid[d_row][d_col] = piece.to_spot 
    end

  end

  def generate_castle_pieces(faction)
    # work on progress
    # generated for game
    # castle_pieces = [
    #   Rook.new(faction), Rook.new(faction), Knight.new(faction), Bishop.new(faction),
    #   Queen.new(faction), King.new(faction), Bishop.new(faction),
    #   Knight.new(faction), Rook.new(faction)
    # ]

    # generated for chessercise only
    # disable below for fully support game
    castle_pieces = [Rook.new(faction), Queen.new(faction)]
    castle_pieces
  end

  def generate_pawns(faction)
    pawns = []
    8.times {pawns << Pawn.new(faction)}
    pawns
  end

  def setup_faction(faction)
    # work on progress
    castle_pieces = generate_castle_pieces(faction)
    # pawns = generate_pawns(faction)
    if faction == :white
    #  place_row(0, castle_pieces)
    #  place_row(1, pawns)
    else
    #  place_row(7, castle_pieces)
    #  place_row(6, pawns)
    end
  end

  def place_row(row, pieces)
    pieces.each_with_index do |piece, col|
      piece.position = [col, row]
      @grid[col][row] = piece
    end
  end


  private
  # Detail about colorize from   
  # https://stackoverflow.com/questions/1489183/colorized-ruby-output
  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

end
