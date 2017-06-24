
=begin

rotate the n rightmost digits of a given number

approach:
- convert the number to a string
- split the string in half depending on number of digits given
- convert the right half to array
- rotate that array using rotate_array
- converte resulting array back to string (join)
- concatenate left half with new right half
- convert the resulting string to integer
=end

# my solution
def rotate_rightmost_digits(number, number_of_digits)
  number_string = number.to_s
  splitpoint = number_string.length - number_of_digits

  left_half = number_string[0...splitpoint]
  right_half = rotate_string(number_string[splitpoint...number_string.length])

  (left_half + right_half).to_i
end

def rotate_array(array)
  first, *remainder = array
  remainder + [first]
end

def rotate_string(string)
  rotate_array(string.chars).join
end

# Launch School solution:
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
