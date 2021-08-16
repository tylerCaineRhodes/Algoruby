require_relative '../minimum_waiting_time'

describe 'minimum_waiting_time(#1)' do
  before do
    @queries = [3, 2, 1, 2, 6]
  end

  it 'should return the minimum waiting time' do
    result = minimum_waiting_time(@queries)
    expect(result).to eq(17)
  end
end

describe 'minimum_waiting_time(#2)' do
  before do
    @queries = [3, 2, 1, 2, 6]
  end

  it 'should return the minimum waiting time' do
    result = min_waiting_time(@queries)
    expect(result).to eq(17)
  end
end
