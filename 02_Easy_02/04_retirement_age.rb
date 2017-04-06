# ask the user for age and retirement age
# display the year in which user will retire, and number of work years left.

# approach:
# save age and retirement age in variables
# years_left_to_work = (retirement age - age)
# year_of_retirmenet = (2017 + years_left_to_work)

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

current_year = Time.now.year

years_left_to_work = retirement_age - age
year_of_retirement = (current_year + years_left_to_work)

if years_left_to_work > 0
  puts "It's #{current_year}. You will retire in #{year_of_retirement}."
  puts "You have only #{years_left_to_work} years of work to go."
elsif years_left_to_work == 0
  puts "You are retiring this year"
else
  puts "You have retired #{years_left_to_work.abs} years ago."
end
