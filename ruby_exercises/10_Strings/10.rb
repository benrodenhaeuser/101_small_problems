colors = 'blue pink yellow orange'

yellow_match = false

colors.split.each do |color|
  yellow_match = true if color == 'yellow'
end

puts yellow_match

# use String#include? instead
