MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_string)
  hours, minutes = time_string.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_string)
  (MINUTES_PER_DAY - after_midnight(time_string)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p after_midnight('12:34') == 754
p after_midnight('24:00') == 0

p before_midnight('12:34') == 686
p before_midnight('24:00') == 0
p before_midnight('00:00') == 0
