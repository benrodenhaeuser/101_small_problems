numbers = {
  high:   100,
  medium: 50,
  low:    10
}

p halfed_numbers = numbers.map { |_key, number| number / 2 }
# ^ note that numbers.map returns an array, not a hash!
