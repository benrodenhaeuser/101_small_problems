# with select
def missing(numbers)
  (numbers.first..numbers.last).select do |number|
    !numbers.include?(number)
  end
end

# without iterator
def missing(numbers)
  missing_numbers = []
  number = numbers.first
  while number < numbers.last
    missing_numbers << number unless numbers.include?(number)
    number += 1
  end
  missing_numbers
end

# each_cons
def missing_numbers(numbers)
  numbers.each_cons(2).with_object([]) do |(first, second), missing_numbers|
    missing_numbers < (first + 1..second - 1).to_a
  end
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
