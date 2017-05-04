def get_sum(a,b)
  return a if a == b
  sum = 0
  a < b ? (a..b).each { |num| sum += num } : (b..a).each { |num| sum += num }
  sum
end

p get_sum(0,1)
p get_sum(0,-1)å
p get_sum(1,2)
p get_sum(5,-1)
