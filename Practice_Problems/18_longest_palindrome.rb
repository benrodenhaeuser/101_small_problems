# Write a method that takes in a string of lowercase letters (no
# uppercase letters, no repeats). Consider the *substrings* of the
# string: consecutive sequences of letters contained inside the string.
# Find the longest such string of letters that is a palindrome.
#
# Note that the entire string may itself be a palindrome.
#
# You may want to use Array's `slice(start_index, length)` method,
# which returns a substring of length `length` starting at index
# `start_index`:
#
#     "abcd".slice(1, 2) == "bc"
#     "abcd".slice(1, 3) == "bcd"
#     "abcd".slice(2, 1) == "c"
#     "abcd".slice(2, 2) == "cd"
#
# Difficulty: hard.


=begin

APPROACH:

- recursive solution
- iterative solution

RECURSIVE SOLUTION

if the string given is a palindrome, then this string is also the longest palindromic substring
so if string given is palindrome, return string

else:
recursive call to longest_palindrome:
longest palindrome is to be found:
either in string[0...-1] or in string[1..-1]

left = longest_palindrome(string[0...-1])
right = string[1..-1]

if left is longer than right, return left
otherwise return right

ITERATIVE SOLUTION


algo:
- sorted_substrings = sort the substrings of string by length descending
- iterate over sorted_substrings with each (block parameter: substring)
    return substring if palindrome?(substring)

fill in the blanks:
- need method that returns all the substrings of string
- do this recursively:
  - the substrings of a single-char string are: that string! (wrapped in array)
  - the substrings of a longer string are:
    [that_string] + substrings of string[0...-1] + substrings of in string[1..-1]

iterative version of substring method:

the substrings of a string are all the strings starting at string index 0
plus all the strings starting at string index 1
plus ...
plus all the strings starting at string index string.size - 1

==> need method to get all strings starting at certain index
==> allows us to build method that gives all substrings

=end

def palindrome?(string)
  string == string.reverse
end

# recursive solution
def longest_palindrome(string)
  if palindrome?(string)
    string
  else
    left = longest_palindrome(string[0...-1])
    right = longest_palindrome(string[1..-1])

    left.size >= right.size ? left : right
  end
end

# iterative solution

# recursive method to get substrings
def substrings(string)
  if string.size == 1
    [string]
  else
    [string] + (substrings(string[0...-1]) + substrings(string[1..-1])).uniq
  end
end

# iterative method to get substrings
def substrings(string)
  # for every valid index of string: get strings starting at that index
  # collect them and return all of them (= array of strings)
end

def substrings_starting_at(string, index)
  # return array of strings
end


def longest_palindrome(string)
  p sorted_substrings = substrings(string).sort_by { |string| string.size }.reverse
  sorted_substrings.each do |substring|
    return substring if palindrome?(substring)
  end
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts("\nTests for #longest_palindrome")
puts("===============================================")
    puts(
      'longest_palindrome("abcbd") == "bcb": ' +
      (longest_palindrome('abcbd') == 'bcb').to_s
    )
    puts(
      'longest_palindrome("abba") == "abba": ' +
      (longest_palindrome('abba') == 'abba').to_s
    )
    puts(
      'longest_palindrome("abcbdeffe") == "effe": ' +
      (longest_palindrome('abcbdeffe') == 'effe').to_s
    )
puts("===============================================")
