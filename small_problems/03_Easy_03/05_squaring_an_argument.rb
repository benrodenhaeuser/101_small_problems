def multiply(number1, number2)
  number1 * number2
end

def square(number)
  multiply(number, number)
end

def power(n, number)
  result = 1
  n.times { result = multiply(result, number) }
  result
end


p square(5) == 25
p square(-8) == 64

p power(3, 10) == 1000
p power(0, 100) == 1
