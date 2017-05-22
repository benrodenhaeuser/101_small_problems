# print the odd numbers from 1 to 99, each on its own line

(1..99).each { |x| puts x if x.even? }
