=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
=end

def substrings_at_start(string)
  chars = string.chars
  chars.map.with_index { |_, index| chars[0..index].join }
end

def substrings(string)
  (0...string.size)
    .map { |index| string[index..-1] }
    .flat_map { |string| substrings_at_start(string) }
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
