class Pangram
  def self.pangram?(sentence)
    # return false if sentence.empty?
    sentence.match?(/[[:ascii:]]{#{sentence.length}}/) && \
      sentence.downcase.scan(/[a-z]/).uniq.sort == ('a'..'z').map { |letter| letter }
  end
end

p Pangram.pangram?("")
