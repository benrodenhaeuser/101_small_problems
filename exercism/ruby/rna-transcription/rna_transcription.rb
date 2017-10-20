COMPLEMENTS = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }

module Complement
  def self.of_dna(dna)
    return '' if dna.gsub(/[GCTA]/, '') != ''
    dna.split('').map { |char| COMPLEMENTS[char] }.join
  end
end

module BookKeeping
  VERSION = 4
end
