=begin
Write a method that takes a string as argument, and returns true if all
parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

APPROACH

examples:
( ( ( ))) ==> good
( ))( ==> bad
(() ==> bad

idea:
- convert the string to an array
- walk through the array and increment two counter variables:
    lcounter (for left parens)
    rcounter (for right parens)
- rule 1: at no point of our walkthrough should rcounter > lcounter
- rule 2: at the end of the walkthrough, lcounter should equal rcounter

=end

# my solution:

def balanced?(string)
  chars = string.chars
  lcounter = 0
  rcounter = 0

  chars.each do |char|
    lcounter += 1 if char == '('
    rcounter += 1 if char == ')'
    return false if rcounter > lcounter
  end

  return false if lcounter != rcounter

  true
end

# improvement on my solution (= Launch School solution)
# same logic, but streamlined:

# insight:
# we really only need one counter which:
# we increment the counter if we see a '('
# we decrement the counter if we see a ')'
# we break out of the loop if the counter goes below 0
# after the loop, we check if the counter is 0 and return result of check

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

# FURTHER EXPLORATION:
# account for various types of parentheses:
# square brackets, curlies, quotation marks

# now counter incrementing and decrementing becomes more tedious
# we have to account for a new situation:
# '...(...[..)...]'
# ^ not balanced, because the parentheses overlap in an unwanted way!

# idea: check for every pair of parentheses whether the string it encloses is balanced

# solution based on this idea:

def balanced?(string)
  [/\A.*\z/, /\(.*\)/, /\[.*\]/, /\{.*\}/, /\'.*\'/].all? do |pattern|
    balanced_for_all_types?(string.match(pattern).to_s)
  end
end

def balanced_for_all_types?(string)
  [%w[( )], %w[[ ]], %w[{ }], %w[' ']].all? do |type|
    balanced_for_type?(string, type)
  end
end

def balanced_for_type?(string, type)
  parens = 0

  string.each_char do |char|
    parens += 1 if char == type.first
    parens -= 1 if char == type.last
    break if parens < 0
  end

  parens.zero?
end

# this works for the test suite. but I think it should be possible to simplify it.

# so essentially, what we want to be doing is this:
# - for every type of parens (e.g. '(', '{', '['): find substring enclosed by that parens
# - check whether that substring is balanced for all the parens we account for


# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false
p balanced?('((([["{{}}"]])))') == true
# p balanced?('[]') == true
# p balanced?('(')  == false
# p balanced?('(tom is [a master) juggler]') == false
# p balanced?("(tom is 'a master) juggler'") == false
# p balanced?('((tom is [a master) juggler])') == false

# different approach):
# -- delete everything but parenthesis symbols
# -- recursively delete pairs of parentheses from inside out
# -- return 'is the result the empty string?'

def balanced?(string)
  parens = /[()\[\]{}\']/
  pairs = /\(\)|\{\}|\[\]|\'\'/
  parens_string = string.scan(parens).join
  parens_string.sub!(pairs, '') while parens_string.match(pairs)
  parens_string.empty?
end
