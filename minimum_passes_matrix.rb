def minimum_passes_of_matrix(matrix)
  next_queue = get_positive_elements(matrix)
  current_queue = []
  passes = 0

  while next_queue.length.positive? do
    current_queue, next_queue = next_queue, current_queue

    while current_queue.length.positive? do
      curr_row, curr_col = current_queue.shift
      neighbors = get_neighbors(curr_row, curr_col, matrix)
      neighbors.each do |neighbor|
        row, col = neighbor
        value = matrix[row][col]

        if value.negative?
          matrix[row][col] = value * -1
          next_queue << neighbor
        end
      end
    end
    passes += 1
  end
  contains_negative(matrix) ? -1 : passes - 1
end

def get_neighbors(r, c, matrix)
  neighbors = []
  neighbors << [r - 1, c] if r.positive?
  neighbors << [r + 1, c] if r < matrix.length - 1
  neighbors << [r, c - 1] if c.positive?
  neighbors << [r, c + 1] if c < matrix[0].length - 1
  neighbors
end

def get_positive_elements(matrix)
  queue = []
  matrix.length.times do |r|
    matrix[r].length.times do |c|
      queue << [r, c] if matrix[r][c].positive?
    end
  end
  queue
end

def contains_negative(matrix)
  matrix.flatten.any?(&:negative?)
end

input = [
  [0, -1, -3, 2, 0],
  [1, -2, -5, -1, -3],
  [3, 0, 0, -4, -1]
]

input2 = [
  [1, 0, 0, -2, -3],
  [-4, -5, -6, -2, -1],
  [0, 0, 0, 0, -1],
  [1, 2, 3, 0, -2]
]
p minimum_passes_of_matrix(input)
p minimum_passes_of_matrix(input2)
