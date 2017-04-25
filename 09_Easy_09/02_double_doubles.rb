# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

=begin

  APPROACH:

  The main task here is to write a method that determines whether a given number is a double number.
  The most basic way to do this seems to be to split the array in half.

  We can split an array in the middle by using two ranges:
  (0...array.size / 2) and (array.size / 2...array.size)

  We only want to do this if the number we started with has an even length string representation.
  (otherwise, not a double number for sure!)

  Given that we have this, we have a simple logic:
  - number_as_string has even length and is a double number? ==> return number
  - otherwise return twice the number

=end

def double?(number)
  return false if number.to_s.size.odd?
  length = number.to_s.size
  cut = length / 2
  number_as_string = number.to_s
  number_as_string[0...cut] == number_as_string[cut...length]
end

def twice(number)
  if double?(number)
    number
  else
    number * 2
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
