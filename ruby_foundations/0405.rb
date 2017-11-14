items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, last_item|
  puts items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


gather(items) do |first_item, *items, last_item|
  puts first_item
  puts items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first_item, *items|
  puts first_item
  puts items.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
