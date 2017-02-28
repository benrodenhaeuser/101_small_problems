# merge two sorted (!) arrays without mutating them.
# build the output array one element at a time, always in proper order.

# My solution: uses recursion

def sorted_merge(arr1, arr2)
  return merge(arr1, arr2, [])
end

def merge(arr1, arr2, result_so_far)
  if arr1 == []
    return result_so_far + arr2 # doesn't matter if arr2 is also empty
  elsif arr2 == []
    return result_so_far + arr1
  elsif arr1[0] < arr2[0] # both guaranteed to exist at this point
    return merge(arr1.drop(1), arr2, result_so_far << arr1[0]) # drop does not mutate the array you call it on
  else # so arr2[0] <= arr1[0]
    return merge(arr1, arr2.drop(1), result_so_far << arr2[0])
  end
end

# tests
arr1 = [1,5,6]
arr2 = [2,4,6]
p sorted_merge(arr1,arr2)
p arr1
p arr2

p sorted_merge([1, 5, 7], [2, 4, 6])
p sorted_merge([], [])
p sorted_merge([1], [])
p sorted_merge([1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6])
