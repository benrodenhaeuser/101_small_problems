# first draft that passes all tests

class Frame
  attr_accessor :rolls

  def initialize(pins = false)
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

  def open?
    length == 2 && raw_score < 10
  end

  def full?
    open? || spare?
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
    merged.rolls = self.rolls + other_frame.rolls
    merged
  end

  def to_s
    rolls.to_s
  end
end

class Game
  class BowlingError < ArgumentError; end

  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(pins)
    raise BowlingError if illegal_throw?(pins)

    if need_new_frame?
      frames << Frame.new(pins)
    else
      frames.last << pins
    end
  end

  def illegal_throw?(pins)
    out_of_range?(pins) || illegal_extension?(pins) || complete?
  end

  def need_new_frame?
    frames.empty? ||
    frames[-1].strike? ||
    frames[-1].full?
  end

  def out_of_range?(pins)
    !(0..10).include?(pins)
  end

  def illegal_extension?(pins)
    !need_new_frame? && frames[-1].raw_score + pins > 10
  end

  def record(rolls)
    rolls.each { |pins| roll(pins) }
  end

  def raw_score
    frames.map(&:raw_score).inject(&:+)
  end

  def score
    raise BowlingError unless complete?

    bonus_score = 0

    frames[0..8].each_with_index do |frame, idx|
      if frame.strike?
        if frames[idx + 1].strike?
          bonus_score += frames[idx + 1].raw_score + frames[idx + 2].first
        else
          bonus_score += frames[idx + 1].raw_score
        end
      elsif frame.spare?
        bonus_score += frames[idx + 1].first
      end
    end

    raw_score + bonus_score
  end

  def complete?
    return false if normalized.length < 10
    terminal_frame_complete?
  end

  def terminal_frame_complete?
    terminal = normalized.last
    terminal.strike? && terminal.length == 3 ||
    terminal.spare? && terminal.length == 3 ||
    terminal.length == 2 && !terminal.spare? && !terminal.strike?
  end

  def normalized
    if frames.length > 10
      frames.dup[0..8] + [frames.dup[9..-1].reduce(&:merge)]
    else
      frames
    end
  end

  def to_s
    normalized.map(&:to_s).to_s
  end
end

module BookKeeping
  VERSION = 3
end
