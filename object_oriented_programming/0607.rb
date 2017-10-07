class Owner
  attr_reader :name
  attr_accessor :pets

  def initialize(name)
    @name = name # collaborator object: string
    @pets = [] # collaborator object: array of pets
  end

  def print_pets
    @pets.each { |pet| puts pet }
  end

  def number_of_pets
    @pets.size
  end

end

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type # collaborator object: string
    @name = name # collaborator: string
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Shelter
  def initialize
    @adopters = {}
  end

  def adopt(adopter, adopted)
    adopter.pets << adopted
    @adopters[adopter] = true # collaborator: hash with owner object keys
  end

  def print_adoptions
    @adopters.each_key do |adopter|
      if adopter.name == "The Animal Shelter"
        puts "#{adopter.name} has the following unadopted pets:"
      else
        puts "#{adopter.name} has adopted the following pets:"
      end
      adopter.print_pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
the_shelter = Owner.new('The Animal Shelter')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(the_shelter, asta)

shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{the_shelter.name} has #{the_shelter.number_of_pets} unadopted pets."
