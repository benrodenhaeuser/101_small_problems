class SumOfMultiples

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(upper_bound)
    multiples = []
    @numbers.each do |number|
      multiples += multiples(number, upper_bound)
    end
    multiples.uniq.inject(&:+).to_i
  end

  def multiples(multiplicand, upper_bound)
    (multiplicand..upper_bound - 1).select do |number|
      number % multiplicand == 0
    end
  end
end

module BookKeeping
  VERSION = 2
end
