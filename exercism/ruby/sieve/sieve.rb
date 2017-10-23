require 'set'

class Sieve
  def initialize(number)
    @number = number
  end

  def primes
    primes = Set.new(2..@number)

    primes.each do |current_number|
      multiples(current_number).each do |multiple|
        primes.delete(multiple)
      end
    end

    primes.to_a
  end

  def multiples(some_number)
    (some_number + 1..@number).select do |num|
      multiple?(num, some_number)
    end
  end

  def multiple?(num1, num2)
    num1 % num2 == 0
  end
end

module BookKeeping
  VERSION = 1
end
