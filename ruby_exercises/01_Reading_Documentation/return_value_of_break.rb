# while loop returns nil unless exited with break AND break is given an argument
# in the latter case, while loop while return the value of that argument.


# example:
a = 0

result = while true
  a += 1
  break 
end

p result # => nil

# example:
a = 0

result = while true
  a += 1
  break 10
end

p result # => 10

# another example:
a = 0

result = while true
  a += 1
  break a if a.even?
end

p result # => 2
