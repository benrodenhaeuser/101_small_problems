class Hamming
  def self.compute(string1, string2)

    raise ArgumentError if string1.length != string2.length

    distance = 0

    0.upto(string1.length - 1) do |index|
      distance += 1 unless string1[index] == string2[index]
    end

    distance
  end
end

module BookKeeping
  VERSION = 3
end
