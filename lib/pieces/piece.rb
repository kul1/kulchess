#pieces.rb
# Parent class for all pieces

class Piece
	#attr_accessor :faction, :position, :prev_pos, :passant, :possible_moves

	def initialize(faction)
		@faction = faction
		@position = nil
	end
	
	def valid_move
		return []
	end

	def character_paths
		return []
	end
		

	def find_destination_path(destination)
		# This is path of possible destination regardless how it move
		# it can move straight or L shape to this destination
		#
		#  find_path possible path from current position
		#	   depend on type of piece[RNBKQorP] can move up down left right
		#  get only move_path that reach destination
		character_paths = []		

	  #For test paths
		expect_path = [[3,3],[4,3],[5,3],[6,3]]
		character_paths = expect_path

    paths = character_paths
    paths.each do |path|
    	if path.include?(destination) 
    		dest_idx = path.find_index(destination)
    		return path.slice(0...dest_idx)
    	end
    end
	end


end
