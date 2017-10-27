class Game
  class BowlingError < StandardError; end

  FRAMES_PER_GAME = 10
  PINS_PER_FRAME = 10
  ROLLS_PER_FRAME = 2

  def initialize
    @current_frame = Frame.new(0)
    @scores = []
    @one_fill_frames = []
    @two_fill_frames = []
  end

  def roll(pins)
    raise BowlingError, "Can't roll #{pins} on #{self}: Is complete" if complete?
    raise BowlingError, "Can't roll #{pins} on #{self}: Can't be negative" if pins < 0

    @current_frame.roll(pins)

    (@one_fill_frames + @two_fill_frames).each { |fill| @scores[fill] += pins }
    @one_fill_frames = @two_fill_frames
    @two_fill_frames = []

    next_frame! if @current_frame.complete?
  end

  def score
    raise BowlingError, "Can't score #{self}: Is incomplete" unless complete?
    @scores.reduce(:+)
  end  

  private

  def complete?
    @current_frame.id >= FRAMES_PER_GAME && @one_fill_frames.empty? && @two_fill_frames.empty?
  end

  def next_frame!
    if @scores.size < FRAMES_PER_GAME
      @scores << @current_frame.score
      if @current_frame.rolls < ROLLS_PER_FRAME
        @two_fill_frames << @current_frame.id
      elsif @current_frame.score == PINS_PER_FRAME
        @one_fill_frames << @current_frame.id
      end
    end

    @current_frame = Frame.new(@current_frame.id + 1)
  end

  class Frame
    attr_reader :id, :rolls, :score

    def initialize(id)
      @id = id
      @rolls = 0
      @score = 0
    end

    def roll(pins)
      pins_up = PINS_PER_FRAME - @score
      raise BowlingError, "Can't roll #{pins} on #{self}: There are only #{pins_up} pins up" if pins > pins_up
      @rolls += 1
      @score += pins
    end

    def complete?
      @score == PINS_PER_FRAME || @rolls == ROLLS_PER_FRAME
    end
  end

  private_constant :Frame
end

module BookKeeping VERSION = 3 end
