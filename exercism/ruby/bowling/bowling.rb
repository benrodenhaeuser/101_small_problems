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
    round.add(pins)
  end

  def score
    raise BowlingError unless round.done?
    round.score
  end
end

class Round
  attr_reader :frames

  def initialize
    @frames = [RegularFrame.new]
  end

  def current_frame
    frames.last
  end

  def legal_roll?(pins)
    current_frame.legal_roll?(pins)
  end

  def done?
    have_all_frames? && current_frame.done?
  end

  def add(pins)
    add_frame if need_new_frame?
    current_frame << pins
  end

  def add_frame
    new_frame =
      (next_frame_terminal? ? TerminalFrame : RegularFrame).new

    frames << new_frame
  end

  def next_frame_terminal?
    frames.count == 9
  end

  def have_all_frames?
    frames.count == 10
  end

  def need_new_frame?
    return false if have_all_frames?
    current_frame.done?
  end

  def score
    raw_score + bonus_score
  end

  def raw_score
    frames.map(&:raw_score).inject(&:+)
  end

  def bonus_score
    (0..8).inject(0) { |sum, idx| sum + bonus(idx) }
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
end

class Frame
  PINS_RANGE = (0..10)

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
end

class RegularFrame < Frame
  def done?
    case strike?
    when true then number_of_rolls == 1
    when false then number_of_rolls == 2
    end
  end

  def legal_roll?(pins)
    return false if !PINS_RANGE.include?(pins)
    return true if done?

    PINS_RANGE.include?(raw_score + pins)
  end
end

class TerminalFrame < Frame
  def done?
    case strike? || spare?
    when true then number_of_rolls == 3
    when false then number_of_rolls == 2
    end
  end

  def legal_roll?(pins)
    return false if done? || !PINS_RANGE.include?(pins)

    case number_of_rolls
    when 1
      strike? ||
        !strike? && PINS_RANGE.include?(first_roll + pins)
    when 2
      spare? || double_strike? ||
        (strike? &&
          !double_strike? &&
            PINS_RANGE.include?(second_roll + pins))
    end
  end
end
