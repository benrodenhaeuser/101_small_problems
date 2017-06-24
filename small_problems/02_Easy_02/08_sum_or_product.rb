=begin

Write a program that asks the user to enter an integer greater than 0,
then asks if the user wants to determine the sum or product of all numbers
between 1 and the entered integer.

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

# approach:
# for sure, we need two methods that compute the sum/product
# we will then store number (user input) in variable
# and the operation (user input) also, and give an appropriate output.

# def product(number)
#   result = 1
#   multiplier = number
#   while multiplier != 0
#     result *= multiplier
#     multiplier -= 1
#   end
#   result
# end

# def sum(number)
#   result = 0
#   summand = number
#   while summand != 0
#     result += summand
#     summand -= 1
#   end
#   result
# end

# def sum(number)
#   number * (number + 1) / 2
# end

def product(number)
  (1..number).inject(:*)
end

def sum(number)
  (1..number).inject(:+)
end

number = nil
operation = nil

loop do
  puts "Please enter a positive integer"
  number = gets.chomp
  if number.to_i.to_s == number && number.to_i > 0
    number = number.to_i
    break
  end
  puts "Invalid input!"
end

loop do
  puts "Sum ('s') or product ('p')?"
  operation = gets.chomp
  break if operation.start_with?('s', 'p')
  puts "Invalid input!"
end

case operation
when 's'
  puts "The sum of the numbers between 1 and #{number} is #{sum(number)}."
when 'p'
  puts "The product of the numbers between 1 and #{number} is #{product(number)}."
end
