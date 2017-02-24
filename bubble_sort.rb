def bubble_sort(ary)
  loop do
    swapped = false
    counter = 0
    while counter < ary.length-1
      if ary[counter] > ary[counter+1]
        stored = ary[counter]
        ary[counter] = ary[counter+1]
        ary[counter+1] = stored 
        swapped = true
      end
      counter += 1
    end
    break if swapped == false
  end
  ary
end

p bubble_sort []
p bubble_sort [1]
p bubble_sort [100, 70, 80, 3, 10, 5]
