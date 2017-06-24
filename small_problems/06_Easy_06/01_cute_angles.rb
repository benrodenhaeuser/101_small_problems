
# method takes a float representing an angle
# returns string that represents that angle in degrees, minutes and seconds
# there are 60 minutes in a degree, and 60 seconds in a minute.

# my solution

CONVERSION_FACTOR = 60
DEGREES_IN_A_CIRCLE = 360

def dms(float_degree)
  total_in_seconds = (float_degree * (CONVERSION_FACTOR ** 2)).to_i

  seconds = total_in_seconds % CONVERSION_FACTOR
  minutes = (total_in_seconds / CONVERSION_FACTOR) % CONVERSION_FACTOR
  degrees = (total_in_seconds / CONVERSION_FACTOR ** 2) % DEGREES_IN_A_CIRCLE

  %(#{degrees}°#{format('%02d',minutes)}'#{format('%02d',seconds)}")
end

p dms(30) == %(30°00'00") # true
p dms(76.73) == %(76°43'48") # true
p dms(254.6) == %(254°36'00") # true
p dms(93.034773) == %(93°02'05") # true
p dms(0) == %(0°00'00") # true
p dms(360) == %(0°00'00") # true
p dms(720) == %(0°00'00") # true

# launch school solution

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(0°00'00")
p dms(720) == %(0°00'00")


# exploration: how to deal with negative degrees?
