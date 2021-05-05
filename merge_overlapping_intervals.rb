def merge_overlapping_intervals(array)
  array.sort!
  merged = [array[0]]

  curr = merged[0]
  (1...array.length).each do |i|
    currFirst, currLast = curr
    nextFirst, nextLast = array[i]

    if currLast < nextFirst
      merged.push(array[i])
      curr = merged[merged.length - 1]
    else
      curr[1] = [currLast, nextLast].max
    end
  end

  merged
end
