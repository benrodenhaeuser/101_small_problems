module BookKeeping
  VERSION = 4
end

class Acronym
  def self.abbreviate(phrase)
    phrase.scan(/[A-Z]+/i).map { |word| word[0].upcase }.join
  end
end
