a = 7
array = [1, 2, 3]

array.each do |a| # this is not the same a. It's a fresh a used to reference elements of the array
  # (this is called shadowing. the inner-scope-a shadows the outer-scope-a )
  a += 1
end

puts a # => 7
