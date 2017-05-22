=begin

Write a method that rotates an array by moving the first element to the end
of the array. The original array should not be modified.

=end

# using a while loop

def rotate_array(array)
  rotated_array = []
  index = 0
  while index <= array.size - 2
    rotated_array[index] = array[index + 1]
    index += 1
  end
  rotated_array << array[0]
  rotated_array
end

# # using appropriate slices of given array
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end
#
# # using splat notation
# def rotate_array(array)
#   first, *remainder = array
#   remainder + [first]
# end

# even crazier
# def rotate_array(arr)
#   [*arr[1..-1], *arr.first]
# end
#
# def rotate_array(array)
#   first, *remainder = array
#   [*remainder,*[first]]
# end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true


# Further exploration:

# - rotate a string
# - rotate an integer

def rotate_string(string)
  rotate_array(string.chars).join
end

# p rotate_string('hello world')

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

# p rotate_integer(12345)
