class Nucleotide

  def self.from_dna(strand)
    raise ArgumentError unless strand.scan(/[ATCG]/).join == strand
    new(strand)
  end

  def initialize(strand)
    @strand = strand
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  def histogram
    histogram = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    @strand.chars.each_with_object(histogram) do |nucleotide|
      histogram[nucleotide] += 1
    end
  end
end
