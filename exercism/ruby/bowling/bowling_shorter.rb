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
    current_is_last_frame? && current_frame.done?
  end

  def add_frame
    frames << new_empty_frame
  end

  def new_empty_frame
    (next_is_last_frame? ? FinalFrame : RegularFrame).new
  end

  def next_is_last_frame?
    frames.count == 9
  end

  def current_is_last_frame?
    frames.count == 10
  end

  def need_new_frame?
    !current_is_last_frame? && current_frame.done?
  end

  def score
    raw_score + bonus_score
  end

  def raw_score
    frames.map(&:raw_score).inject(:+)
  end

  def bonus_score
    frames.map(&:bonus_score).inject(:+)
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
    rolls.inject(0, :+)
  end

  def bonus_score
    bonus.inject(0, :+)
  end

  def strike?
    rolls.count >= 1 &&
      rolls[0] == 10
  end

  def double_strike?
    rolls.count >= 2 &&
      rolls[0] == 10 &&
      rolls[1] == 10
  end

  def spare?
    rolls.count >= 2 &&
      !strike? &&
      rolls[0] + rolls[1] == 10
  end

  def <<(pins)
    rolls << pins
  end
end

class RegularFrame < Frame
  def done?
    strike? || rolls.count == 2
  end

  def legal_roll?(pins)
    return false unless within_pin_range?(pins)
    within_pin_range?(raw_score + pins)
  end

  def need_bonus?
    strike? && @bonus.count < 2 ||
      spare? && @bonus.count < 1
  end
end

class FinalFrame < Frame
  def done?
   case strike? || spare?
   when true then rolls.count == 3
   when false then rolls.count == 2
   end
 end

  def legal_roll?(pins)
    return false unless !done? && within_pin_range?(pins)
    return true if rolls.count.zero?

    case rolls.count
    when 1
      strike? || within_pin_range?(rolls[0] + pins)
    when 2
      spare? || double_strike? ||
        within_pin_range?(rolls[1] + pins)
    end
  end
end
