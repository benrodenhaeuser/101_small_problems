module Raindrops
  SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def self.convert(number)
    @@number = number
    sound = ''
    SOUNDS.each_key do |number|
      sound << SOUNDS[number] if factors.include?(number)
    end
    sound = @@number.to_s if sound == ''
    sound
  end

  private

  def self.factors
    [3, 5, 7].select { |num| @@number % num == 0 }
  end
end

module BookKeeping
  VERSION = 3
end
