def tournament_winner(competitions, results)
  max_scoring_team = nil
  max_score = 0;
  scores = {}

  competitions.size.times do |i|
    duple = competitions[i]
    homeTeam, awayTeam = duple
    winningTeam = results[i] == 1 ? homeTeam : awayTeam
    scores[winningTeam] ? scores[winningTeam] += 3 : scores[winningTeam] = 3
  end

  scores.each do |key, val| 
    if val > max_score
      max_score, max_scoring_team = [val, key]
    end
  end

  max_scoring_team
end