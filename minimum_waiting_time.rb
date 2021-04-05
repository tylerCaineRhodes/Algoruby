#solution1
def minimum_waiting_time(queries)
  return 0 if queries.length < 2
  queries.sort!
  times = queries.map { |v| 0 }
  for i in (1...queries.length)
    times[i] = times[i - 1] + queries[i - 1]
  end
   times.inject(0) { |acc, val| acc + val }
end

#solution2
def min_waiting_time(queries)
  queries.sort!
  totalTime = 0;
  queries.each_with_index do |item, i|
    queries_left = queries.length - (i + 1)
    totalTime += queries[i] * queries_left
  end
  totalTime
end
