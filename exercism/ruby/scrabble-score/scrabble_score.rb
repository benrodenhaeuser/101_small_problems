class Scrabble
  def self.score(phrase)
    new(phrase).score
  end

  def initialize(phrase)
    @phrase = phrase || ''
    @letters = @phrase.downcase.chars
  end

  def score
    @letters.map { |letter| value(letter) }.sum
  end

  private

  def value(letter)
    scores = Hash.new { |hash, key| hash[key] = 0 }

    scores = scores.merge(
      {
        'a' => 1, 'b' => 3, 'c' => 3, 'd' => 2, 'e' => 1,
        'f' => 4, 'g' => 2, 'h' => 4, 'i' => 1, 'j' => 8,
        'k' => 5, 'l' => 1, 'm' => 3, 'n' => 1, 'o' => 1,
        'p' => 3, 'q' => 10, 'r' => 1, 's' => 1, 't' => 1,
        'u' => 1, 'v' => 4, 'w' => 4, 'x' => 8, 'y' => 4,
        'z' => 10
      }
    )

    scores[letter]
  end
end
