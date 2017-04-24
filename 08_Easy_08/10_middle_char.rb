=begin
Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

=end

# approach 1: calculate the middle

def center_of(string)
  midpoint = string.size / 2
  string.length.odd? ? string[midpoint] : string[midpoint - 1..midpoint]
end

# approach 2: recursion

def center_of(string)
  string.length <= 2 ? string : center_of(string[1..-2])
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
