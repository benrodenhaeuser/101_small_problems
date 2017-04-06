def palindrome?(string)
  string == string.reverse
end

def palindrome?(array)
  array == array.reverse
end

def palindrome?(obj)
  obj == obj.reverse
end

# for string or array:

def palindrome?(obj)
  if obj.length == 0
    true
  else
    obj[0] == obj[-1] && palindrome?(obj[1..-2])
  end
end

p palindrome?('madam'.split('')) == true
p palindrome?('Madam'.split('')) == false          # (case matters)
p palindrome?("madam i'm adam".split('')) == false # (all characters matter)
p palindrome?('356653'.split('')) == true
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
