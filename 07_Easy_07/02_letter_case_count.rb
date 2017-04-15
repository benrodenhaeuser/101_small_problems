# Use a while loop

def letter_case_count(string)
  index = 0
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  while index < string.size
    if string[index].match(/[a-z]/)
      counts[:lowercase] += 1
    elsif string[index].match(/[A-Z]/)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
    index += 1
  end
  counts
end

# Use Array#count

def letter_case_count(string)
  counts = {}

  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/  }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/  }
  counts[:neither]   = characters.count { |char| char =~ /[^a-zA-Z]/ }

  counts
end

# Use String#count

def letter_case_count(string)
  lowercase = string.count('a-z')
  uppercase = string.count('A-Z')
  neither = string.count('^a-zA-Z')
  { lowercase: lowercase, uppercase: uppercase, neither: neither}
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
