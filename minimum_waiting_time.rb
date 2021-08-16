# solution 1
def minimum_waiting_time(queries)
  return 0 if queries.length < 2

  queries.sort!
  times = queries.map { |v| 0 }
  (1...queries.length).each do |i|
    times[i] = times[i - 1] + queries[i - 1]
  end
  times.inject(:+)
end

# solution 2
def min_waiting_time(queries)
  queries.sort!
  total_time = 0
  queries.length.times do |i|
    queries_left = queries.length - (i + 1)
    total_time += queries[i] * queries_left
  end
  total_time
end
