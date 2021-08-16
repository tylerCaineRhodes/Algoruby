require_relative '../merge_overlapping_intervals'

describe 'non_constructible_change' do
  before do
    @intervals = [[1, 2], [3, 5], [4, 7], [6, 8], [9, 10]]
    @expected = [[1, 2], [3, 8], [9, 10]]
  end

  it 'should return the lowest non constructible change' do
    expect(merge_overlapping_intervals(@intervals)).to eq(@expected)
  end
end
