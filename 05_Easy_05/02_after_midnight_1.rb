MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  "#{sprintf('%02d', hours)}:#{sprintf('%02d', minutes)}"
end

# note that, e.g.:
# -3 % MINUTES_PER_DAY == 1437,
# because -3 / 1440 == -1
# (rather than -3 / 1440 == 0, as in some other programming languages)

p time_of_day(0) == "00:00"
p time_of_day(35) == "00:35"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-3) == "23:57"
p time_of_day(-1437) == "00:03"
p time_of_day(-4231) == "01:29"
