# with each
def drop_while(list)
  list.each_index do |index|
    return list[index..-1] unless yield(list[index])
  end
  []
end

# with while
def drop_while(list)
  index = 0

  while list[index] && yield(list[index])
    index += 1
  end

  list[index..-1]
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
