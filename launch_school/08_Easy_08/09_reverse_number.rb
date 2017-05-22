def reversed_number(number)
  number.to_s.reverse.to_i
end

def reversed_number(number)
  if number < 10
    number
  else
    ((number % 10).to_s + reversed_number(number / 10).to_s).to_i
  end
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
