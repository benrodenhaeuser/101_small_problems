# each_cons (with pairs)

# example: each_cons([0, 1, 2]) will yield [0, 1], [1, 2].
# it will not yield 2 (!)

def each_cons(list)
  index = 0
  while index + 1 < list.length
    yield(list[index], list[index + 1])
    index += 1
  end
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end

p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end

p hash == {'a' => 'b'}
