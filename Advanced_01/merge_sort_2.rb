# von Neumann's algorithm

def sort(ary)
  if ary.size <= 1
    ary
  else
    ary_1 = ary[0...ary.size/2]
    ary_2 = ary[ary.size/2...ary.length]
    merge(sort(ary_1), sort(ary_2), [])
  end
end

def merge(arr1, arr2, result_so_far) # takes two sorted arrays, returns sorted array

  # we are done comparing elements, just need to wrap things up
  if arr1 == []
    result_so_far + arr2 # doesn't matter if arr2 is also empty
  elsif arr2 == []
    result_so_far + arr1

  # the actual sorting
  elsif arr1[0] < arr2[0] # both guaranteed to exist at this point
    merge(arr1.drop(1), arr2, result_so_far << arr1[0]) # drop does not mutate the array you call it on
  else # so arr2[0] <= arr1[0]
    merge(arr1, arr2.drop(1), result_so_far << arr2[0])
  end
end

p "sort([]):" + sort([]).to_s
p "sort([1]):" + sort([1]).to_s
p "sort([5,2,7,0]): " + sort([5,2,7,0]).to_s
p "sort([5,2,7,0,11,1,10,5]): " + sort([5,2,7,0,11,1,10,5]).to_s
p "sort([10,2,7,4,5]): " + sort([10,2,7,4,5]).to_s
