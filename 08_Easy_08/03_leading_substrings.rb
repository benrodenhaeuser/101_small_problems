=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
=end

# with iterators
def substrings_at_start(string)
  chars = string.chars.select { |char| char.match /[A-Za-Z0-9] }
  chars.map.with_index { |_, index| chars[0..index].join }
end

# recursive
def substrings(string)
  string.size == 1 ? [string] : [substrings(string[0..-2]), string].flatten
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
