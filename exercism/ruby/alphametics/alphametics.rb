module BookKeeping
  VERSION = 4
end

class Alphametics
  def self.solve(input)
    new(input).solve || {}
  end

  def initialize(input)
    @input = input
    words = @input.split(/ \+ | == /)
    @word_initial_chars = words.map { |word| word[0] }.uniq
    remaining_chars = words.flat_map { |word| word[1..-1].chars }
    @chars = (@word_initial_chars + remaining_chars).uniq
  end

  def solve
    target_digits =
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        .permutation(@chars.count)
        .select { |digits| no_word_initial_zeros?(digits) }
        .find { |digits| solution?(digits) }

    target_digits ? mapping(target_digits) : nil
  end

  private

  def mapping(digits)
    @chars.zip(digits).to_h
  end

  def solution?(digits)
    eval(substitute(digits))
  end

  def substitute(digits)
    output = @input.dup

    digits.each_index do |index|
      output.gsub!(@chars[index], digits[index].to_s)
    end

    output
  end

  def no_word_initial_zeros?(digits)
    !digits[0...@word_initial_chars.count].include?(0)
  end
end
