# Write a method that takes a string, and returns a new string in which every character is doubled.

# split the array along empty space
# use the map method to double each character
# join the result to a string

def repeater(string)
  string.split('').map { |char| char * 2 }.join
end

# here, we have a nested array, i.e., a matrix, with two (identical) rows: if we transpose
# the matrix (each column becomes a row in new array) we get the desired result. we just
# have to join back:

def repeater(str)
  [str.chars, str.chars].transpose.join
end

# substitute globally: every char by twice that char:

def repeater(str)
  str.gsub(/(.)/, '\1\1')
end

# zip the string with itself:
def repeater(str)
  str.chars.zip(str.chars).join
end

p repeater('Hello') #== "HHeelllloo"
p repeater("Good job!") #== "GGoooodd  jjoobb!!"
p repeater('') #== ''
