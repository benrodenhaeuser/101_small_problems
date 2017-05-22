=begin
Write a method named include? that takes an Array and a search value as arguments.
This method should return true if the search value is in the array, false if it is
not. You may not use the Array#include? method in your solution.

=end

def include?(array, element)
  array.each do |item|
    return true if item == element
  end
  false
end

# a solution relying on `Array#find_index`:

def include?(array, element)
  !!array.find_index(element)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
