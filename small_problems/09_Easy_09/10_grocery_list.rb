=begin
Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

APPROACH
do it 3 times:

- loop method
- each method
- map method

=end

# map
def buy_fruit(array_of_pairs)
  array_of_pairs.map { |fruit, number| [fruit] * number }.flatten
end

# each
def buy_fruit(array_of_pairs)
  result = []
  array_of_pairs.each { |fruit, number| result <<  [fruit] * number }
  result.flatten
end

# loop
def buy_fruit(array_of_pairs)
  result = []
  index = 0
  loop do
    result << [array_of_pairs[index].first] * array_of_pairs[index].last
    index += 1
    break if index >= array_of_pairs.size # == would work too
  end
  result.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
