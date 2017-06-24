=begin

Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the elements
taken in alternation. You may assume that both input Arrays are non-empty, and
that they have the same number of elements.

=end


# using zip and flatten (non-destructive  )
def interleave(array1, array2)
  array1.zip(array2).flatten
end

arr1 = [1, 2, 3]
arr2 = ['a', 'b', 'c']
p interleave(arr1, arr2) # == [1, 'a', 2, 'b', 3, 'c']
p arr1 + arr2

# using while and shift (destructive)
def interleave(array1, array2)
  interleaved = []
  while array1 != []
    interleaved << array1.shift << array2.shift
  end
  interleaved
end

arr1 = [1, 2, 3]
arr2 = ['a', 'b', 'c']
p interleave(arr1, arr2) # == [1, 'a', 2, 'b', 3, 'c']
p arr1 + arr2

# using while and slice (non-destructive)
def interleave(array1, array2)
  interleaved = []
  counter = 0
  while counter < array1.size
    interleaved << array1[counter] << array2[counter]
    counter += 1
  end
  interleaved
end

arr1 = [1, 2, 3]
arr2 = ['a', 'b', 'c']
p interleave(arr1, arr2) # == [1, 'a', 2, 'b', 3, 'c']
p arr1 + arr2
