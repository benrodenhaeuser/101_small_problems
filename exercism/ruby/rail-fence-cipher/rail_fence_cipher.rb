class RailFenceCipher
  VERSION = 1

  def self.encode(text, rails)
    new(text, rails).encode
  end

  def self.decode(text, rails)
    new(text, rails).decode
  end

  def initialize(text, rails)
    @text = text
    @matrix = RailFenceMatrix.new(rails, @text.length)
  end

  def encode
    record_text(:by_col)
    retrieve_text(:by_row)
  end

  def decode
    record_text(:by_row)
    retrieve_text(:by_col)
  end

  private

  def record_text(by_axis)
    slots_on_path(by_axis).each_with_index do |slot, index|
      slot << @text[index]
    end
  end

  def retrieve_text(by_axis)
    slots_on_path(by_axis).join
  end

  def slots_on_path(by_axis)
    @matrix.send(by_axis).flat_map do |slots|
      slots.select { |slot| slot }
    end
  end

  class RailFenceMatrix
    attr_reader :by_row, :by_col

    def initialize(rows, cols)
      @rows = rows
      @cols = cols
      @cycle = (@rows * 2) - 2

      @by_row = zig_zag_matrix
      @by_col = @by_row.transpose
    end

    def zig_zag_matrix
      matrix = empty_matrix

      (0...@rows).each do |row|
        (0...@cols).each do |col|
          matrix[row][col] = '' if on_path?(row, col)
        end
      end

      matrix
    end

    private

    def empty_matrix
      (0...@rows).map { |row| [nil] * @cols }
    end

    def on_path?(row, col)
      @rows == 1 ||
        (row - col) % @cycle == 0 ||
        (row + col) % @cycle == 0
    end
  end

  private_constant :RailFenceMatrix
end
