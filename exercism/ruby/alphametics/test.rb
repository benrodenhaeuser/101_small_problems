class Animal
  def initialize
    @status = 'alive'
  end
end

class Cat < Animal
  def status
    @status
  end
end

cat = Cat.new

cat.status #=> "alive"
