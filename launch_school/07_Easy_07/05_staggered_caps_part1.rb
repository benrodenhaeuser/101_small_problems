# staggered case
def staggered_case(string)
  string.downcase.split('').map.with_index do |char, index|
    index % 2 == 0 ? char.upcase : char
  end.join
end

# further exploration
def staggered_case(string, parity: 'even')
  choice = (parity == 'even' ? 0 : 1)

  string.downcase.split('').map.with_index do |char, index|
    index % 2 == choice ? char.upcase : char
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('I Love Launch School!', parity: 'odd') == 'i lOvE LaUnCh sChOoL!'
