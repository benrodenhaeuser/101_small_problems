# A collection of spelling blocks has two chars per block, as shown in this list:
# This limits the words you can spell with the blocks to just those words that do not
# use both chars from any given block. Each block can only be used once.
# Write a method that returns true if the word passed in as an argument can be spelled
# from this set of blocks, false otherwise.

# strings can only contain chars that occur in the block
# each char can occur only once
# for each block, only one of the two chars can be used


BLOCKS = {
  'B' => 'O',
  'X' => 'K',
  'D' => 'Q',
  'C' => 'P',
  'N' => 'A',
  'G' => 'T',
  'R' => 'E',
  'F' => 'S',
  'J' => 'W',
  'H' => 'U',
  'V' => 'I',
  'L' => 'Y',
  'Z' => 'M'
}

def block_word?(string)

  string = string.upcase
  encountered = Hash.new { |hash, key| hash[key] = false }

  string.chars.each do |char|

    return false if encountered[char] || BLOCKS[char] && string.include?(BLOCKS[char]))

    encountered[char] = true

  end

  return true

end

# this solution checks if the character occurs more than once or if the character has
# a character associated via the hash which also occurs. in both cases, we return false.

# but there is a simpler underlying logic:
# for each element of the spelling block, count the number of matching chars in the string
# if that number is < >, we want to return false. in other words, if that is the case
# for none of the elements of the spelling block, we return true. this logic can be implemented with `none?`

BLO = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  BLO.none? { |pair| string.upcase.count(pair) > 1 }
end







p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true


# how can this be simplified?
