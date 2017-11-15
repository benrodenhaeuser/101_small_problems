# Build a function, `morse_encode(str)` that takes in a string (no
# numbers or punctuation) and outputs the morse code for it. See
# http://en.wikipedia.org/wiki/Morse_code. Put two spaces between
# words and one space between letters.
#
# You'll have to type in morse code: I'd use a hash to map letters to
# codes. Don't worry about numbers.
#
# I wrote a helper method `morse_encode_word(word)` that handled a
# single word.
#
# Difficulty: 2/5

=begin

algorithm:

how to encode a string of words:
- given a string
- parse the string into an aray of words, using spaces as delimiters
- iterate over array of words, encoding each word in turn and saving return values to new array of encoded words
- join the array of encoded words to a string, inserting double space between each two words

how to encode a word string:
- given a word
- parse word into array of chars
- iterate over array of chars, encoding each char in turn using hash table and saving return value to new array of encoded chars
- join array of chars to a string, inserting single space between each two words

=end

MORSE = {
  a: '.-', b: '-...', c: '-.-.', d: '-..', e: '.', f: '..-.', g: '--.',
  h: '....', i: '..', j: '.---', k: '-.-', l: '.-..', m: '--', n: '-.',
  o: '---', p: '.--.', q: '--.-', r: '.-.', s: '...', t: '-', u: '..-',
  v: '...-', w: '.--', x: '-..-', y: '-.--', z: '--..'
}

def morse_encode(sentence)
  words = string.split
  sentence.map { |word| morse_encode_word(word) }.join('  ')
end

def morse_encode(word)
  chars = word.chars
  chars.map { |char| MORSE[char.to_sym] }.join(' ')
end


puts("\nTests for #morse_encode")
puts("===============================================")
    puts "morse_encode(\"q\") == \"--.-\": "  + (morse_encode("q") == "--.-").to_s
    puts "morse_encode(\"cat\") == \"-.-. .- -\": "  + (morse_encode("cat") == "-.-. .- -").to_s
    puts "morse_encode(\"cat in hat\") == \"-.-. .- -  .. -.  .... .- -\": "  + (morse_encode("cat in hat") == "-.-. .- -  .. -.  .... .- -").to_s

puts("===============================================")
