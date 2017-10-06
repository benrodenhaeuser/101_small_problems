class Person
  def name=(val)
    @first_name, @last_name = val.split
  end

  def name
    @first_name + " " + @last_name
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name
