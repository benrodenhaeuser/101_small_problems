class OcrNumbers
  def self.convert(text)
    new(text).convert
  end

  def initialize(text)
    @text = text
    raise ArgumentError unless valid_text?
  end

  def convert
    numbers
      .map(&:convert)
      .join(',')
  end

  def numbers
    @text
      .split("\n")
      .each_slice(4)
      .map do |number|
        OcrNumber.new(number)
      end
  end

  def valid_text?
    ((@text.scan(/\n/).count + 1) % 4).zero? &&
      @text.split("\n").all? { |segment| (segment.length % 3).zero? }
  end
end

class OcrNumber
  MATCHER = Hash.new { |hash, key| hash[key] = '?' }.merge!(
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
  end

  def convert
    digits
      .map { |digit| MATCHER[digit] }
      .join
  end

  def digits
    (0...number_of_digits).map do |n|
      digit_at(n)
    end
  end

  def number_of_digits
    @number[0].length / 3
  end

  def digit_at(n)
    addresses_by_row
      .select { |address| (n * 3..(n * 3 + 2)).cover?(address.first) }
      .map { |address| self[address] }
      .each_slice(3)
      .map(&:join)
      .join("\n")
  end

  def addresses_by_row
    (0...@number.length)
      .to_a
      .product((0...@number[0].length).to_a)
      .map(&:reverse)
  end

  def [](address)
    x, y = address
    @number[y][x]
  end
end

module BookKeeping
  VERSION = 1
end
