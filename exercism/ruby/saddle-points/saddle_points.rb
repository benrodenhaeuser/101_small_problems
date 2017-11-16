class Matrix
  attr_reader :rows, :columns

  def initialize(input)
    @rows = parse(input)
    @columns = transpose
  end

  def saddle_points
    index_pairs.select do |row_idx, col_idx|
      saddle_point?(row_idx, col_idx)
    end
  end

  private

  def transpose
    number_of_cols = @rows[0].count
    (0...number_of_cols).map do |col_idx|
      @rows.map { |row| row[col_idx] }
    end
  end

  def saddle_point?(row_idx, col_idx)
    value = rows[row_idx][col_idx]
    row, column = rows[row_idx], columns[col_idx]
    row.max == value && column.min == value
  end

  def parse(input)
    input.split("\n").map do |row|
      row.split(' ').map(&:to_i)
    end
  end

  def index_pairs
    (0...rows.count).to_a.product((0...columns.count).to_a)
  end
end
