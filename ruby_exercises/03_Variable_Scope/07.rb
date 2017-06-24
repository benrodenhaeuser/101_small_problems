a = 7
array = [1, 2, 3]

array.each do |element|
  a = element # the block scope has access to a. so here, we keep reassigning to a
end

puts a # => 3 (last element of the array, i.e., last reassignment)
