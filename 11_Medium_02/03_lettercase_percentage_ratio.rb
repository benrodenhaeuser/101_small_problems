=begin

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.


approach:
1 we first need to count uppercase, lowercase, and 'neither' in given string
2 using the length of string, we can convert the counts to percentages

as for 1:
I think we can implement the count functionality using the scan method
The scan method is called on a string and is passed a regular expression
it produces an array of matches (of regex in string)
the size of that array is our count

so this gives us a method number_of(pattern)

now express number_of(pattern) as a percentage of string.size


=end

def percentage(string, pattern)
  (string.scan(pattern).size / string.size.to_f) * 100
end

def letter_percentages(string)
  {
    lowercase: percentage(string, /[a-z]/),
    uppercase: percentage(string, /[A-Z]/),
    neither:   percentage(string, /[^A-Za-z]/)
  }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
