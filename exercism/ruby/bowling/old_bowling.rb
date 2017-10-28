module BookKeeping
  VERSION = 3
end

class Game
  class BowlingError < ArgumentError; end # ok

  attr_reader :frames # ok

  def initialize # ok
    @frames = Frames.new
  end

  def roll(pins) # ok
    raise BowlingError if frames.illegal_throw?(pins)

    frames.add_empty_frame if frames.need_new_frame?
    frames.current_frame << pins
  end

  def score
    raise BowlingError unless frames.complete?

    bonus_scores = frames[0..8].map.with_index do |frame, idx|
      if frame.strike?
        if frames[idx + 1].strike?
          frames[idx + 1].raw_score + frames[idx + 2].first
        else
          frames[idx + 1].raw_score
        end
      elsif frame.spare?
        frames[idx + 1].first
      else
        0
      end
    end

    bonus_scores.inject(:+) + frames.raw_score
  end
end

class Frames
  attr_reader :frames

  def initialize # OK
    @frames = []
  end

  def to_s # OK
    normalized.map(&:to_s).to_s
  end

  def current_frame # OK
    frames.last
  end

  def illegal_throw?(pins) # OK
    out_of_range?(pins) || illegal_frame_extension?(pins) || complete?
  end

  def need_new_frame? # OK
    frames.empty? ||
    current_frame.strike? ||
    current_frame.length == 2
  end

  def add_empty_frame # OK
    frames << Frame.new
  end

  def out_of_range?(pins) # OK
    !(0..10).include?(pins)
  end

  def illegal_frame_extension?(pins) # OK
    !need_new_frame? && (current_frame.raw_score + pins) > 10
  end

  def raw_score # OK
    frames.map(&:raw_score).inject(&:+)
  end

  def complete? # not needed anymore
    return false if normalized.length < 10
    terminal_frame_complete?
  end

  def terminal_frame_complete? # not needed anymore
    terminal = normalized.last
    terminal.strike? && terminal.length == 3 ||
    terminal.spare? && terminal.length == 3 ||
    terminal.length == 2 && !terminal.spare? && !terminal.strike?
  end

  def normalized # not needed anymore
    if frames.length > 10
      frames[0..8] + [frames[9..-1].reduce(&:merge)]
    else
      frames
    end
  end

  def <<(frame) # OK
    frames << frame
  end

  def [](index) # OK
    frames[index]
  end
end

class Frame
  attr_accessor :rolls

  def initialize(pins = nil)
    self.rolls = []
    rolls << pins if pins
  end

  def raw_score
    rolls.inject(:+)
  end

  def strike?
    length >= 1 && first == 10
  end

  def spare?
    length >= 2 && !strike? && first + second == 10
  end

  def <<(pins)
    rolls << pins
  end

  def first
    rolls[0]
  end

  def second
    rolls[1]
  end

  def length
    rolls.length
  end

  def merge(other_frame)
    merged = Frame.new
    merged.rolls = rolls + other_frame.rolls
    merged
  end

  def to_s
    rolls.to_s
  end
end
