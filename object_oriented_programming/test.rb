class Animal

  def to_s
    10
  end

end

animal = Animal.new
puts animal #=> #<Animal:0x007fa78d04cce8>

class Animal

  def to_s
    "animal!"
  end

end

animal = Animal.new
puts animal #=> # animal!
