def to_string(positive_integer)
  number = positive_integer
  str_array = []
  loop do
    str_array.unshift(number % 10)
    number /= 10
    break if number == 0
  end
  str_array.join
end

def signed_integer_to_string(integer)
  if integer > 0
    '+' + to_string(integer)
  elsif integer < 0
    '-' + to_string(integer.abs)
  else
    '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
