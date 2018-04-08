require 'chess_helper'

describe 'user_input' do
  subject do
    user_input = 'r,d4'

  end

  describe '#validate_input' do
    context 'in format: r,d4' do
      it 'it validated' do
        user_input = 'r,d4'
        expect(subject.user_input).should == user_input
      end
    end
  end

end
