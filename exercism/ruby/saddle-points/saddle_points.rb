class Matrix
  attr_reader :rows, :columns

  def initialize(input)
    @rows = parse(input)
    @columns = @rows.transpose
  end

  def saddle_points
    cells.select { |row_idx, col_idx| saddle_point?(row_idx, col_idx) }
  end

  private

  def saddle_point?(row_idx, col_idx)
    rows[row_idx].max == rows[row_idx][col_idx] &&
      columns[col_idx].min == rows[row_idx][col_idx]
  end

  def parse(input)
    input.split("\n").map { |row| row.split(' ').map(&:to_i) }
  end

  def cells
    (0...rows.count).to_a.product((0...columns.count).to_a)
  end
end
