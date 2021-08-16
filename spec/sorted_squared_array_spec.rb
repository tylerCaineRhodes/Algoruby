require_relative '../sorted_squared_array'

describe 'sorted_squared_array' do
  before do
    @example1 = [1, 2, 3, 5, 6, 8, 9]
    @example2 = [-5, -4, -3, -2, -1]
  end

  it 'should return the values sorted and squared' do
    expect(sorted_squared_array(@example1)).to eq([1, 4, 9, 25, 36, 64, 81])
    expect(sorted_squared_array(@example2)).to eq([1, 4, 9, 16, 25])
  end
end
