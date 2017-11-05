module BookKeeping
  VERSION = 4
end

class Alphametics
  def self.solve(input)
    all_chars = input.scan(/[A-Z]/).uniq

    words = input.split(/ \+ | == /)
    initial_chars = words.map { |word| word[0] }.uniq

    chars = (initial_chars + all_chars).uniq

    digits = (0..9).to_a
    digits.permutation(chars.count)
      .select { |permu| !permu[0...initial_chars.count].include?(0) }
      .each do |permu|
        return self.mapping(chars, permu) if self.solution?(input, chars, permu)
      end

    nil.to_h
  end

  def self.mapping(chars, permu)
    chars.zip(permu).to_h
  end

  def self.solution?(input, chars, permu)
    substitution = self.substitute(input, chars, permu)
    eval substitution
  end

  def self.substitute(input, chars, permu)
    output = input.dup

    chars.each_index do |index|
      output.gsub!(chars[index], permu[index].to_s)
    end

    output
  end
end
