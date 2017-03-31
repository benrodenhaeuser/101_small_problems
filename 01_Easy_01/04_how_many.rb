# Write a method that counts the number of occurrences of each element in a given array.

def count_occurences(array)
  counts = Hash.new { |hash,key| hash[key] = 0 }

  array.each do |element|
    counts[element] += 1
  end

  counts.each do |key, value|
    puts "#{key} => #{value}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']

count_occurences(vehicles)

# another way would be to use array.count. example:
p vehicles.count('car')
