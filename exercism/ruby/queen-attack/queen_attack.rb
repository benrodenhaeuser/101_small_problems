class Queens
  BLACK_QUEEN_MARKER = 'B'
  WHITE_QUEEN_MARKER = 'W'
  EMPTY_MARKER = '_'
  BLANK = ' '
  NEWLINE = "\n"

  def initialize(white: nil, black: nil)
    raise ArgumentError if !white.nil? && white == black

    @white = WhiteQueen.new(white)
    @black = BlackQueen.new(black)
  end

  def white
    [@white.row, @white.col]
  end

  def black
    [@black.row, @black.col]
  end

  def attack?
    same_row? || same_col? || same_main_diag? || same_counter_diag?
  end

  def to_s
    board = Position::ROWS.map { [EMPTY_MARKER] * Position::COLS.count }
    board[@black.row][@black.col] = BLACK_QUEEN_MARKER
    board[@white.row][@white.col] = WHITE_QUEEN_MARKER
    board.map { |row| row.join(BLANK) }.join(NEWLINE)
  end

  private

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

  class Position
    ROWS = (0..7)
    COLS = (0..7)

    attr_reader :row, :col

    def initialize(position)
      raise ArgumentError unless valid?(position.first, position.last)

      @row = position.first
      @col = position.last
    end

    def valid?(row, col)
      ROWS.include?(row) && COLS.include?(col)
    end
  end

  class WhiteQueen < Position
    DEFAULT_POSITION = [0, 3]

    def initialize(position)
      return super if position
      @row, @col = DEFAULT_POSITION
    end
  end

  class BlackQueen < Position
    DEFAULT_POSITION = [7, 3]

    def initialize(position)
      return super if position
      @row, @col = DEFAULT_POSITION
    end
  end

  private_constant :Position, :BlackQueen, :WhiteQueen
end
