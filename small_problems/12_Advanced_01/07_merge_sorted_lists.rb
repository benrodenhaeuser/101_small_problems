=begin

Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

=end

# Solution 1

def merge(array1, array2)
  merged = []
  index1 = 0
  index2 = 0

  while index1 < array1.size && index2 < array2.size
    if array1[index1] <= array2[index2]
      merged << array1[index1]
      index1 += 1
    else
      merged << array2[index2]
      index2 += 1
    end
  end

  if index1 >= array1.size
    (index2...array2.size).each do |index|
      merged << array2[index]
    end
  end

  if index2 >= array2.size
    (index1...array1.size).each do |index|
      merged << array1[index]
    end
  end

  merged
end

# Solution 2: instead of using indices, we can reassign the arrays each step of the way

def merge(array1, array2)
  merged = []
  while !array1.empty? && !array2.empty?
    if array1.first < array2.first
      merged << array1.first
      array1 = array1.drop(1)
    else
      merged << array2.first
      array2 = array2.drop(1)
    end
  end
  if array1 == []
    merged += array2
  else
    merged += array1
  end
  merged
end

arr1 = [1, 5, 9]
arr2 = [2, 6, 8]

p merge(arr1, arr2) == [1, 2, 5, 6, 8, 9]
p arr1
p arr2
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
