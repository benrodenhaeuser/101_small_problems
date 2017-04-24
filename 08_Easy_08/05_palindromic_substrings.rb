=begin
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
=end

def substrings_at_start(string)
  chars = string.chars
  chars.map.with_index { |_, index| chars[0..index].join }
end

def substrings(string)
  (0...string.size)
    .map.with_index { |_, index| string[index..-1] }
    .flat_map { |string| substrings_at_start(string) }
end

def palindromic?(string)
  string = string.downcase.gsub(/[^a-z0-9]/, '')
  string == string.reverse && string.length > 1
end

def palindromes(string)
  substrings(string).select { |item| palindromic?(item) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('kniTting cassetes')
# == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
