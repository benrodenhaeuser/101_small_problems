class ValueError < ArgumentError; end

class Board
  def self.transform(input)
    new(input).transform
  end

  attr_reader :input

  def initialize(input)
    @input = input
    @width = rows[0].length
    @height = rows.length

    raise ValueError unless valid?
  end

  def transform
    index_pairs
      .select { |pair| self[*pair].marker != '*' && mines(*pair) > 0 }
      .each { |pair| self[*pair].marker = mines(*pair) }

    wrap(
      rows.map do |row|
        wrap(row.map { |square| square.marker }.join, '|')
      end,
      [input.first]
    )
  end

  private

  def valid?
    input.slice(1...-1).all? do |row|
      row.length == @width + 2 && row[0] == row[-1] && row[0] == '|' &&
        row.slice(1...-1).chars.all? { |char| [' ', '*'].include?(char) }
    end
  end

  def rows
    @rows ||= input
      .slice(1...-1)
      .map(&:chars)
      .map { |row| row.slice(1...-1) }
      .map { |row| row.map { |marker| Square.new(marker) } }
  end

  def squares
    @squares ||= rows.flatten
  end

  def index_pairs
    @index_pairs ||= (0...@width).to_a.product((0...@height).to_a)
  end

  def [](x, y)
    return nil if x < 0 || x >= @width
    return nil if y < 0 || y >= @height
    squares[x + y * @width]
  end

  def mines(x, y)
    neighbors(x, y)
      .select { |neighbor| self[*neighbor].marker == '*' }
      .count
  end

  def neighbors(x, y)
    (x - 1..x + 1).to_a
      .product((y - 1..y + 1).to_a)
      .select { |pair| self[*pair] }
  end

  Square = Struct.new(:marker)

  def wrap(wrapped, wrapper)
    wrapper + wrapped + wrapper
  end
end
