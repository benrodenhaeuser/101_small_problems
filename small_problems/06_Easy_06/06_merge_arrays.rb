# merge two arrays, merged array has no duplicates

# "cheating" (i.e., using built-in functionality)
def merge(array1, array2)
  (array1 + array2).uniq
end

# remove duplicates from array here; return new array.
# approach:
# initialize lookup_table with elements already encountered
# loop over the array
# - if current element is in lookup table, skip
# - else store element in new array


def uniqify(array)
  encountered = Hash.new { |hash, key| hash[key] = false }
  uniqified_array = []
  array.each do |element|
    uniqified_array.push(element) unless encountered[element]
    encountered[element] = true
  end
  uniqified_array
end

def merge(array1, array2)
  uniqify(array1 + array2)
end

def merge(array1, array2)
  array1 + array2.select { |element| !array1.include?(element) }
end

p merge([1, 1], [2, 2])

# p merge([1, 3, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
