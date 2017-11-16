class RailFenceCipher
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
    letter_slots(by_axis).each_with_index do |letter_slot, index|
      letter_slot.letter = @text[index]
    end
  end

  def retrieve_text(by_axis)
    letter_slots(by_axis).join
  end

  def letter_slots(by_axis)
    @matrix.send(by_axis).flat_map do |line|
      line.select { |cell| cell.respond_to?(:letter) }
    end
  end

  class RailFenceMatrix
    attr_reader :by_row, :by_col

    def initialize(rows, cols)
      @rows = rows
      @cols = cols

      @by_row = matrix_with_letter_slots
      @by_col = @by_row.transpose
    end

    private

    def matrix_with_letter_slots
      matrix = empty_matrix

      (0...@rows).each do |row|
        (0...@cols).each do |col|
          matrix[row][col] = LetterSlot.new if on_rail?(row, col)
        end
      end

      matrix
    end

    def empty_matrix
      (0...@rows).map { [nil] * @cols }
    end

    def on_rail?(row, col)
      cycle = (@rows * 2) - 2

      @rows == 1 ||
        ((row - col) % cycle).zero? ||
        ((row + col) % cycle).zero?
    end

    LetterSlot = Struct.new(:letter) do
      def to_s
        letter
      end
    end
  end

  private_constant :RailFenceMatrix
end
