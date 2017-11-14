items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts yield(items)
  puts "Let's start gathering food."
end

gather(items) { |items| "#{items.map(&:upcase).join(', ')}" }
