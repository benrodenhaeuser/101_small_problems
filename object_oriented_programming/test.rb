class Animal
  def initialize(name)
    @name = name
  end
end

class Mammal < Animal
  def initialize(name, age)
    super
    @age = age
  end
end

mammal = Mammal.new
