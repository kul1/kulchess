require 'optparse'
require './lib/board'
require './lib/chess'
require './lib/chess_helper'

require 'pry'
ARGV << '-h' if ARGV.empty?

# This will hold the options we parse
options = {}

OptionParser.new do |parser|
  parser.banner = "Usage: ruby chessercise.rb [options]"

  parser.on("-h", "--help", "Help for this chessercise") do | |
    puts parser
    exit
  end
  # Whenever we see -n or --piece, with an 
  # argument, save the argument.
  parser.on("-p", "--piece PIECE", "The chess piece eg: ROOK,QUEEN, KNIGHT.") do |v|
    options[:piece] = v
  end

  parser.on("-c", "--position POSITION", "The position eg: d2") do |p|
    options[:position] = p

  end
  # This will check if user have bot options

  # unless options[:piece] && options[:position]
  #   ARGV << '-h'
  # end


end.parse!

select_position = options[:position]
select_piece = options[:piece]
select_piece&.upcase! 
available_pieces = "ROOK, QUEEN, KNIGHT"

# Setup Board, Player and pieces
# Render chess table for user input
#initialize
@board = Board.new



# Validate User Input in expected format
if piece_validate(available_pieces, select_piece) && position_validate(select_position)

  # Use data from command line input
  # Convert algebraic position to coordinate in program eg: a2 => [0,3]
  @coordinates = convert_response(select_position)
  @piececlass = options[:piece]

  # Create piece object from class eg Rook
  # piece = Rook.new(:white)
  # Call Chess Helper methods to create path
  @piece = Object.const_get(@piececlass.capitalize).new(:white)
  @piece.position = @coordinates[0]
  possible_path = chess_path(@piece.all_paths)

  # path from allpath => [[2, 3], [4, 3], [1, 0], [1, 2], [5, 0], [5, 2]]
  # chess_path return [c4, e4, b1, b3, f1, f3]
  # Display path
  # possible_path = [c4, e4, b1, b3, f1, f3]
  # possible_path.join(' ') = c4 e4 b1 b3 f1 f3

  @board.generate_selected_piece(@piece,@piece.position)
  # Out put chess mapped 
  @board.render
  puts possible_path.join(' ')


else
  # Errors at user input from validation pieces and position
  puts ""
  puts "Error: "
  puts ""
  puts 'Please enter in format piece, position eg: Rook, d2'
  puts '$ promt: ruby chessercise.rb -p Rook -c d2'
  puts 'or'
  puts '$ promt: ruby chessercise.rb --piece ROOK --position d2'
  puts 'Usage: chessercise.rb [options]'
  puts '  -h, --help                       Help for this chessercise'
  puts '  -p, --piece PIECE                The chess piece eg: ROOK,QUEEN, KNIGHT.'
  puts '  -c, --position POSITION          The position eg: d2'

end

