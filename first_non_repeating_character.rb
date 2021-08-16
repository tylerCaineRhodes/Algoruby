def first_non_repeating_character(string)
  split_str = string.split('')
  storage = split_str.inject({}) do |acc, char|
    acc[char] ? acc[char] += 1 : acc[char] = 1
    acc
  end
  split_str.each_with_index { |char, i| return i if storage[char] == 1 }
  -1
end
