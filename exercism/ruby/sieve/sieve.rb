class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    primes = (2..@number).to_a.product([true]).to_h

    (2..@number).each do |current_number|
      unless primes[current_number] == false
        multiples(current_number).each do |multiple|
          primes[multiple] = false
        end
      end
    end

    primes.keys.select { |num| primes[num] == true }
  end

  def multiples(some_number)
    multiples = []
    current_multiple = some_number * 2
    while current_multiple <= @number
      multiples << current_multiple
      current_multiple += some_number
    end
    multiples
  end
end

module BookKeeping
  VERSION = 1
end
