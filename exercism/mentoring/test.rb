class Sieve
  MIN_NUMBER = 2

  def initialize(n)
    @max_number = n
  end

  def primes
    sieve = (MIN_NUMBER..@max_number).to_a
    (MIN_NUMBER..@max_number).each do |number1|
      (number1 + 1..@max_number).each do |number2|
        sieve.delete(number2) if number2 % number1 == 0
      end
    end
    sieve
  end
end

p Sieve.new(10).primes # [2, 3, 5, 7]
