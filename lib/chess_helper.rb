module ChessHelper

  def initialize_game
    name = "Player 1"
    name2 = "Player 2"
    game = Chess.new(Player.new(name, :white), Player.new(name2, :black))
    game.start
  end
  def cell_map(position)
    x = ('a'.ord + position[0]).chr
    y = (position[1] + 1).to_s
    cell = x + y
    cell
  end

  def chess_path(path)
    coordinates = []
    path.each do |position|
      possible_cells = cell_map(position)
      coordinates << possible_cells
    end
    coordinates
  end

  def convert_response(move)
    coordinates = []
    letters = %w[a b c d e f g h]
    move.tr('-', '').chars.each_slice(2) do |coor_pair|
      col = letters.find_index(coor_pair[0])
      row = coor_pair[1].to_i - 1
      coordinates << [col, row]
    end
    coordinates
  end

  def position_validate(position)
    if position.match(/^([a-h]+[1-8])/)
      true
    else
      false
    end
  end

  def piece_validate(pieces, piece)
    #if user not enter option piece 
    #if !piece.nil?
    unless piece.nil?
      if pieces.include?(piece)
        true
      else
        false
      end
    end
  end


end
