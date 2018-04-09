require 'pieces/knight'
require 'pry'
require 'chess_helper'
include ChessHelper

describe Knight do
  subject do
    knight = Knight.new(:white)
    knight.position = [5, 3]
    knight
  end

  describe 'attributes' do
    it {is_expected.to respond_to(:name)}
    it {is_expected.to respond_to(:faction)}
    it {is_expected.to respond_to(:position)}
  end

  describe '#valid_moves' do
    context 'starting position is at [5, 3]' do
      it 'should have 8 moves' do
        moves = [[3, 2], [3, 4], [4, 1], [4, 5], [6, 1], [6, 5], [7, 2], [7, 4]]
        expect(subject.valid_moves).to match_array(moves)
      end
    end
  end

    context 'move from start position [1, 0]' do
      before do
        subject.position = [1, 0]
      end
      it 'should have 3 moves' do
        moves = [[0, 2], [2, 2], [3, 1]]
        expect(subject.valid_moves).to match_array(moves)
      end
    end

  describe '#find possible_move' do
    it 'return algebraic notation of chess board position' do
      expect_path = ["d3", "d5", "e2", "e6", "g2", "g6", "h3", "h5"]
      expect(chess_path(subject.all_paths)).to match_array(expect_path)
    end
  end

end
