=begin

given a number, print a star of the appropriate size.

how do stars look like?

- given number
- height of the star: number
- a star has a center line. length of that line: number, number of stars: number
- all the other lines have 3 stars
- the distance between the stars increases with distance from the center line
- immediately adjacent to the center, the distance is 0
- next, it's one

algorithm:
- start with star = center_line(number)
- repeatedly wrap the star in two enclosing lines (loop)
  - initially, distance is 0
  - increment distance between stars in each loop
  - when does loop stop? number / 2
- print the result

=end


def center_line(length)
  '*' * length + "\n"
end

def line(distance, length)
  "*#{' ' * distance}*#{' ' * distance}*".center(length) + "\n"
end

def wrap(string, other_string)
  other_string + string + other_string
end

def star(number)
  star = center_line(number)
  distance = 0

  (number / 2).times do
    star = wrap(star, line(distance, number))
    distance += 1
  end

  puts star
end

star(7)
puts
star(9)
puts
star(11)
