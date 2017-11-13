def divisors(number)
  (1..number/2).select { |num| number % num == 0 } + [number]
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# how to make it go faster?

# "half of the divisors gives you the other half."

# prime factors?

# p divisors(999962000357) == [1, 999979, 999983, 999962000357]
