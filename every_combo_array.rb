def every_combo_array(*args)
  chars = args.flatten
  len = args.size

  create_combos([], chars, len)
end

def create_combos(current_combo, remainder, len, result = [])
  if current_combo.size == len
    result << current_combo
  else
    remainder.each do |item|
      create_combos(current_combo + [item], remainder - [item], len, result)
    end
  end
  result
end

array1 = ['I']
array2 = %w[A B]
array3 = %w[X Y]
array4 = %w[t r q]

p every_combo_array(array1, array2, array3, array4)
