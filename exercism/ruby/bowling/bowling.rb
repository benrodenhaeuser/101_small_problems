module BookKeeping
  VERSION = 3
end

class Game
  class BowlingError < ArgumentError; end

  attr_reader :round

  def initialize
    @round = Round.new
  end

  def roll(pins)
    raise BowlingError unless round.legal_roll?(pins)

    round.add_frame if round.need_new_frame?
    round.current_frame << pins
  end

  def score
    raise BowlingError unless round.complete?

    round.score
  end
end

class Round
  PINS_RANGE = (0..10)
  NON_TERMINAL_RANGE = (0..8)

  attr_reader :frames

  def initialize
    @frames = [RegularFrame.new]
  end

  def current_frame
    frames.last
  end

  def complete?
    have_ten_frames? && current_frame.complete?
  end

  def add_frame
    new_frame =
      (have_nine_frames? ? TerminalFrame : RegularFrame).new

    frames << new_frame
  end

  def legal_roll?(pins)
    in_range?(pins) && current_frame.legal?(pins)
  end

  def in_range?(pins)
    PINS_RANGE.include?(pins)
  end

  def have_nine_frames?
    frames.count == 9
  end

  def have_ten_frames?
    frames.count == 10
  end

  def need_new_frame?
    return false if have_ten_frames?
    current_frame.complete?
  end

  def score
    raw_score + bonus_score
  end

  def raw_score
    frames.map(&:raw_score).inject(&:+)
  end

  def bonus_score
    NON_TERMINAL_RANGE.inject(0) do |sum, idx|
      sum + bonus(idx)
    end
  end

  def bonus(idx)
    if frames[idx].strike?
      two_roll_bonus(idx)
    elsif frames[idx].spare?
      one_roll_bonus(idx)
    else
      0
    end
  end

  def one_roll_bonus(idx)
    frames[idx + 1].first_roll
  end

  def two_roll_bonus(idx)
    if frames[idx + 1].number_of_rolls >= 2
      frames[idx + 1].first_roll + frames[idx + 1].second_roll
    else
      frames[idx + 1].first_roll + frames[idx + 2].first_roll
    end
  end

  def <<(frame)
    frames << frame
  end

  def [](index)
    frames[index]
  end

  def to_s
    frames.map(&:to_s).to_s
  end
end

class Frame
  attr_accessor :rolls

  def initialize(pins = nil)
    self.rolls = []
    rolls << pins if pins
  end

  def raw_score
    rolls.inject(0, :+)
  end

  def strike?
    number_of_rolls >= 1 &&
    first_roll == 10
  end

  def double_strike?
    number_of_rolls >= 2 &&
    first_roll == 10 &&
    second_roll == 10
  end

  def spare?
    number_of_rolls >= 2 &&
    !strike? &&
    first_roll + second_roll == 10
  end

  def <<(pins)
    rolls << pins
  end

  def first_roll
    rolls[0]
  end

  def second_roll
    rolls[1]
  end

  def number_of_rolls
    rolls.count
  end

  def to_s
    rolls.to_s
  end
end

class RegularFrame < Frame
  def complete?
    case strike?
    when true then number_of_rolls == 1
    when false then number_of_rolls == 2
    end
  end

  def legal?(pins)
    return true if complete?
    raw_score + pins <= 10
  end
end

class TerminalFrame < Frame
  def complete?
    case strike? || spare?
    when true then number_of_rolls == 3
    when false then number_of_rolls == 2
    end
  end

  def legal?(pins)
    return false if complete?

    case number_of_rolls
    when 1
      strike? ||
      !strike? && first_roll + pins <= 10
    when 2
      spare? || double_strike? ||
        (strike? &&
          !double_strike? &&
          second_roll + pins <= 10)
    end
  end
end
