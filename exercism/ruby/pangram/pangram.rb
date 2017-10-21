module Pangram
  def self.pangram?(string)
    to_match = ('a'..'z').to_a.join

    string.downcase.chars.each do |char|
      to_match.gsub!(char, '')
    end

    to_match == ''
  end
end

module BookKeeping
  VERSION = 5
end
