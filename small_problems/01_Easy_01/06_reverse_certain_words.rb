=begin

Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

=end

def reverse_certain_words(string, n = 5)
  words = string.split(' ')
  words.each_index do |index|
    if words[index].size >= n then words[index].reverse! end
  end
  words.join(' ')
end

p reverse_certain_words("this is fantastic")
