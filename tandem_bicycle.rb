def tandem_bicycle(red_shirt_speeds, blue_shirt_speeds, fastest)
  red_shirt_speeds.sort!
  fastest ? blue_shirt_speeds.sort! { |a, b| b - a } : blue_shirt_speeds.sort! { |a, b| a - b }
  red_shirt_speeds.map.with_index { |_val, i| [red_shirt_speeds[i], blue_shirt_speeds[i]].max }.inject(:+)
end
