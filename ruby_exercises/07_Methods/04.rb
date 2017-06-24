def time_of_day(boolean) # better to use a more descriptive name for the parameter
  if boolean
    puts "daytime"
  else
    puts "nighttime"
  end
end

daylight = [true, false].sample
time_of_day(daylight)
