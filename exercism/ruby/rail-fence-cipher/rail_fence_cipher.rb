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
