class Game
  class BowlingError < RuntimeError; end

  attr_reader :round

  def initialize
    @round = Round.new
  end

  def roll(pins)
    raise BowlingError unless round.legal_roll?(pins)
    round.roll(pins)
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

  def roll(pins)
    current_frame << pins
    previous_frames.select(&:need_bonus?).each do |frame|
      frame.bonus << pins
    end
    add_frame if need_new_frame?
  end

  def current_frame
    frames.last
  end

  def previous_frames
    frames[0...-1]
  end

  def legal_roll?(pins)
    current_frame.legal_roll?(pins)
  end

  def done?
    current_is_tenth_frame? && current_frame.done?
  end

  def add_frame
    frames << new_empty_frame
  end

  def new_empty_frame
    (next_is_tenth_frame? ? TenthFrame : RegularFrame).new
  end

  def next_is_tenth_frame?
    frames.count == 9
  end

  def current_is_tenth_frame?
    frames.count == 10
  end

  def need_new_frame?
    !current_is_tenth_frame? && current_frame.done?
  end

  def score
    frames.map(&:raw_score).sum + frames.map(&:bonus_score).sum
  end
end

class Frame
  PINS_RANGE = (0..10)

  attr_accessor :rolls, :bonus

  def initialize(pins = nil)
    @rolls = []
    @bonus = []

    rolls << pins if pins
  end

  def within_pin_range?(pins)
    PINS_RANGE.include?(pins)
  end

  def raw_score
    rolls.sum(0)
  end

  def bonus_score
    bonus.sum(0)
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
    strike? || number_of_rolls == 2
  end

  def legal_roll?(pins)
    return false unless within_pin_range?(pins)
    within_pin_range?(raw_score + pins)
  end

  def need_bonus?
    strike? && @bonus.count < 2 || spare? && @bonus.count < 1
  end
end

class TenthFrame < Frame
  def done?
    (strike? || spare?) && number_of_rolls == 3 ||
      (!strike? && !spare?) && number_of_rolls == 2
  end

  def legal_roll?(pins)
    return false unless !done? && within_pin_range?(pins)
    return true if number_of_rolls.zero?

    case number_of_rolls
    when 1
      strike? || within_pin_range?(first_roll + pins)
    when 2
      spare? || double_strike? ||
        within_pin_range?(second_roll + pins)
    end
  end
end
