# double_consonants

# with a list of consonants

CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x y z]

# with map

def double_consonants(str)
  (0...str.size).map do |index|
    CONSONANTS.include?(str[index].downcase) ? str[index] * 2 : str[index]
  end.join
end

# just with each

def double_consonants(str)
  result = []
  str.chars.each do |char|
    CONSONANTS.include?(char.downcase) ? result << char * 2 : result << char
  end
  result.join
end

# with zip and uniq

def double_consonants(str)
  str.chars.zip(str.chars).map do |pair|
    CONSONANTS.include?(pair.first.downcase) ? pair : pair.uniq
  end.join
end

# with regex

def double_consonants(str)
  str.gsub(/(?=[^AEIOU])([A-Z])/i, '\1\1')
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
