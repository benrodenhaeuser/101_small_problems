# approach
# - retrieve digits with mod?

# first digit: number % 10
# second digit: number % 100 (but only the first digit ... )


def to_string(number)
  str_array = []
  loop do
    str_array.unshift(number % 10)
    number /= 10
    break if number == 0
  end
  str_array.join
end

p to_string(4321) == '4321'
p to_string(0) == '0'
p to_string(5000) == '5000'
