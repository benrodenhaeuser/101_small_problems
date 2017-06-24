=begin

APPROACH

given 3 x 3 matrix (a nested array)

method column(matrix, index)
==> returns the column in matrix at column index index

using this method, we get the transposed matrix like this:

[
  column(matrix, 0), column(matrix, 1), column(matrix, 2)
]

so the main task is to implement column(matrix, index)

=end

require 'benchmark'

# VERSION 1

def transpose(matrix)
  [
    column(matrix, 0), column(matrix, 1), column(matrix, 2)
  ]
end

def column(matrix, index)
  [matrix[0][index], matrix[1][index], matrix[2][index]]
end

# VERSION 2: square matrix, arbitrary size

def transpose(matrix)
  new_matrix = []
  (0...matrix.size).each { |index| new_matrix << column(matrix, index) }
  new_matrix
end

def column(matrix, index)
  column = []
  (0...matrix.size).each { |row| column << matrix[row][index] }
  column
end

# VERSION 3: use inject

def column(matrix, col_index)
  (0...matrix.size).inject([]) do |column, row_index|
    column << matrix[row_index][col_index]
  end
end

def transpose(matrix)
  (0...matrix.size).inject([]) do |new_matrix, col_index|
    new_matrix << column(matrix, col_index)
  end
end

# destructive version

# transposition is reflection of the matrix across its diagonal

def transpose!(matrix)
  (0...matrix.size).each do |row|
    (0...matrix.size).each do |col|
      matrix[row][col], matrix[col][row] =
        matrix[col][row], matrix[row][col] if row < col
    end
  end
end

def transpose!(arr)
  arr.map!.with_index { |_, idx| [arr[0][idx], arr[1][idx], arr[2][idx]] }
end

# tests

# non-destructive

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

puts Benchmark.realtime { transpose(matrix) }
# 4.00003045797348e-06

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix = [
  [1, 5, 8, 4],
  [4, 7, 2, 6],
  [3, 9, 6, 7],
  [4, 3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3, 4], [5, 7, 9, 3], [8, 2, 6, 9], [4, 6, 7, 6]]
p matrix == [[1, 5, 8, 4], [4, 7, 2, 6], [3, 9, 6, 7], [4, 3, 9, 6]]

# destructive

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]


matrix = [
  [1, 5, 8, 4],
  [4, 7, 2, 6],
  [3, 9, 6, 7],
  [4, 3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3, 4], [5, 7, 9, 3], [8, 2, 6, 9], [4, 6, 7, 6]]

# # solutions by other students:
#
# # walid wahed's solution:
# def transpose!(matrix)
#   matrix.each do |row|
#     matrix.size.times do |idx|
#       matrix[idx] << row.shift
#     end
#   end
#   matrix
# end
#
# # nick's solution:
# def transpose(matrix)
#   matrix.first.zip(*matrix.drop(1))
# end
#
# # david's solution:
# def transpose(matrix)
#   (0..matrix.size - 1).map do |s|
#     (0..matrix.size - 1).map do |f|
#       matrix[f][s]
#     end
#   end
# end
