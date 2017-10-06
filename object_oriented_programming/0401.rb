class Person
  def name=(value)
    @name = value
  end

  def name
    @name
  end

end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
