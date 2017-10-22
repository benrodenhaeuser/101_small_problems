class Phrase

  def initialize(sentence)
    @words = split(sentence)
  end

  def word_count
    counts = Hash.new { |hash, key| hash[key] = 0 }
    @words.each { |word| counts[word] += 1 }
    counts
  end

  private

  def split(sentence)
    sentence.gsub(/\s'|'\s|[^A-Z0-9']/i, ' ').downcase.split
  end
end

module BookKeeping
  VERSION = 1
end
