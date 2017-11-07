module BookKeeping
  VERSION = 2
end

class Queens
  def initialize(white: nil, black: nil)
    @white = Queen.new(white) if white
    @black = Queen.new(black) if black
  end

  def attack?
    same_row? || same_col? || same_main_diag? || same_counter_diag?
  end

  def same_row?
    @white.row == @black.row
  end

  def same_col?
    @white.col == @black.col
  end

  def same_main_diag?
    @white.row - @white.col == @black.row - @black.col
  end

  def same_counter_diag?
    @white.row + @white.col == @black.row + @black.col
  end

  private

  class Queen
    ROWS = (0..7)
    COLS = (0..7)

    attr_reader :row, :col

    def initialize(position)
      @row = position.first
      @col = position.last

      raise ArgumentError unless valid?
    end

    def valid?
      ROWS.include?(row) && COLS.include?(col)
    end
  end

  private_constant :Queen
end
