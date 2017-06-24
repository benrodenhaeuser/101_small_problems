# convert a given string to a number, without using built-in conversion methods

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9
}

def to_integer(string)
  number = 0
  exponent = 0

  string.chars.reverse.each do |char|
    number += DIGITS[char] * (10 ** exponent)
    exponent += 1
  end

  number
end

p to_integer('4321') == 4321
p to_integer('570') == 570
