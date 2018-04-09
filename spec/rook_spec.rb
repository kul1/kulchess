require 'pieces/rook'
require 'pry'
require 'chess_helper'
include ChessHelper

describe Rook do
  subject do
    rook = Rook.new(:white)
    #rook at c4
    rook.position = [2, 3]
    rook
  end

  describe 'attributes' do
    it {is_expected.to respond_to(:name)}
    it {is_expected.to respond_to(:faction)}
    it {is_expected.to respond_to(:position)}
  end

  describe '#find_destination_path' do
    context 'right to destination' do
      it 'return an array of path to destination' do
        expect_path = [[3, 3], [4, 3], [5, 3], [6, 3]]
        expect(subject.find_destination_path([7, 3])).to match_array(expect_path)
      end
    end

    context 'left to destination' do
      it 'return an array of path to left destination' do

        expect_path = []
        expect(subject.find_destination_path([1, 3])).to match_array(expect_path)
      end
    end

    context 'down to destination' do
      it 'return an array of path down to destination' do
        expect_path = [[2, 2], [2, 1]]
        expect(subject.find_destination_path([2, 0])).to match_array(expect_path)
      end
    end

    context 'up to destination' do
      it 'return an array of path up to destination' do
        expect_path = [[2, 4], [2, 5], [2, 6]]
        expect(subject.find_destination_path([2, 7])).to match_array(expect_path)
      end
    end

  end

  describe '#find valid_move' do
    it 'return an array of valid possible move from current position' do
      expect_path = [[0, 3], [1, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3],
                     [2, 0], [2, 1], [2, 2], [2, 4], [2, 5], [2, 6], [2, 7]]
      expect(subject.valid_moves).to match_array(expect_path)
    end
  end

  describe '#find possible_move' do
    it 'return algebraic notation of chess board position' do
      expect_path = ["a4", "b4", "d4", "e4", "f4", "g4", "h4",
                     "c1", "c2", "c3", "c5", "c6", "c7", "c8"]
      expect(chess_path(subject.all_paths)).to match_array(expect_path)
    end
  end

end
