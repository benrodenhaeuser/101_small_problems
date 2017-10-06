class Pet
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = '42'
fluffy = Pet.new(name)
name = (name.to_i + 1).to_s # reassignment!
puts fluffy.name # 42
puts fluffy # My name is 42.
puts fluffy.name # 42.
puts name # 43
