#Solution 1
def two_sum(array, target)
    for i in (0...array.length)
      for j in (i + 1...array.length)
        if array[i] + array[j] == target
          return [array[i], array[j]]
        end
      end
    end
  return [-1, -1]
end

print two_sum([1,2,3], 5)
print two_sum([1,2,3], 6)


#Solution 2
def two_sum(array, target)
  storage = {}
  array.each do |val|
    diff = target - val
    if storage[diff]
      return [diff, val]
    else
      storage[val] = true;
    end
  end
  return [-1, -1]
end

print two_sum([1,2,3], 5)
print two_sum([1,2,3], 6)

#Solution 3
def two_sum(array, target)
  array = array.sort
  pointer1 = 0
  pointer2 = array.length - 1
  
  while pointer1 <= pointer2 do 
    sum = array[pointer1] + array[pointer2]
    if sum == target
      return [array[pointer1], array[pointer2]]
    elsif sum < target
      pointer1 += 1
    else pointer2 -= 1
  end
  return [-1, -1]
end
end
print two_sum([1,2,3], 5)


#Solution 4
def two_sum(array, target)
  array.permutation(2).find { |i, j| i + j == target} || [-1, -1]
end
print two_sum([1,2,3], 5)
print two_sum([1,2,3], 6)
