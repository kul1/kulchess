#chessercise_spec.
require 'pry'
require 'board'
require 'chess_helper'
include ChessHelper
Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each {|file| require file}

describe Board do
  describe 'render' do

  	context 'blank board ' do
  		it 'should render board' do
  			@board = Board.new
      	expect(@board.render).to eq(nil)
    	end
  	end

  	context 'board with selected piece' do
  		it 'shown piece in position ' do
  		  select_piece = "KNIGHT"
    		select_position = "d2"
    		@piece = Knight.new(:white)
    		@piece.position = [3,1]
    		@board = Board.new
    		@board.generate_selected_piece(@piece,@piece.position)
    		expect(@board.render).to eq(nil)
  		end  			
  	end

  end
end