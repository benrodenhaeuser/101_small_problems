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

def to_signed_integer(string)
  if string.start_with?('+')
    to_integer(string.delete('+'))
  elsif string.start_with?('-')
    -to_integer(string.delete('-'))
  else
    to_integer(string)
  end
end

p to_signed_integer('4321') == 4321
p to_signed_integer('-570') == -570
p to_signed_integer('+100') == 100
