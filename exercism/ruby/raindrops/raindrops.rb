module Raindrops
  def self.convert(number)
    @@number = number
    sound = ''
    sound << 'Pling' if factors.include?(3)
    sound << 'Plang' if factors.include?(5)
    sound << 'Plong' if factors.include?(7)
    sound = @@number.to_s if sound == ''
    sound
  end

  private

  def self.factors
    [3, 5, 7].select { |num| @@number % num == 0 }
  end
end

p Raindrops.convert(1)

module BookKeeping
  VERSION = 3
end
