# transpose for arbitrary matrices

def column(matrix, col_index)
  (0...matrix.size).inject([]) do |column, row_index|
    column << matrix[row_index][col_index]
  end
end

def transpose(matrix)
  (0...matrix.first.size).inject([]) do |new_matrix, col_index|
    new_matrix << column(matrix, col_index)
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
