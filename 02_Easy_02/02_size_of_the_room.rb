# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.
# Note: 1 square meter == 10.7639 square feet

# approach:
# store user input in variables length and width
# store calculated area in square meters in variable
# store calculated area converted to square feet in variable
# format for output using format
# display output

CONV_FACTOR = 10.7639

puts "What is the length of the room in meters?"
length = gets.chomp.to_f
puts "What is the width of the room in meter?"
width = gets.chomp.to_f

size_in_sq_meters = length * width
size_in_sq_feet = sprintf("%.2f", size_in_sq_meters * CONV_FACTOR)

puts "The room size in square meters is: #{size_in_sq_meters} square meter."
puts "The room size in square feet is: #{size_in_sq_feet} square feet."
