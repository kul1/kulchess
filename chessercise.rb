require 'optparse'
require './lib/chess'
require './lib/chess_helper'

require 'pry'

# This will hold the options we parse
options = {}

OptionParser.new do |parser|
  parser.banner = "Usage: chessercise.rb [options]"

  parser.on("-h", "--help", "Help for this chessercise") do | |
    puts parser
  end
  # Whenever we see -n or --piece, with an 
  # argument, save the argument.
  parser.on("-p", "--piece PIECE", "The chess piece eg: ROOK,QUEEN, KNIGHT.") do |v|
    options[:piece] = v
  end

  parser.on("-c", "--position POSITION", "The position eg: d2") do |p|
    options[:position] = p

  end
end.parse!

select_position = options[:position]
select_piece = options[:piece]
select_piece.upcase!
available_pieces = "ROOK, QUEEN, KNIGHT"

#Setup Board, Player and pieces
# Render chess table for user input
initialize_game


# Validate User Input in right and range format
if piece_validate(available_pieces, select_piece) && position_validate(select_position)

# Use data from command line input
# Convert algebraic position to coordinate in program eg: a2 => [0,3]
  @coordinates = convert_response(select_position)
  @piececlass = options[:piece]

  # Create piece object from class eg Rook
  # piece = Rook.new(:white)
  # Call Chess Helper methods to create path
  piece = Object.const_get(@piececlass.capitalize).new(:white)
  piece.position = @coordinates[0]
  possible_path = chess_path(piece.all_paths)

  # Display path
  puts possible_path.join(' ')
  puts " "
  #@board.render

else
  # Errors at user input from validation pieces and position
  puts "Error: "
  puts 'Please enter in format piece, position eg: QUEEN, d2'
  puts '$ promt: ruby chessercise.rb -p Rook -c d2'
end

