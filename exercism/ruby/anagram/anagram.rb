class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.select do |word|
      sorted(word.downcase) == sorted(@word) && word.downcase != @word
    end
  end

  def sorted(word)
    word.chars.sort.join
  end
end

module BookKeeping
  VERSION = 2
end
