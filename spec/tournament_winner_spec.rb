require_relative '../tournament_winner'

describe 'tournament_winner' do
  before do
    @competitions = [
      ["HTML", "C#"],
      ["C#", "Python"],
      ["Python", "HTML"]
    ]
    @results = [0, 0, 1]
  end

  it "should return the first non repeating char" do
    expect(tournament_winner(@competitions, @results)).to eq('Python')
  end
end