require_relative '../non_constructible_change'

describe 'non_constructible_change' do
  before do
    @example1 = [1, 2, 5]
    @example2 = [5, 7, 1, 1, 2, 3, 22]
  end

  it 'should return the lowest non constructible change' do
    expect(non_constructible_change(@example1)).to eq(4)
    expect(non_constructible_change(@example2)).to eq(20)
  end
end
