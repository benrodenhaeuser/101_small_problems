# source: http://exercism.io/submissions/9cc87ce6845e4ee9940dbbfb7482cca2

# Whenever I see a grid like object that I need to index twice, I'll try and abstract away the grid such that I can index it using a method that checks that the indices are valid and that guarantees that it indexes correctly - preferably using x and y as that side-steps the issue of needing to think about whether the grid is stored row-first or col-first.

class Board
  def initialize(width, height)
    @width = width
    @height = height

    @cells = Array.new(width * height)
  end

  def [](x, y)
    fail ArgumentError if x < 0 || x >= @width
    fail ArgumentError if y < 0 || y >= @height
    @cells[x + y * @width] # what does this do?
  end
end
