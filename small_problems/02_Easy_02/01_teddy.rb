# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

def generate_random_number
  (20..200).to_a.sample
  # or, using rand: rand(20..200)
end

puts "Teddy is #{generate_random_number} years old"
