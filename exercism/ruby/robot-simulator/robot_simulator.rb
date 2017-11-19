class Robot
  def bearing
    @direction.current
  end

  def orient(direction)
    @direction = Direction.new(direction)
  end

  def turn_right
    @direction.right
  end

  def turn_left
    @direction.left
  end

  def coordinates
    @coordinates.current
  end

  def at(x, y)
    @coordinates = Coordinates.new(x, y)
  end

  def advance
    @coordinates.shift_into(@direction.current)
  end

  class Direction
    def initialize(direction)
      @directions = [:north, :east, :south, :west]

      raise ArgumentError unless @directions.include?(direction)

      @directions.rotate! until current == direction
    end

    def current
      @directions[0]
    end

    def right
      @directions.rotate!
    end

    def left
      @directions.rotate!(-1)
    end
  end

  class Coordinates
    def initialize(x, y)
      @x = x
      @y = y
    end

    def current
      @current ||= [@x, @y]
    end

    def shift_into(direction)
      case direction
      when :north then @y += 1
      when :east then @x += 1
      when :south then @y -= 1
      when :west then @x -= 1
      end
    end
  end

  private_constant :Direction, :Coordinates
end

class Simulator
  COMMAND_TO_SYM =
    { 'A' => :advance, 'L' => :turn_left, 'R' => :turn_right }.freeze

  def instructions(commands)
    @instructions = commands.chars.map do |command|
      COMMAND_TO_SYM[command]
    end
  end

  def place(robot, parameters)
    robot.at(parameters[:x], parameters[:y])
    robot.orient(parameters[:direction])
  end

  def evaluate(robot, command)
    instructions(command).each do |instruction|
      robot.send(instruction)
    end
  end
end
