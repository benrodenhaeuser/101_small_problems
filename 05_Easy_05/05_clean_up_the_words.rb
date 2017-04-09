# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# approach: this can be done using the gsub method with an appropriate regex
# for the regex, we need a character class capturing the complement of the alphanumeric characters
# then we apply the star operator to that character class, and that's basically it.

def cleanup(string)
  string.gsub(/[^a-zA-Z]+/,' ')
end
