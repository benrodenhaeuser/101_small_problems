=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

approach:
- sum up the numbers in the array. we will use each and a variable `sum` declared before each
- could convert sum to a float (to get more fine-grained average), but that's not what's required here
- divide by size of array
=end

def average(array)
  sum = 0
  array.each do |number|
    sum += number
  end
  sum = sum.to_f
  average = sum / array.size
end

# another implementation using reduce/inject

def average(array)
  array.inject(:+).to_f / array.size
end

puts average([1, 5, 87, 45, 8, 8]) # 25.66...
puts average([9, 47, 23, 95, 16, 52]) # 40.333..
