=begin

Write a method that returns the number of Friday the 13ths in the year passed in as an argument. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom), and you may assume that the same calendar will remain in use for the foreseeable future.

=end

JANUARYONE1752 = :sa
NEXT_DAYS = { mo: :tu, tu: :we, we: :th, th: :fr, fr: :sa, sa: :su, su: :mo}

def leap_year?(year)
  ((year % 4 == 0) && (year % 100 != 0)) || year % 400 == 0
end

def next_day(weekday)
  NEXT_DAYS[weekday]
end

def start_day_year(year)
  start_day = JANUARYONE1752
  1753.upto(year) do |the_year|
    start_day = next_day(start_day) if leap_year?(the_year - 1)
    start_day = next_day(start_day)
  end
  start_day
end

def start_days_months(year)
  start_days = [start_day = start_day_year(year)]
  days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
  days_in_months[1] = 29 if leap_year?(year)

  (0..10).each do |month|
    days_in_months[month].times { start_day = next_day(start_day) }
    start_days << start_day
  end

  p start_days
  start_days
end

def number_of_unlucky_days(year)
  start_days_months(year).reduce(0) do |result, day|
    day == :su ? result + 1 : result
  end
end

p number_of_unlucky_days(2015) == 3
p number_of_unlucky_days(1986) == 1
p number_of_unlucky_days(2019) == 2
