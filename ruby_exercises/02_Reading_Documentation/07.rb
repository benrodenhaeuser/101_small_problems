# the documentation for step is in the parent class of Integer, which is Numeric

5.step(to: 10, by: 3) { |value| puts value } # 5 8

# note that the value is incremented at the end of each iteration

5.step(to: 5, by: 3) { |value| puts value } # 5
