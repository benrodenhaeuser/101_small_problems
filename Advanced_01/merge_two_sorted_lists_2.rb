# merge two sorted (!) arrays without mutating them.
# build the output array one element at a time, always in proper order.

# Textbook solution: iteration

def merge(arr1, arr2)
  result = []
  while arr1 != [] && arr2 !=[]
    if arr1[0] < arr2[0]
      result << arr1[0]
      arr1 = arr1.drop(1)
    else
      result << arr2[0]
      arr2 = arr2.drop(1)
    end
  end
  if arr1 == []
    result += arr2
  else
    result += arr1
  end
  result
end

# tests
a1 = [0,1,4]
a2 = [2,3,5]
p merge(a1,a2)
p a1
p a2

puts

a1 = [1]
a2 = [2]
p merge(a1,a2)
