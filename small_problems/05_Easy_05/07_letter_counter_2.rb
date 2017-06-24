def cleanup(string)
  string.gsub(/[^a-zA-Z\s]+/,'')
end

def word_sizes(string)
  string = cleanup(string)
  words = string.split(' ')
  counts = Hash.new { |hash, key| hash[key] = 0 }
  words.each { |word| counts[word.size] += 1 }
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
