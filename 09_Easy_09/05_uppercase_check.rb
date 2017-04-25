=begin

Write a method that takes a string argument, and returns true if all
of the alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

APPROACH

First idea:

- use a regex approach
- scan for alphabetic characters (returns an array)
- if returned array == returned array with all letters uppercased => return true

But ... I think it's even simpler:

string.upcase == string

=end

def uppercase?(string)
  string.upcase == string
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
