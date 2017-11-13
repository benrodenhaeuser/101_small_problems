def zip(list1, list2)
  list1.map.with_index do |elem, index|
    [elem, list2[index]]
  end
end

p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
