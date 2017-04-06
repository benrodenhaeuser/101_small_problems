def real_palindrome?(string)
  relevant_chars = string.downcase.chars.select { |char| char.match?(/[a-z0-9]/) }
  p relevant_chars
  relevant_chars == relevant_chars.reverse
end

# approach:
# use chars to turn string into array of characters
# use select to filter out non-alphanumeric characters
# the actual filtering is done with match: char.match?(/[a-zA-Z0-9]/)

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# slightly simpler solution (by Launch School):

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end
