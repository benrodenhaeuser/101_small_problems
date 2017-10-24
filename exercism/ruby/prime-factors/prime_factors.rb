module PrimeFactors
  def self.for(number)
    factors = []

    while number > 1
      factor = (2..number).find { |num| number % num == 0 }
      factors << factor
      number = number / factor
    end

    factors
  end
end
