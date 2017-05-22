=begin
Write a method that takes an Array as an argument, and returns two Arrays that
contain the first half and second half of the original Array, respectively.
If the original array contains an odd number of elements, the middle element
should be placed in the first half Array.

APPROACH:

- how to find the appropriate midpoint?

four-element array:
(array.size / 2.0).ceil == 2

here, first two elems should be placed in left halvsie

five-element array:
(array.size / 2.0).ceil == 3

here, first three elems should be placed in left halvsie

so we will set splitpoint = (array.size / 2.0).ceil

- then we can split the array as follows:

array[0...splitpoint]
array[splitpoint...array.size]

So the array we want to return is :

[array[0...splitpoint], array[splitpoint...array.size]]

=end

def halvsies(array)
  splitpoint = (array.size / 2.0).ceil
  [array[0...splitpoint], array[splitpoint...array.size]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
