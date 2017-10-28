class Game
  include Enumerable
  attr_accessor :frames

  MIN_PINS = 0
  MAX_PINS = 10

  def initialize
    self.frames = []
  end

  def roll(pins)
    validate_game_in_progress
    validate_pins(pins)
    assign_extras(pins)
    add_frame if frame_needed?
    assign_roll(pins)
  end

  def score
    validate_game_complete
    reduce(:+)
  end

  def game_complete?
    (count == 10) &&
    !frames.last.need_roll? &&
    !frames.last.need_extra?
  end

  def each
    frames.each{ |f| yield f }
  end

  private

  def validate_game_in_progress
    if game_complete?
      raise StandardError, "Game is already complete."
    end
  end

  def validate_pins(pins)
    check_min(pins)
    check_max(pins)
  end

  def validate_game_complete
    if !game_complete?
      raise StandardError, "Cannot score incomplete game"
    end
  end

  def check_min(pins)
    if pins > MAX_PINS
      raise StandardError, "#{pins} pins is above max of #{MAX_PINS}"
    end
  end

  def check_max(pins)
    if pins < MIN_PINS
      raise StandardError, "#{pins} pins is below min of #{MIN_PINS}"
    end
  end

  def add_frame
    frames << Frame.new(next_frame_number)
  end

  def next_frame_number
    frames.last.number + 1 rescue 1
  end

  def frame_needed?
    count < 10 && !frames.last.need_roll? rescue true
  end

  def assign_roll(pins)
    frames.last.roll(pins) if frames.last.need_roll?
  end

  def assign_extras(pins)
    recent_two_frames.select{ |frame| frame.need_extra? }
                     .each{ |frame| frame.extra(pins) }
  end

  def recent_two_frames
    count <= 2 ? self : frames[-2..-1]
  end
end

class BookKeeping
  VERSION = 2
end

class Frame
  attr_accessor :roll_1, :roll_2, :extra_1, :extra_2, :number

  def initialize(number)
    self.number = number
  end

  def roll(pins)
    validate_roll(pins)
    !roll_1 ? self.roll_1 = pins : self.roll_2 = pins
  end

  def extra(pins)
    validate_extra(pins)
    !extra_1 ? self.extra_1 = pins : self.extra_2 = pins
  end

  def need_roll?
    !roll_2 && !strike?
  end

  def need_extra?
    (spare? && !extra_1) ||
    (strike? && !extra_2)
  end

  def score
    [roll_1, roll_2, extra_1, extra_2].compact.reduce(:+)
  end

  def +(other)
    self.score + other.score
  end

  def coerce(other)
    case other
    when Numeric
      return other, self.score
    else
      raise TypeError, "#{self.class} can't be coerced into #{other.class}"
    end
  end

  private
    def validate_extra(pins)
      if extra_1 &&
         extra_1 != 10 &&
         extra_1 + pins > 10
        raise StandardError, "Exceeds bonus maximum"
      end
    end

    def validate_roll(pins)
      if roll_1 && roll_1 + pins > 10
        raise StandardError, "Exceeds frame maximum"
      end
    end

    def strike?
      @strike ||= ( self.roll_1 == 10 )
    end

    def spare?
      @spare ||= ( [roll_1, roll_2].compact.reduce(:+) == 10 )
    end
end
