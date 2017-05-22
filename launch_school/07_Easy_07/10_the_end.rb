=begin
Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.
=end

def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


def middle_enultimate(str)
  arr = str.split
  arr[arr.size/2]
end

p middle_enultimate('last word') #== 'word'
p middle_enultimate('Launch School is great!') #== 'is'
p middle_enultimate('This Launch School is great place to learn stuff!') #== 'great'
