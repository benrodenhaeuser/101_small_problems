# the solution I came up with - kind of complicated logic

def merge_sort(ary)
  conquer(divide(ary)).to_s
end

def divide(ary)
  if ary.size <= 1
    ary
  else
    [divide(ary[0...ary.size / 2]), divide(ary[ary.size / 2...ary.length])]
  end
end

def conquer(ary)
  if ary.size <= 1
    ary
  elsif ary[0][0].to_s.to_i == ary[0][0] && ary[1][0].to_s.to_i == ary[1][0] # two flat arrays, already sorted
    merge(ary[0], ary[1], [])
  else
    conquer([conquer(ary[0]), conquer(ary[1])])
  end
end

# recursive merge of two sorted lists
def merge(arr1, arr2, result_so_far)
  if arr1 == []
    result_so_far + arr2 # doesn't matter if arr2 is also empty
  elsif arr2 == []
    result_so_far + arr1
  elsif arr1[0] < arr2[0] # both guaranteed to exist at this point
    merge(arr1.drop(1), arr2, result_so_far << arr1[0]) # drop does not mutate the array you call it on
  else # so arr2[0] <= arr1[0]
    merge(arr1, arr2.drop(1), result_so_far << arr2[0])
  end
end

# tests
p 'merge_sort([]): ' + merge_sort([]).to_s
p 'merge_sort([1]): ' + merge_sort([1]).to_s
p 'merge_sort([5, 2, 7, 0]): ' + merge_sort([5,2,7,0]).to_s
p 'merge_sort([5, 2, 7, 0, 11, 1, 10, 5]): ' + merge_sort([5, 2, 7, 0, 11, 1, 10, 5]).to_s
p 'merge_sort([10, 2, 7, 4, 5]): ' + merge_sort([10, 2, 7, 4, 5]).to_s
