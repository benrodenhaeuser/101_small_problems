def merge_sort(array)
  if array.size <= 1
    array
  else
    left = array[0...array.size/2]
    right = array[array.size/2...array.size]
    merge(merge_sort(left), merge_sort(right))
  end
end

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
  merged + array1 + array2
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
