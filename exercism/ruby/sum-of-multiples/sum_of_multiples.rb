class SumOfMultiples

  def initialize(*factors)
    @factors = factors
  end

  def to(upper_bound)
    multiples = (0...upper_bound).select do |number|
      multiple?(number)
    end

    multiples.inject(:+).to_i
  end

  def multiple?(number)
    @factors.any? { |factor| number % factor == 0 }
  end
end

module BookKeeping
  VERSION = 2
end
