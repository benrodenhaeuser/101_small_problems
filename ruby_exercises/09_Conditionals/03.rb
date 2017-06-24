sun = ['visible', 'hidden'].sample

puts 'the sun is so bright!' if sun == 'visible'
puts 'clouds are blocking the sun from view' unless sun == 'visible'
