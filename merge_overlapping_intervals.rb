def merge_overlapping_intervals(array)
  array.sort!
  merged = [array[0]]

  curr = merged[0]
  (1...array.length).each do |i|
    _curr_first, curr_last = curr
    next_first, next_last = array[i]

    if curr_last < next_first
      merged.push(array[i])
      curr = merged[merged.length - 1]
    else
      curr[1] = [curr_last, next_last].max
    end
  end

  merged
end
