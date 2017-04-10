NUMBER_WORDS =
  %w[zero, one, two, three, four, five, six, seven, eight,
     nine, ten, eleven, twelve, thirteen, fourteen, fifteen,
     sixteen, seventeen, eighteen, nineteen]

# using sort_by

def alphabetic_number_sort(array_of_numbers)
  array_of_numbers.sort_by { |number| NUMBER_WORDS[number] }
end

# using sort

def alphabetic_number_sort(array_of_numbers)
  array_of_numbers.sort do |number1, number2|
    NUMBER_WORDS[number1] <=> NUMBER_WORDS[number2]
  end
end

# test case
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
