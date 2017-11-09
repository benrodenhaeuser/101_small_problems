=begin

encoding:

- write the string to the matrix following the zig-zag path
- concatenate characters row by row

- write the string row by row (at locations given by zig-zag path)
- concatenate charcters following the zig-zag path

maybe it would be more useful to make the matrix an array of column-arrays:

the following example would be a four rails matrix with two chars. it consists of two length-four-arrays.

[
  [0,  [A,
   1,   B,
   2,   C,
   3],  D]
]

the advantage here is that each col has exactly one non-nil element.

so it's easy to read out a string, but also to record a string.

retrieving a string from the matrix:

def retrieve
  matrix.map { |col| col.find { |elem| elem } }.join
end

write a string to the matrix:

def record(string)
  matrix.map.with_index { |col, index| col.map { |elem| elem ? string[index] : elem } }
end

prepare the matrix:

def matrix
  # matrix of appropriate size with premarked zig-zag path
end


=end

class RailFenceCipher
  VERSION = 1

  def self.encode(string, rails)
    new(string, rails).encode
  end

  def self.decode(string, rails)
    new(string, rails).decode
  end

  def initialize(string, rails)
    @string = string
    @rails = rails
    @current_rail = 0
    @direction = :down
  end

  def encode
    encode_matrix.map(&:join).join
  end

  def decode
    matrix = decode_matrix
    plaintext = ''
    @current_rail = 0

    (0...@string.length).each do |col|
      plaintext[col] = matrix[@current_rail][col]
      @current_rail = next_rail
    end

    plaintext
  end

  private

  def encode_matrix
    (0...@string.length).each_with_object(empty_matrix) do |col, matrix|
      matrix[@current_rail][col] = @string[col]
      @current_rail = next_rail
    end
  end

  def decode_matrix
    matrix =
      (0...@string.length).each_with_object(empty_matrix) do |col, matrix|
        matrix[@current_rail][col] = true
        @current_rail = next_rail
      end

    string = @string

    matrix.each_with_index do |row, row_idx|
      row.each_index do |col|
        if matrix[row_idx][col] == true
          matrix[row_idx][col] = string[0]
          string = string[1..-1]
        end
      end
    end

    matrix
  end

  def empty_matrix
    matrix = []
    (0...@rails).each do |row|
      row = [nil] * @string.length
      matrix << row
    end
    matrix
  end

  def next_rail
    return @current_rail if @rails == 0
    change_direction if change_direction?
    @direction == :down ? @current_rail += 1 : @current_rail -= 1
  end

  def change_direction
    @direction == :down ? @direction = :up : @direction = :down
  end

  def change_direction?
    !(0...@rails).include?(next_rail_in_direction)
  end

  def next_rail_in_direction
    @direction == :down ? @current_rail + 1 : @current_rail - 1
  end

end

p RailFenceCipher.decode('ESXIEECSR', 4)
