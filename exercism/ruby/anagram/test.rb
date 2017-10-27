def triangle(one, two, three)
  is_valid_triangle?(one,two,three)
end

def is_valid_triangle?(one,two,three)
  sides = [one,two,three].sort
  if (sides[0] + sides[1] <= sides[2]) || (sides[0] == 0)
    return "invalid!"
  else
    which_triangle?(one,two,three)
  end
end

def which_triangle?(one,two,three)
  triangles = {equilateral: [60,60,60], isosceles: [0], scalene: [0]}
  angle_a = (Math.acos((two**2+three**2-one**2)/(2*two*three).to_f)*180/Math::PI).round(2)
  angle_b = (Math.acos((three**2+one**2-two**2)/(2*three*one).to_f)*180/Math::PI).round(2)
  angle_c = (Math.acos((one**2+two**2-three**2)/(2*one*two).to_f)*180/Math::PI).round(2)
  if angle_a && angle_b == 60
    return :equilateral, triangles[:equilateral]
  elsif angle_a != angle_b && angle_b != angle_c
    triangles[:scalene] = [angle_a, angle_b, angle_c]
    return triangles[:scalene]
  else
    triangles[:isosceles] = [angle_a, angle_b, angle_c]
    return triangles[:isosceles]
  end
end

p triangle(30,23,10)
p triangle(3,3,3)
p triangle(1.5,3,3)
p triangle(3,4,5)
p triangle(0,3,3)
p triangle(3,1,1)
