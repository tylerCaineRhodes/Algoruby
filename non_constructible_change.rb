def non_constructible_change(coins)
  coins.sort!
  change = 0
  coins.each do |coin|
    return change + 1 if coin > change + 1
    change += coin
  end
  change + 1
end

puts non_constructible_change([1, 2, 5]) #should be 4
puts non_constructible_change([5, 7, 1, 1, 2, 3, 22]) #should be 20

