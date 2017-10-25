class Trinary
  TRIGITS = ['0', '1', '2']

  def initialize(tri_string)
    @trigits = tri_string.chars
  end

  def to_decimal
    return 0 unless valid?

    exponent = 0

    @trigits.reverse.reduce(0) do |sum, trigit|
      sum += trigit.to_i * (3 ** exponent)
      exponent += 1
      sum
    end
  end

  def valid?
    @trigits.select { |trigit| TRIGITS.include?(trigit) } == @trigits
  end
end

module BookKeeping
  VERSION = 1
end
