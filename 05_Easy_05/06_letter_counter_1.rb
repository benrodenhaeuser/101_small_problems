=begin

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

In other words, the output is a list that roughly looks like this:
words with 3 letters: 3
words with 4 letters: 4
...
(and so on)

approach:
- initialize an empty hash with default value 0
- split the string into array of words (according to above definition of word)
- walk through array of words with each.
- write to our hash using word.size and incrementing values

=end

def word_sizes(string)
  words = string.split(' ')
  counts = Hash.new { |hash, key| hash[key] = 0 }
  words.each { |word| counts[word.size] += 1 }
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

def words_of_sizes(string)
  words = string.split(' ')
  words_of_sizes = Hash.new { |hash, key| hash[key] = [] }
  words.each { |word| words_of_sizes[word.size] << word }
  words_of_sizes
end

p words_of_sizes('Four score and seven.')
# {4=>["Four"], 5=>["score"], 3=>["and"], 6=>["seven."]}

p words_of_sizes('Hey diddle diddle, the cat and the fiddle!')
# {3=>["Hey", "the", "cat", "and", "the"], 6=>["diddle"], 7=>["diddle,", "fiddle!"]}

p words_of_sizes("What's up doc?")
# {6=>["What's"], 2=>["up"], 4=>["doc?"]}

p words_of_sizes('')
# {}
