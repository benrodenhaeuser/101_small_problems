# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

# input: string
# return value: string

# algo:
# "the same string" sounds like it could mean destructive, but I am going to ignore that
# (it's probably just a bit ambiguous)

# So: I will return a new string
# split the string using ' ' as delimiter
# shift words from array and push them to new array
# join new array

def reverse_sentence(string)
  words = string.split(' ')
  reversed = []
  while words != []
    word = words.pop # take previous word
    reversed << word # make next word
    # alternative:
    # word = words.shift
    # reversed.unshift(word)
  end
  reversed.join(' ')
end

p reverse_sentence('Hello World Champion')
