=begin
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

APPROACH
do this first with each and a conditional

if divisible by 15
  print FizzBuzz
elsif divisible by 5
  print Fizz
elsif divisible by 3
  print Buzz
else
  print number
end

=end

# my solution:

def print_fizzbuzz(number, trailing: ', ', command: :print)
  if number % 15 == 0
    send(command, "FizzBuzz#{trailing}")
  elsif number % 5 == 0
    send(command, "Fizz#{trailing}")
  elsif number % 3 == 0
    send(command, "Buzz#{trailing}")
  else
    send(command, "#{number}#{trailing}")
  end
end

def fizzbuzz(first, last)
  (first..last).each do |number|
    if number == last
      print_fizzbuzz(number, trailing: '', command: :puts)
    else
      print_fizzbuzz(number)
    end
  end
end

# my solution works, but what we actually want to do is compute (and format)
# the whole string and print it. this makes all the complications we had
# to deal with above non-issues.

def fizzbuzz_value(number)
  if number % 15 == 0
    "FizzBuzz"
  elsif number % 5 == 0
    "Fizz"
  elsif number % 3 == 0
    "Buzz"
  else
    number.to_s
  end
end

def fizzbuzz(first, last)
  result = []
  (first..last).each do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

fizzbuzz(1, 15)
