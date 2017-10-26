class Frame
  def initialize(pins = false)
    @rolls = []
    @rolls << pins if pins
  end

  def raw_score
    @rolls.inject(:+)
  end

  def open?
    raw_score < 10
  end

  def strike?
    !open? && length == 1
  end

  def spare?
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
end

class Game
  class BowlingError < ArgumentError; end

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    # validate(pins) => one place for raising exceptions.

    raise BowlingError unless (0..10).include?(pins)

    # TODO this is crazy complicated
    raise BowlingError if !frames.empty? && frames[-1].length == 1 && !frames[-1].strike? && frames[-1].raw_score + pins > 10

    # updating frames as you make the rolls.

    @rolls << pins
  end

  def record(rolls)
    rolls.each { |pins| roll(pins) }
  end

  def frames
    index = 0
    @frames = []

    # TODO: this produces 10-12 frames
    while rolls[index]

      need_new_frame =
        @frames.empty? ||
        @frames[-1].first == 10 ||
        rolls[index] == 10 ||
        @frames[-1].length == 2

      if need_new_frame
        @frames << Frame.new(rolls[index])
      else
        @frames[-1] << rolls[index]
      end

      index += 1
    end

    @frames
  end

  def complete?
    # how do we express a complete game with 10-12 frames?
  end

  def raw_score
    rolls.inject(&:+)
  end

  def score
    # raise BowlingError unless complete?

    bonus_score = 0

    # TODO: the scoring algorithm depends on the fact that we have additional frames.
    frames[0..8].each_with_index do |frame, index|
      if frame.strike?
        if frames[index + 1].strike?
          bonus_score += frames[index + 1].raw_score + frames[index + 2].first
        else
          bonus_score += frames[index + 1].raw_score
        end
      elsif frame.spare?
        bonus_score += frames[index + 1].first
      end
    end

    raw_score + bonus_score
  end

  def to_s
    @rolls.map(&:to_s).join('  ')
  end
end

game = Game.new
game.record([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
puts game
p game.score
