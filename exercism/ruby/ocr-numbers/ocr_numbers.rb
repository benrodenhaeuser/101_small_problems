class OcrNumbers
  DIGIT_HEIGHT = 4
  DIGIT_WIDTH = 3

  def self.convert(text)
    new(text).convert
  end

  def initialize(text)
    @text = text
    raise ArgumentError unless valid_text?
  end

  def convert
    @text
      .split("\n")
      .each_slice(DIGIT_HEIGHT)
      .map { |number| OcrNumber.new(number).convert }
      .join(',')
  end

  def valid_text?
    ((@text.scan(/\n/).count + 1) % DIGIT_HEIGHT).zero? &&
      @text.split("\n").all? do |segment|
        (segment.length % DIGIT_WIDTH).zero?
      end
  end

  class OcrNumber
    DICTIONARY =
      Hash.new { |hash, key| hash[key] = '?' }.merge!(
        " _ \n| |\n|_|\n   " => '0',
        "   \n  |\n  |\n   " => '1',
        " _ \n _|\n|_ \n   " => '2',
        " _ \n _|\n _|\n   " => '3',
        "   \n|_|\n  |\n   " => '4',
        " _ \n|_ \n _|\n   " => '5',
        " _ \n|_ \n|_|\n   " => '6',
        " _ \n  |\n  |\n   " => '7',
        " _ \n|_|\n|_|\n   " => '8',
        " _ \n|_|\n _|\n   " => '9'
      )

    def initialize(number)
      @number = number
      @number_of_digits = @number[0].length / DIGIT_WIDTH
    end

    def convert
      (0...@number_of_digits)
        .map { |n| DICTIONARY[digit_at(n)] }
        .join
    end

    def [](address)
      x, y = address
      @number[y][x]
    end

    def digit_at(n)
      addresses_for_digit_at(n)
        .map { |address| self[address] }
        .each_slice(DIGIT_WIDTH)
        .map(&:join)
        .join("\n")
    end

    def addresses_for_digit_at(n)
      (0...DIGIT_HEIGHT)
        .to_a
        .product((DIGIT_WIDTH * n...DIGIT_WIDTH * (n + 1)).to_a)
        .map(&:reverse)
    end
  end

  private_constant :OcrNumber
end
