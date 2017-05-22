# print the odd numbers from 1 to 99, each on its own line

(1..99).each { |x| puts x if x.odd? }

puts '---'

(1..99).select { |x| x.odd? }.each { |x| puts x }

puts '---'

1.upto(99) { |x| puts x if x.odd? }
