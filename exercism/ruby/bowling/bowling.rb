class Frame
  def initialize(pins = false, terminal = false)
    @rolls = []
    @rolls << pins if pins
    @terminal = terminal
  end

  def raw_score
    @rolls.inject(:+)
  end

  def open?
    raw_score < 10
  end

  def strike? # TODO: questionable
    !open? && length == 1
  end

  def spare? # TODO: questionable
    !open? && length == 2
  end

  def <<(pins)
    @rolls << pins
  end

  def first
    @rolls[0]
  end

  def second
    @rolls[1]
  end

  def length
    @rolls.length
  end

  def to_s
    @rolls.to_s
  end

  def legal?
    legal_and_non_terminal? || legal_and_terminal?
  end

  def legal_and_non_terminal?
    (!@terminal && (0..10).include?(raw_score))
  end

  def legal_and_terminal?
    @terminal && true # TODO
  end

  # def illegal_final_frame?
  #   (@frames.last.length == 2 && @frames.last.raw_score > 10 && @frames.last.first != 10) || (@frames.last.length == 3 && (@frames.last.first != 10 && @frames.last.first + @frames.last.second != 10))
  # end

  def finished?
    @terminal && true # TODO
  end
end

class Game
  class BowlingError < ArgumentError; end

  attr_reader :frames

  def initialize
    @frames = []
  end

  def roll(pins)
    raise BowlingError unless legal_throw?(pins)

    if @frames.empty?
      @frames << Frame.new(pins)
    elsif @frames.length == 10
      @frames.last << pins
    elsif @frames.last.length == 2 || @frames.last.strike?
      if @frames.length == 9
        @frames << Frame.new(pins, true) # TODO
      else
        @frames << Frame.new(pins)
      end
    else
      @frames.last << pins
    end

    raise BowlingError unless @frames.last.legal?
  end

  def legal_throw?(pins)
    (0..10).include?(pins)
  end

  def record(rolls)
    rolls.each { |pins| roll(pins) }
  end

  def to_s
    @frames.to_s
  end

  def raw_score
    @frames.map(&:raw_score).inject(&:+)
  end

  def score
    raise BowlingError unless @frames.last.finished?

    bonus_score = 0

    @frames[0..8].each_with_index do |frame, idx|
      if frame.strike?
        if @frames[idx + 1].strike? || idx < 8
          bonus_score += @frames[idx + 1].raw_score + @frames[idx + 2].first
        else
          bonus_score += @frames[idx + 1].first + @frames[idx + 1].second
        end
      elsif frame.spare?
        bonus_score += @frames[idx + 1].first
      end
    end

    raw_score + bonus_score
  end

  def to_s
    @frames.map(&:to_s).join('  ')
  end
end
