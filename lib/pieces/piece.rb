#pieces.rb
# Parent class for all pieces

class Piece
  #attr_accessor :faction, :position, :prev_pos, :passant, :possible_moves

  def initialize(faction)
    @faction = faction
    @position = nil
  end

  # define unicode char for selected piece
  def to_spot
    # Marker in chessercise
    # "spacing \uxxxx spacing" must equal to grid
    if faction == :white
      " \u2714 "
    else
      " \u2606 "
    end
  end

  def find_destination_path(destination)
    # This is path of possible destination regardless how it move
    # it can move straight or L shape to this destination
    #
    #  find_path possible path from current position
    #	   depend on type of piece[RNBKQorP] can move up down left right
    #  get only move_path that reach destination

    #For test paths
    # expect_path = [[3,3],[4,3],[5,3],[6,3]]
    # character_paths = expect_path

    paths = character_paths
    paths.each do |path|
      if path.include?(destination)
        dest_idx = path.find_index(destination)
        return path.slice(0...dest_idx)
      end
    end
  end

  def left_path
    col, row = @position
    path = valid_moves.select {|move| move[0] < col && move[1] == row}
    path.reverse
  end

  def right_path
    col, row = @position
    path = valid_moves.select {|move| move[0] > col && move[1] == row}
    path
  end

  def up_path
    col, row = @position
    path = valid_moves.select {|move| move[0] == col && move[1] > row}
    path
  end

  def down_path
    col, row = @position
    path = valid_moves.select {|move| move[0] == col && move[1] < row}
    path.reverse
  end

  def left_up_path
    col, row = @position
    path = valid_moves.select {|move| move[0] < col && move[1] > row}
    path
  end

  def right_up_path
    col, row = @position
    path = valid_moves.select {|move| move[0] > col && move[1] > row}
    path
  end

  def left_down_path
    col, row = @position
    path = valid_moves.select {|move| move[0] < col && move[1] < row}
    path
  end

  def right_down_path
    col, row = @position
    path = valid_moves.select {|move| move[0] > col && move[1] < row}
    path
  end

end
