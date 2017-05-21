# Write a function word_unscrambler that takes two inputs: a scrambled
# word and a dictionary of real words.  Your program must then output
# all words that our scrambled word can unscramble to.
#
# Hint: To see if a string `s1` is an anagram of `s2`, split both
# strings into arrays of letters. Sort the two arrays. If they are
# equal, then they are anagrams.
#
# Difficulty: 3/5

=begin

given: a string `word`, and an array of strings `dictionary`
return value: the strings `str` in dictionary such that `str` is an anagram of `word`, collected in an array

main idea for checking anagrams:
-

algorithm details:

- given a word `word` and a list of words
  - iterate over the list of words (as 'current')
      if `current` is an anagram of `word`, select it
  - return selected

- anagram:
  given word1 and word2, if word1.chars and word2.chars result in the same array when sorted, then word1 and word2 are anagrams
=end

def anagrams?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def word_unscrambler(word, dictionary)
  dictionary.select { |entry| anagrams?(word, entry) }
end

p word_unscrambler("cat", ["tac"])

puts("\nTests for #word_unscrambler")
puts("===============================================")
    puts "word_unscrambler(\"cat\", [\"tac\"]) == [\"tac\"]: "  + (word_unscrambler("cat", ["tac"]) == ["tac"]).to_s
    puts "word_unscrambler(\"cat\", [\"tom\"]) == []: "  + (word_unscrambler("cat", ["tom"]) == []).to_s
    puts "word_unscrambler(\"cat\", [\"tic\", \"toc\", \"tac\", \"toe\"]) == [\"tac\"]: "  + (word_unscrambler("cat", ["tic", "toc", "tac", "toe"]) == ["tac"]).to_s
    puts "word_unscrambler(\"cat\", [\"scatter\", \"tac\", \"ca\"] ) == [\"tac\"]: "  + (word_unscrambler("cat", ["scatter", "tac", "ca"] ) == ["tac"]).to_s
    puts "word_unscrambler(\"turn\", [\"numb\", \"turn\", \"runt\", \"nurt\"]) == [\"turn\", \"runt\", \"nurt\"]: "  + (word_unscrambler("turn", ["numb", "turn", "runt", "nurt"]) == ["turn", "runt", "nurt"]).to_s

puts("===============================================")
