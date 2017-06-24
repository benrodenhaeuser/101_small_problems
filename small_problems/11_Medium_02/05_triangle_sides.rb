# Triangle sides

=begin
A triangle is classified as follows:
- equilateral All 3 sides are of equal length
- isosceles 2 sides are of equal length, while the 3rd is different
- scalene All 3 sides are of different length

To be a valid triangle,
- the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and
- all sides must have lengths greater than 0.

if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
=end

def triangle(side1, side2, side3)
  tri = [side1, side2, side3].sort

  unless tri[0] + tri[1] > tri[2] && (0..2).all? { |index| tri[index] > 0 }
    return :invalid
  end

  case
  when tri[0] == tri[1] && tri[1] == tri[2] && tri[0] == tri[2]
    type = :equilateral
  when tri[0] == tri[1] || tri[1] == tri[2] || tri[0] == tri[2]
    type = :isosceles
  when tri[0] != tri[1] && tri[1] != tri[2] && tri[0] != tri[2]
    type = :scalene
  end

  type
end

# observation: the type of the triangle is determined by the number of distinct sides
# so we can simplify the code:

def triangle(side1, side2, side3)
  tri = [side1, side2, side3].sort

  unless tri[0] + tri[1] > tri[2] && tri.all?(&:positive?)
    return :invalid
  end

  case
  when tri.uniq.size == 1 then type = :equilateral
  when tri.uniq.size == 2 then type = :isosceles
  when tri.uniq.size == 3 then type = :scalene
  end

  type
end

# and perhaps simply doing if ... elsif ... is the best way here:

def triangle(a, b, c)
  tri = [a, b, c].sort
  if tri[0] + tri[1] <= tri[2] || !tri.all?(&:positive?)
    :invalid
  elsif tri.uniq.size == 1
    :equilateral
  elsif tri.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
