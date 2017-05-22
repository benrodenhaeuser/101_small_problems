=begin

** task description: maximum rotation of a number

If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

** approach

hint: use rotate_rightmost_digits method from previous exercise!

how does the maximum rotation work?

given number
number_length = number.to_s.length
number = rotate_rightmost_digits(number, number_length)
number = rotate_rightmost_digits(number, number_length - 1)
...
number = rotate_rightmost_digits(number, 2)

number_length.downto(2) { |length| number = rotate_rightmost_digits(number, length)  }

=end

def rotate_array(array)
  first, *remainder = array
  remainder + [first]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
  number_length = number.to_s.length
  number_length.downto(2) do |length|
    number = rotate_rightmost_digits(number, length)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
