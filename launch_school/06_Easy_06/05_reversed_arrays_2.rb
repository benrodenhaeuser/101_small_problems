# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

# approach:
# - initialize new array (i.e., new_arr = [])
# - walk through given array from right to left (while loop)
# - in each iteration, push current element of array to new_arr

# pseudocode:
#
# given: array array
#
# new_arr = []
# index = array.size - 1 (i.e., array[index] is now last element of array)
# while index <= 0
#   new_arr.push(array[index])
#   decrement index
# end
# return new_arr
#

# using a while loop

def reverse(array)
  new_array = []
  index = array.size - 1
  while index >= 0
    new_array.push(array[index])
    index -= 1
  end
  new_array
end

# using each and unshift

def reverse(array)
  new_array = []
  array.each { |element| new_array.unshift(element) }
  new_array
end

# using inject and unshift

def reverse(array)
  array.inject([]) { |memo, element| memo.unshift(element) }
end

def reverse(array)
  array2 = []
  array.each_index { |index| array2.insert(((index + 1) * -1), array[index]) }
  puts "Your array reversed is #{array2}"
end

# tests

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
