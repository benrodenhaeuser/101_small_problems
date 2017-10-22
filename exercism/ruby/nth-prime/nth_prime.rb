class Prime

  def self.nth(n)
    raise ArgumentError if n < 1

    list = [2]
    current_prime = 2

    until list[n - 1]
      next_prime = current_prime + 1

      loop do
        break if list.all? { |number| next_prime % number != 0 }
        next_prime += 1
      end

      list << next_prime
      current_prime = next_prime
    end

    list[n - 1]
  end

end

module BookKeeping
  VERSION = 1
end
