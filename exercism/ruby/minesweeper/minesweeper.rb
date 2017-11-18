class ValueError < ArgumentError; end

class Board
  MINE = '*'.freeze
  LAND = ' '.freeze
  BORDER = '|'.freeze

  def self.transform(input)
    new(input).transform
  end

  def initialize(input)
    @input = input
    @width = @input[0].length
    @height = @input.length

    raise ValueError unless valid_input?
  end

  def transform
    addresses
      .select { |address| self[address].marker == LAND && mines(address) > 0 }
      .each { |address| self[address].marker = mines(address) }

    grid.map { |row| row.map(&:marker).join }
  end

  private

  def grid
    @grid ||= @input
              .map(&:chars)
              .map { |row| row.map { |marker| Square.new(marker) } }
  end

  Square = Struct.new(:marker)

  def addresses
    @addresses ||= (0...@width).to_a.product((0...@height).to_a)
  end

  def [](address)
    x, y = address
    return nil if x < 0 || x >= @width
    return nil if y < 0 || y >= @height
    grid[y][x]
  end

  def mines(address)
    neighbors(address)
      .select { |neighbor| self[neighbor].marker == MINE }
      .count
  end

  def neighbors(address)
    x, y = address
    (x - 1..x + 1).to_a.product((y - 1..y + 1).to_a)
  end

  def valid_input?
    @input[1...-1].all? do |row|
      row.length == @width &&
        row[0] == BORDER && row[-1] == BORDER &&
        row[1...-1].chars.all? do |char|
          [' ', '*'].include?(char)
        end
    end
  end
end
