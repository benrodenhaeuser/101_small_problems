=begin
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

approach:
- the first question we need to answer is how are we going to "swap a string"
in the way described. this should be done by a method swap_word(word)
- once we know that, do it like this:
split the given string into an array of words (string.split(' '))
- use map to transform that array, applying swap_word to each word
- turn array back into string using join

=end

def swap_word(word)
  first_letter = word[0]
  last_letter = word[word.size - 1]
  mid_section = word[1...word.size - 1]
  if first_letter == last_letter
    word
  else
    last_letter + mid_section + first_letter
  end
end

# the above can be replaced by the simpler:
def swap_word(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  string.split(' ').each { |word| swap_word(word) }.join(' ')
end

string = 'Oh what a wonderful day it is'

p swap(string) == 'hO thaw a londerfuw yad ti si'
p string
# p swap('Abcde') #== 'ebcdA'
# p swap('a') == 'a'
