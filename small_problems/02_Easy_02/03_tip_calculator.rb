# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# approach:
# get user input (bill amount and tip rate) and store in variables
# compute the tip (tip = bill_amount * tip_rate) and store in variable
# compute total amount (total = bill_amount + tip) and store in variable
# print tip and total for user

puts "What is the bill amount in dollars and cents?"
bill_amount = gets.chomp.to_f
puts "What is the tip rate in full percent?"
tip_rate = gets.chomp.to_f
tip_decimal = tip_rate / 100

tip_for_display = sprintf("%.2f", bill_amount * tip_decimal)
total_for_display = sprintf("%.2f", bill_amount + tip_for_display.to_f)

puts "The tip is $#{tip_for_display}."
puts "The total is $#{total_for_display}."
