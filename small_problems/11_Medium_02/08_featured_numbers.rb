=begin

A featured number (something unique to this exercise) is a number with
the following properties:

- it is odd
- it is a multiple of 7
- all its digits occur once each

Examples:

- 49 is a featured number,
- but 98 is not (it is not odd),
- 97 is not (it is not a multiple of 7), and
- 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

APPROACH

given number
candidate = number + 1

loop:
  break candidate if candidate is a featured number
  candidate += 1
  break error if candidate >= 9_999_999_999

=end

def error(number)
  puts "There is no featured number larger than #{number}"
end

def featured?(number)
  number.odd? && number % 7 == 0 && unique_digits?(number)
end

def unique_digits?(number)
  number.to_s.chars.uniq == number.to_s.chars
end

def number_of_digits(number)
  number.to_s.length
end

def featured(number)
  candidate = number + 1
  loop do
    break candidate if featured?(candidate)
    candidate += 1
    break error(number) if number_of_digits(candidate) > 10
  end
end

# p featured(12) == 21 # true
# p featured(20) == 21 # true
# p featured(21) == 35 # true
# p featured(997) == 1029 # true
# p featured(1029) == 1043 # true
# p featured(999_999) == 1_023_547 # true
# p featured(999_999_987) == 1_023_456_987 # true
# p featured(9_999_999_999) # error message, nil


def featured(num)
    return 'Error' if num >= 9_999_999_999
    multiple_7 = num - (num % 7)
    start = multiple_7.odd? ? multiple_7 : multiple_7 + 7
    enum_featured = Enumerator.new do |yielder|
    n = start
    loop do
      yielder << n if n.odd? && !n.to_s[/(\d).*\1/]
      n += 14
    end
  end
    enum_featured.find { |feat_num| feat_num > num }
end

p featured(22)
