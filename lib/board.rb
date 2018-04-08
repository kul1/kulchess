Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each {|file| require file}

# Stores piece objects on a grid and renders board
class Board
  attr_accessor :grid, :turn, :move_success

  def initialize
    @turn = :white
    @grid = Array.new(8) {Array.new(8, '   ')}
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

  def generate_castle_pieces(faction)
    # castle_pieces = [
    #   Rook.new(faction), Rook.new(faction), Knight.new(faction), Bishop.new(faction),
    #   Queen.new(faction), King.new(faction), Bishop.new(faction),
    #   Knight.new(faction), Rook.new(faction)
    # ]
    castle_pieces = [Rook.new(faction)]
    castle_pieces
  end

  def generate_pawns(faction)
    pawns = []
    8.times {pawns << Pawn.new(faction)}
    pawns
  end

  def setup_faction(faction)
    castle_pieces = generate_castle_pieces(faction)
    #pawns = generate_pawns(faction)
    if faction == :white
      place_row(0, castle_pieces)
      #place_row(1, pawns)
    else
      place_row(7, castle_pieces)
      #place_row(6, pawns)
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
