class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.dup # makes it impossible to read and mutate the internal state
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name
