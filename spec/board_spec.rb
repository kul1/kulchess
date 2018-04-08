#board_spec.rb
require 'board'
require 'chess_helper'

include ChessHelper

Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each {|file| require file}


describe Board do
  before(:all) do
    @board = Board.new
  end

  describe 'attribute' do
    it {is_expected.to respond_to(:grid)}
    it {is_expected.to respond_to(:turn)}
  end

  describe '#grid' do
    grid = [['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   '],
            ['   ', '   ', '   ', '   ', '   ', '   ', '   ', '   ']]

    context 'newly initialized board' do
      it 'should return an array with 8 nested arrays with spaces' do
        expect(subject.grid).to match_array(grid)
      end
    end

    it 'returns array' do
      expect(@board.grid.class).to eq(Array)
    end
    it 'has 64 cells' do
      expect(@board.grid.size * @board.grid[0].size).to eq(64)
    end
    context 'Rook(or any piece) at position 1,1' do
      rook = Rook.new(:white)
      rook.position = [1, 1]

      before do
        subject.grid[1][1] = rook
      end

      it 'should return array with piece object in first array at index 1' do
        expect(subject.grid[1][1]).to equal(rook)
      end

      it 'should not return array with piece object in 3rd array at index 3' do
        expect(subject.grid[1][3]).not_to equal(rook)
      end

      it 'should return algebraic notation of chess board position [1,1 as b2' do
        # expect(subject.cell_map(rook.position)).to eq('b2')
        expect(cell_map(rook.position)).to eq('b2')
      end
    end

  end

  describe 'render' do
    it 'prints board to console' do
      expect(@board.render).to eq(nil)
    end
  end


end