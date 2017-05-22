# running_total takes an array and returns an array of the same size, where
# each element of new array has the running total from original array.

def running_total(array)
  running_total = 0
  new_array = []

  array.each_with_index do |number, index|
    running_total += number
    new_array[index] = running_total
  end

  new_array
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

## more succinctness? use map!

def running_total(array)
  running_total = 0
  array.map do |number|
    running_total += number
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []


## what about inject?
def running_total(array)
  array.map.with_index do |_, index|
    array[0..index].inject(:+)
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
