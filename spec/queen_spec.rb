require 'pieces/queen'
require 'pry'
require 'chess_helper'
include ChessHelper

describe Queen do
  subject do
    queen = Queen.new(:white)
    # queen at e4
    queen.position = [4, 3]
    queen
  end

  describe 'attributes' do
    it {is_expected.to respond_to(:name)}
    it {is_expected.to respond_to(:faction)}
    it {is_expected.to respond_to(:position)}
  end

  describe '#find_destination_path' do
    context 'right to destination' do
      it 'return an array of path to right destination' do
        expect_path = [[5, 3], [6, 3]]
        expect(subject.find_destination_path([7, 3])).to match_array(expect_path)
      end
    end
  
    context 'left to destination' do
      it 'return an array of path to left destination' do
        expect_path = [[2, 3], [3, 3]]
        expect(subject.find_destination_path([1, 3])).to match_array(expect_path)
      end
    end
  end

    context 'down to destination' do
      it 'return an array of path down to destination' do
        expect_path = [[4, 1], [4, 2]]
        expect(subject.find_destination_path([4, 0])).to match_array(expect_path)
      end
    end

    context 'up to destination' do
      it 'return an array of path up to destination' do
        expect_path = [[4, 4], [4, 5], [4, 6]]
        expect(subject.find_destination_path([4,7])).to match_array(expect_path)
      end
    end

    context 'up right to destination' do
      it 'return an array of path up right to destination' do
        expect_path = [[5, 4], [6, 5]]
        expect(subject.find_destination_path([7,6])).to match_array(expect_path)
      end
    end

    context 'up left to destination' do
      it 'return an array of path up left to destination' do
        expect_path = [[3, 4], [2, 5], [1, 6]]
        expect(subject.find_destination_path([0, 7])).to match_array(expect_path)
      end
    end

    context 'down right to destination' do
      it 'return an array of path down right to destination' do
        expect_path = [[5, 2], [6, 1]]
        expect(subject.find_destination_path([7, 0])).to match_array(expect_path)
      end
    end

    context 'down left to destination' do
      it 'return an array of path down left to destination' do
        expect_path = [[3, 2], [2, 1]]
        expect(subject.find_destination_path([1, 0])).to match_array(expect_path)
      end
    end

  describe '#find possible_move' do
    it 'return algebraic notation of chess board position' do
        expect_path = ["a4", "a8", "b1", "b4", "b7", "c2", "c4",
                       "c6", "d3", "d4", "d5", "e1", "e2", "e3", 
                       "e5", "e6", "e7", "e8", "f3", "f4", "f5", 
                       "g2", "g4", "g6", "h1", "h4", "h7"]
      expect(chess_path(subject.all_paths)).to match_array(expect_path)
    end
  end

end
