=begin

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.

=end

# using a loop (= Launch School solution)
def crunch(string)
  index = 0
  crunched = ''
  while index < string.size
    crunched << string[index] unless string[index] == string[index + 1]
    index += 1
  end
  crunched
end

# using iterators
def crunch(string)
  array = string.chars
  array.select.with_index do |_, index|
    string[index] != string[index + 1]
  end.join
end

# using regex
def crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
