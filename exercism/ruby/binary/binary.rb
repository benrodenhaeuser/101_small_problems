module Binary
  def self.to_decimal(binary_string)
    bits = binary_string.chars
    raise ArgumentError unless valid?(bits)
    exponent = 0
    decimal = 0

    while !bits.empty?
      decimal += bits.pop.to_i * (2 ** exponent)
      exponent += 1
    end

    decimal
  end

  def self.valid?(bits)
    bits.all? { |bit| ['0', '1'].include?(bit) }
  end
end

module BookKeeping
  VERSION = 3
end
