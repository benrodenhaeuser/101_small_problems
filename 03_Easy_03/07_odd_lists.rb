# my solution:

def oddities(array)
  include_toggle = false
  array.select do |elem|
    include_toggle = flip(include_toggle)
    include_toggle
  end
end

def flip(value)
  value ? false : true
end

# solution using the Enumerator#with_index method
def oddities(array)
  array.select.with_index { |value, index| index.even? }
end

# a solution that does not work
def oddities(arr)
  odds = arr.select { |element| arr.index(element).even? }
end

# ^ the case where this approach fails is when the array contains duplicates,
# e.g., try [2, 4, 6, 2], where we will get [2, 6, 2]

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
