=begin

Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be unchanged.


=end

SWAP = (('a'..'z').to_a.zip(('A'..'Z').to_a) +
        ('A'..'Z').to_a.zip(('a'..'z').to_a)).to_h

def swapcase(string)
  string.split('').map do |char|
    if char =~ /[a-zA-Z]/
      SWAP[char]
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
