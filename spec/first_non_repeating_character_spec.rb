require_relative '../first_non_repeating_character'

describe 'first_non_repeating_character' do
  before do
    @example1 = 'abcdcaf'
  end

  it "should return the first non repeating char" do
    expect(first_non_repeating_character(@example1)).to eq(1)
  end
end