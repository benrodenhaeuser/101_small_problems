def each_with_index(list)
  index = 0
  while index < list.length
    yield(list[index], index)
    index += 1
  end
  list
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
