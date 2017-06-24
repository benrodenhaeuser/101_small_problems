# approach:
# - using the number given, we get a range (1..number)
# - from that range, select numbers divisible by 3 or divisible by 5
# - select method => stores result in array
# - inject method sums up elements of array

def multisum(number)
  (0..number).select { |num| num % 3 == 0 || num % 5 == 0 }.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
