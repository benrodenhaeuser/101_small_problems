=begin

Write a program that reads the content of a text file and then
prints the longest sentence in the file based on number of words.
Sentences may end with periods (.), exclamation points (!), or question
marks (?). Any sequence of characters that are not spaces or sentence-ending
characters should be treated as a word. You should also print the number of
words in the longest sentence.

=end

def longest_sentence(text)
  longest =
    text
      .split(/(?<=[.!?])\s/) # split into sentences
      .max_by { |sentence| sentence.split.length } # sort by number of words

  return longest, longest.split.length
end

def longest_paragraph(text)
  longest =
    text
      .split(/(\n)/) # split along line breaks
      .max_by { |sentence| sentence.split.length } # sort by number of words

  return longest, longest.split.length
end

# ^ same approach as longest_sentence, just a different regex


def get_text(path_to_file)
  File.read(path_to_file)
end

text = get_text('./pg84.txt')

paragraph, paragraph_length = longest_paragraph(text)
puts paragraph
puts "Length: #{paragraph_length} words"

# What about finding the longest word?

# Christina's solution:

def longest(separator, file)
  content = File.read file
  parts = content.split separator
  parts.max_by { |part| part.split(separator == ' ' ? '' : ' ').size }
end

# ^ if the parts are words (separator == ' '),
# then we want to split them into letters for counting

## Examples

SENTENCE = /[.!?]/
PARAGRAPH = /(\n|\n\r|\r\n){2,}/
WORD = ' '

p longest(SENTENCE, 'example.txt')
p longest(PARAGRAPH, 'example.txt')
p longest(WORD, 'example.txt')
