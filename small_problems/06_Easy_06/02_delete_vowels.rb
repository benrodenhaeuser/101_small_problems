# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# regex solution
def remove_vowels(strings)
  strings.map { |string| string.gsub(/[aeiou]/i, '') }
end

# iterator solution
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

# loop solution
VOWELS = %(a e i o u A E I O U)

def remove_vowels(strings)
  new_strings = []
  for string in strings
    new_string = ''
    index = 0
    while index < string.size
      new_string << string[index] unless VOWELS.include?(string[index])
      index += 1
    end
    new_strings << new_string
  end
  new_strings
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
