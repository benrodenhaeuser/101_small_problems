module BookKeeping
  VERSION = 2
end

class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def self.at(hours, minutes)
    new(hours,minutes)
  end

  def initialize(hours, minutes)
    @minutes = minutes % MINUTES_PER_HOUR
    additional_hours = minutes / MINUTES_PER_HOUR
    @hours = (hours + additional_hours) % HOURS_PER_DAY
  end

  def to_s
    format(@hours) + ':' + format(@minutes)
  end

  def +(minutes)
    new(@hours, @minutes + minutes)
  end

  def ==(other_clock)
    @hours == other_clock.hours && @minutes == other_clock.minutes
  end

  protected

  attr_reader :hours, :minutes

  private

  def format(number)
    '%02d' % number
  end
end
