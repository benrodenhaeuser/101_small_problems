class RailFenceMatrix
  attr_reader :by_row, :by_col

  def initialize(cols, rows)
    @cols = cols
    @rows = rows
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

  def empty_matrix
    [empty_row] * @rows

    # matrix = []
    # (0...@rows).each do |row|
    #   row = [nil] * @cols
    #   matrix << row
    # end
    # matrix
  end

  def empty_row
    [nil] * @cols
  end

  def on_path?(row, col)
    @rows == 1 || (row - col) % @cycle == 0 || (row + col) % @cycle == 0
  end
end

p RailFenceMatrix.new(5,3).zig_zag_matrix
