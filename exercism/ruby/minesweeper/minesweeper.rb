class ValueError < ArgumentError; end

class Board
  def self.transform(input)
    new(input).transform
  end

  attr_reader :input

  def initialize(input)
    @input = input

    raise ValueError unless valid?
  end

  def valid?
    row_length = input[0].length
    input.slice(1...-1).all? do |row|
      row.length == row_length && row[0] == row[-1] && row[0] == '|' &&
        row.slice(1...-1).chars.all? { |char| [' ', '*'].include?(char) }
    end
  end

  def matrix
    @matrix ||= @input
      .slice(1...-1)
      .map(&:chars)
      .map { |row| row.slice(1...-1) }
      .map { |row| row.map { |marker| Square.new(marker) } }
  end

  def table
    @table ||= matrix
      .each_with_index
      .with_object({}) do |(row, row_idx), the_table|
        row.each_with_index do |square, col_idx|
          the_table[[row_idx, col_idx]] = square
        end
      end
  end

  def transform
    table
      .keys
      .select { |square| table[square].marker != '*' && mines(*square) > 0 }
      .each { |square| table[square].marker = mines(*square) }

    wrap(
      matrix.map do |row|
        wrap(row.map { |square| square.marker }.join, '|')
      end,
      [input.first]
    )
  end

  def mines(row_index, col_index)
    neighbors(row_index, col_index)
      .select { |neighbor| @table[neighbor].marker == '*' }
      .count
  end

  def neighbors(row_idx, col_idx)
    (row_idx - 1..row_idx + 1).to_a
      .product((col_idx - 1..col_idx + 1).to_a)
      .select { |square| @table[square] }
  end

  Square = Struct.new(:marker)

  def wrap(wrapped, wrapper)
    wrapper + wrapped + wrapper
  end
end
