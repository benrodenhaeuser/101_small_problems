
# documentation for Hash::[] is here:
# https://ruby-doc.org/core-2.2.0/Hash.html#method-c-5B-5D

NUMS_TO_STRS =
  Hash[(0..19).zip(
      %w[zero, one, two, three, four, five, six, seven, eight,
         nine, ten, eleven, twelve, thirteen, fourteen, fifteen,
         sixteen, seventeen, eighteen, nineteen]
    )
  ]

def alphabetic_number_sort(array_of_numbers)
  true
end

# test case
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
