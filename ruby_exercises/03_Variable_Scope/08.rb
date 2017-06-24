array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a # error, i.e. "undefined local variable". We have never defined a in the outer scope
