def tournament_winner(competitions, results)
  max_scoring_team = nil
  max_score = 0
  scores = {}

  competitions.size.times do |i|
    duple = competitions[i]
    home_team, away_team = duple
    winning_team = results[i] == 1 ? home_team : away_team
    scores[winning_team] ? scores[winning_team] += 3 : scores[winning_team] = 3
  end

  scores.each do |key, val|
    if val > max_score
      max_score, max_scoring_team = [val, key]
    end
  end

  max_scoring_team
end
