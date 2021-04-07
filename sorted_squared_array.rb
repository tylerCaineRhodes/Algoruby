def sorted_squared_array(array)
  array.map { |v| v * v }.sort!
end

def sorted_squared_arr(array)
  result = Array.new(array.length) { |i| 0 }
  left = 0
  right = array.length - 1
  (array.length - 1).downto(0) do |i|
    if (array[left]).abs > (array[right]).abs
      result[i] = array[left] * array[left]
      left += 1
    else
      result[i] = array[right] * array[right]
      right -= 1
    end
  end
  result
end
