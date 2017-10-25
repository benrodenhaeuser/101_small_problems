module ETL
  SCRABBLE_SCORE_RANGE = (1..10)

  def self.transform(hash)
    scores = {}
    SCRABBLE_SCORE_RANGE.each do |score|
      hash[score].to_a.each do |char|
        scores[char.downcase] = score
      end
    end
    scores
  end
end

module BookKeeping
  VERSION = 1
end
