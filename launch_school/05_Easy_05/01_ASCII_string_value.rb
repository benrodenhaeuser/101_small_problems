# the ascii value of a character `char` is given by `char.ord`,
# e.g., 'b'.ord == 98


# using iterator methods
def ascii_value(string)
  string.chars.map { |char| char.ord }.inject(0, :+)
end

# using recursion
def ascii_value(string)
  if string == ''
    0
  else
    string[0].ord + ascii_value(string[1..(string.size - 1)])
  end
end

# using a loop
def ascii_value(string)
  value = 0

  loop do
    break if string == ''
    value += string[0].ord
    string = string[1..(string.size - 1)]
  end

  value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
