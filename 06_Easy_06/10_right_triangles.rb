=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

triangle(5)

    *
   **
  ***
 ****
*****


=> 5 lines
=> lenght of each is line is 5
=> bottom line has 5 stars
=> fourth line has 4 stars
=> third line has 3 stars
=> second line has 2 stars
=> first line has 1 stars

approach:
- write method `make_stars` that returns a strin of length len with x right-aligned stars
- main method:

  given `number`

  number_of_stars = 1
  while number_of_stars <= number
    puts make_stars(number, number_of_stars)
    number_of_stars += 1
  end

- make_stars method:

  given `length_of_line` and `number_of_stars`

  stars = ''
  number_of_stars.times { stars << '*' }
  stars.rjust(length_of_line)

=end

def make_stars(length_of_line, number_of_stars)
  stars = '*' * number_of_stars
  stars.rjust(length_of_line)
end

def triangle(number)
  number_of_stars = 1
  while number_of_stars <= number
    puts make_stars(number, number_of_stars)
    number_of_stars += 1
  end
end

triangle(5)
triangle(9)
