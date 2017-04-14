def reverse!(array)
  index = 0
  midpoint = array.size / 2

  while index < midpoint
    array[index], array[-(index + 1)] = array[-(index + 1)], array[index]
    index += 1
  end

  array
end
