=begin

write a method that produces a diamond of "size N" given odd N.

approach:
- what is a diamond of size N?
  - it consists of N lines
  - line ceil(N/2.0) has N asterisk symbols
  - the lines above and below have N - 1 asterisks
  - the lines above an below those have N - 2 asterisks
  - and so on until we have lines with just one asterisk
  - the lenghts of each line is N, asterisks are centered on the line

- how do we want do to this?
  - idea 1: capability to draw a line with of length a with b centered diamonds is crucial
  - idea 2: start with the middlemost line. do a loop, on each iteration prepending and appending a line
  - idea 3: we want a diamond function that produces a string (display is separate)

=end

def diamond(size, outline: false)
  diamond = get_line(size, size, outline: outline)

  (size - 2).downto(1).select(&:odd?).each do |counter|
    diamond = wrap(diamond, get_line(size, counter, outline: outline))
  end

  puts "\n#{diamond}\n"
end

def wrap(string, other_string)
  other_string + string + other_string
end

def get_line(length_of_line, number_of_diamonds, outline: false)
  if outline && number_of_diamonds >= 2
    stars = '*' + (' ' * (number_of_diamonds - 2)) + '*'
  else
    stars = '*' * number_of_diamonds
  end
  stars.center(length_of_line) + "\n"
end

# examples
diamond(1)
diamond(1, outline: true)
diamond(3)
diamond(3, outline: true)
diamond(9)
diamond(9, outline: true)



# another solution: short and sweet (by Tetsuo Akaneya)

# def diamond(num)
#   num.times do |i|
#     size = num - (2 * i - num + 1).abs
#     puts ("*" * size).center(num)
#   end
# end

# Nick's solution:

# # normal diamond
# def diamond(n)
#   [*(1...n), *n.downto(1)].each { |i| puts ('*' * i).center(n) if i.odd? }
# end

# # outline diamond
# def diamond(n)
#   rows = [*(1...n), *n.downto(1)].select(&:odd?)
#   puts rows.map { |i| ('*' * i).gsub(/\*(\*+)\*/) { "*#{' ' * $1.size}*" }.center(n) }
# end
