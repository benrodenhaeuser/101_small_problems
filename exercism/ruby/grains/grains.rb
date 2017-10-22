module Grains
  def self.square(number)
    raise ArgumentError unless (1..64).include?(number)

    (1..number).reduce { |sum, _| sum * 2 }
  end

  def self.total
    (1..64).reduce { |total, number| total + square(number) }
  end
end

module BookKeeping
  VERSION = 1
end
