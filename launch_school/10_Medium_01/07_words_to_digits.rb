# my solution

WORDS_TO_DIGITS = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
  'four' => '4', 'five' => '5', 'six' => '6',
  'seven' => '7', 'eight' => '8', 'nine' => '9', 'ten' => '10'
}

def word_to_digits(sentence)
  words = sentence.split(/\b/) # '\b' matches word boundaries.
  words.each_with_index do |word, index|
    words[index] = WORDS_TO_DIGITS[word] if WORDS_TO_DIGITS.include?(word)
  end.join
end

p word_to_digits('call me at ten, or at nine. the number is seven four five.')
p word_to_digits('freight')

# Launch School solution

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
