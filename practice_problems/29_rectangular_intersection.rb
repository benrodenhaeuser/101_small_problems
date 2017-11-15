# Write a function, `rec_intersection(rect1, rect2)` and returns the
# intersection of the two.
#
# Rectangles are represented as a pair of coordinate-pairs: the
# bottom-left and top-right coordinates (given in `[x, y]` notation).
#
# Hint: You can calculate the left-most x coordinate of the
# intersection by taking the maximum of the left-most x coordinate of
# each rectangle. Likewise, you can calculate the top-most y
# coordinate of the intersection by taking the minimum of the top most
# y coordinate of each rectangle.
#
# Difficulty: 4/5

=begin

approach:

- two rectangles do not intersect if the top_right corner of one of them is smaller than the bottom_left corner of the other one in at least one dimension (x-value or y-value).

- if they do intersect, their intersection can be computed as described in the hint

=end

def smaller_or_equal(pair_1, pair_2)
  x_1, y_1 = pair_1
  x_2, y_2 = pair_2

  x_1 <= x_2 || y_1 <= y_2
end


def rec_intersection(rect_1, rect_2)

  bottom_left_1, top_right_1 = rect_1
  bottom_left_2, top_right_2 = rect_2

  if smaller_or_equal(top_right_1, bottom_left_2) || smaller_or_equal(top_right_2, bottom_left_1)
    return nil
  end

  bottom_left_1_x, bottom_left_1_y = bottom_left_1
  bottom_left_2_x, bottom_left_2_y = bottom_left_2
  top_right_1_x, top_right_1_y = top_right_1
  top_right_2_x, top_right_2_y = top_right_2

  bottom_left_intersect_x = [bottom_left_1_x, bottom_left_2_x].max
  bottom_left_intersect_y = [bottom_left_1_y, bottom_left_2_y].max
  top_right_intersect_x = [top_right_1_x, top_right_2_x].min
  top_right_intersect_y = [top_right_1_y, top_right_2_y].min

  [
    [bottom_left_intersect_x, bottom_left_intersect_y],
    [top_right_intersect_x, top_right_intersect_y]
  ]

end

p rec_intersection([[0, 0], [2, 1]], [[1, 0], [3, 1]])

puts("\nTests for #rec_intersection")
puts("===============================================")
    puts "rec_intersection([[0, 0], [2, 1]], [[1, 0], [3, 1]]) == [[1, 0], [2, 1]]: "  + (rec_intersection([[0, 0], [2, 1]], [[1, 0], [3, 1]]) == [[1, 0], [2, 1]]).to_s
    puts "rec_intersection([[1, 1], [2, 2]], [[0, 0], [5, 5]]) == [[1, 1], [2, 2]]: "  + (rec_intersection([[1, 1], [2, 2]], [[0, 0], [5, 5]]) == [[1, 1], [2, 2]]).to_s
    puts "rec_intersection([[1, 1], [2, 2]], [[4, 4], [5, 5]]) == nil: "  + (rec_intersection([[1, 1], [2, 2]], [[4, 4], [5, 5]]) == nil).to_s
    puts "rec_intersection([[1, 1], [5, 4]], [[2, 2], [3, 5]]) == [[2, 2], [3, 4]]: "  + (rec_intersection([[1, 1], [5, 4]], [[2, 2], [3, 5]]) == [[2, 2], [3, 4]]).to_s
puts("===============================================")
